Rem
Rem      Due to a probable bug in get_prefs, this script used private temporary tables
Rem
Rem      It then cannot be RAN as SYS, we then need to create a global DBA USER with the 
Rem   Following Privileges
Rem
Rem
Rem drop user C##MBOORA ;
Rem create user C##MBOORA identified by "password" container=all;
Rem grant dba to C##MBOORA container=all ;
Rem 

define liste1="METHOD_OPT,INCREMENTAL,ESTIMATE_PERCENT,CASCADE,DEGREE,OPTIONS,STALE_PERCENT"
define liste2="APPROXIMATE_NDV_ALGORITHM,AUTO_STAT_EXTENSIONS,GLOBAL_TEMP_TABLE_STATS,GRANULARITY,INCREMENTAL_LEVEL"
define liste3="INCREMENTAL_STALENESS,NO_INVALIDATE,PREFERENCE_OVERRIDES_PARAMETER,CONCURRENT"
define liste4="PUBLISH,STAT_CATEGORY,TABLE_CACHED_BLOCKS,WAIT_TIME_TO_UPDATE_STATS"

Rem Set to 'Y' to remove lines with NO HISTOGRAMS
define remove_histo=Y

set verify off
set pages 1000
set lines 200
set tab off
set recsep off
set trimspool on

col pref_code format a30 
col pref_value format a30 

prompt Global statistic collection preference
prompt ======================================
prompt

select pref_code, dbms_stats.get_prefs (pref_code) pref_value 
from (  SELECT  regexp_substr('&liste1,&liste2,&liste3,&liste4', '(,)?([^,]*)(,)?', 1, level, 'i', 2) pref_code
        FROM    dual 
        connect BY level <= regexp_count ('&liste1,&liste2,&liste3,&liste4', ',') + 1 ) 
/
prompt Per Table/Partition statistics collection preferences
prompt Remove FOR ALL COLUMNS SIZE 1 : &remove_histo
prompt =====================================================
prompt

col owner          format a10
col object_type    format a20 trunc
col object_name    format a30 trunc
col nb_histo       format 999
col subobject_name format a30 trunc
col method_opt     format a30 trunc

break on owner skip 1 on object_type on object_name


create global temporary table Q1 as 
  select
     owner
    ,object_type
    ,object_name
    ,dbms_stats.get_prefs('METHOD_OPT',owner,object_name) method_opt
  from
     dba_objects
  where
        owner in ('LIQ1','LIQ2','LIQF1','LIQF2','ACE1','SYN1','TEC')
     and object_type in ('TABLE')
/

select
     q1.owner
    ,q1.object_type
    ,q1.object_name
    ,ts.nb_histo
    ,q1.method_opt
from 
  Q1 q1
  left join (select owner, table_name,count(*) nb_histo 
             from dba_tab_col_statistics 
             where histogram != 'NONE' 
             group by owner, table_name) ts
       on   (q1.owner = ts.owner and q1.object_name = ts.table_name)
where  ('&remove_histo' = 'N' or q1.method_opt != 'FOR ALL COLUMNS SIZE 1')
order by q1.owner,q1.object_name
/

rollback ;

drop table Q1 ;



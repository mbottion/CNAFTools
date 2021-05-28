set serveroutput on
begin
  if (upper('&1') in ('USAGE','HELP','-?','-H'))
  then
    raise_application_error(-20000,'
+---------------------------------------------------------------------------------------
| Usage:
|    heatMapOPAPct.sql [start] [end] [interval]    
|   
|   extract OPA batches informations from a given period of time and present them in
|   a heatMap (percentages). The zones betwen brackets shows the expected run time for 
|   a given cases number. This script only take OPA processing time without network
|   time.
|
|   Parameters :
|       start    : Analysis start date (dd/mm/yyyy [hh24:mi:ss])      - Default : Midnight today
|       end      : Analysis end date   (dd/mm/yyyy [hh24:mi:ss])      - Default : now
|       interval : interval of cases number used to group the results - Default : 100
|       
+---------------------------------------------------------------------------------------
       ');
  end if ;
end ;
/
-- -----------------------------------------------------------------
-- paramètres
-- -----------------------------------------------------------------

define start_date_FR="case when '&1' is null then trunc(sysdate) else to_date('&1','dd/mm/yyyy hh24:mi:ss') end"
  define end_date_FR="case when '&2' is null then sysdate else to_date('&2','dd/mm/yyyy hh24:mi:ss') end"
define interval_size="case when '&3' is null then 100 else to_number('&3') end"

column "Cases" format a13      trunc
column "Calls" format a28      trunc
column " <1 s" format a12      trunc
column "1-2 s" format a12      trunc
column "2-3 s" format a12     trunc
column "3-4 s" format a12    trunc
column "4-5 s" format a12    trunc
column "5-10 s" format a12    trunc
column "10-20 s" format a12    trunc
column "20-30 s" format a12    trunc
column ">=30 s" format a10     trunc



-- -----------------------------------------------------------------
-- SQL
-- -----------------------------------------------------------------
with allHist as (
                SELECT
                    'TEC' AS SCHEMA_NAME      , INSTANCE_ENGINE_NAME     , ENGINE_NAME        , PRESTATION_NAME
                  , TASK_NUM                  , LOT_NUM                  , START_BUILD_JSON   , END_BUILD_JSON
                  , START_CALL_ENGINE         , END_CALL_ENGINE          , START_READ_JSON    , END_READ_JSON
                  , STATUS,SUMMARY            , MONTH_LEVEL              , ID_TDB_INTERFACE   , IN_JSON_OPA_SIZE_MB
                  , ROUND(dbms_lob.getlength(IN_JSON_OPA) / 1024 / 1024, 2) AS SIZE_IN_MB 
                  , ROUND(dbms_lob.getlength(OUT_JSON_OPA) / 1024 / 1024, 2) AS SIZE_OUT_MB
                FROM TEC.S_DASHBOARD_HIST_OPA
                UNION
                SELECT
                    'LIQ1' AS SCHEMA_NAME     , INSTANCE_ENGINE_NAME     , ENGINE_NAME        , PRESTATION_NAME
                  , TASK_NUM                  , LOT_NUM                  , START_BUILD_JSON   , END_BUILD_JSON
                  , START_CALL_ENGINE         , END_CALL_ENGINE          , START_READ_JSON    , END_READ_JSON
                  , STATUS,SUMMARY            , MONTH_LEVEL              , ID_TDB_INTERFACE   , IN_JSON_OPA_SIZE_MB
                  , ROUND(dbms_lob.getlength(IN_JSON_OPA) / 1024 / 1024, 2) AS SIZE_IN_MB 
                  , ROUND(dbms_lob.getlength(OUT_JSON_OPA) / 1024 / 1024, 2) AS SIZE_OUT_MB
                FROM LIQ1.S_DASHBOARD_HIST_OPA
                UNION
                SELECT
                    'LIQ2' AS SCHEMA_NAME     , INSTANCE_ENGINE_NAME     , ENGINE_NAME        , PRESTATION_NAME
                  , TASK_NUM                  , LOT_NUM                  , START_BUILD_JSON   , END_BUILD_JSON
                  , START_CALL_ENGINE         , END_CALL_ENGINE          , START_READ_JSON    , END_READ_JSON
                  , STATUS,SUMMARY            , MONTH_LEVEL              , ID_TDB_INTERFACE   , IN_JSON_OPA_SIZE_MB
                  , ROUND(dbms_lob.getlength(IN_JSON_OPA) / 1024 / 1024, 2) AS SIZE_IN_MB 
                  , ROUND(dbms_lob.getlength(OUT_JSON_OPA) / 1024 / 1024, 2) AS SIZE_OUT_MB
                FROM LIQ2.S_DASHBOARD_HIST_OPA
                UNION
                SELECT
                    'LIQF1' AS SCHEMA_NAME    , INSTANCE_ENGINE_NAME     , ENGINE_NAME        , PRESTATION_NAME
                  , TASK_NUM                  , LOT_NUM                  , START_BUILD_JSON   , END_BUILD_JSON
                  , START_CALL_ENGINE         , END_CALL_ENGINE          , START_READ_JSON    , END_READ_JSON
                  , STATUS,SUMMARY            , MONTH_LEVEL              , ID_TDB_INTERFACE   , IN_JSON_OPA_SIZE_MB
                  , ROUND(dbms_lob.getlength(IN_JSON_OPA) / 1024 / 1024, 2) AS SIZE_IN_MB
                  , ROUND(dbms_lob.getlength(OUT_JSON_OPA) / 1024 / 1024, 2) AS SIZE_OUT_MB
                FROM LIQF1.S_DASHBOARD_HIST_OPA
                UNION
                SELECT
                    'LIQF2' AS SCHEMA_NAME    , INSTANCE_ENGINE_NAME     , ENGINE_NAME        , PRESTATION_NAME
                  , TASK_NUM                  , LOT_NUM                  , START_BUILD_JSON   , END_BUILD_JSON
                  , START_CALL_ENGINE         , END_CALL_ENGINE          , START_READ_JSON    , END_READ_JSON
                  , STATUS,SUMMARY            , MONTH_LEVEL              , ID_TDB_INTERFACE   , IN_JSON_OPA_SIZE_MB
                  , ROUND(dbms_lob.getlength(IN_JSON_OPA) / 1024 / 1024, 2) AS SIZE_IN_MB 
                  , ROUND(dbms_lob.getlength(OUT_JSON_OPA) / 1024 / 1024, 2) AS SIZE_OUT_MB
                FROM LIQF2.S_DASHBOARD_HIST_OPA
                UNION
                SELECT
                    'ACE1' AS SCHEMA_NAME     , INSTANCE_ENGINE_NAME     , ENGINE_NAME        , PRESTATION_NAME
                  , TASK_NUM                  , LOT_NUM                  , START_BUILD_JSON   , END_BUILD_JSON
                  , START_CALL_ENGINE         , END_CALL_ENGINE          , START_READ_JSON    , END_READ_JSON
                  , STATUS,SUMMARY            , MONTH_LEVEL              , ID_TDB_INTERFACE   , IN_JSON_OPA_SIZE_MB
                  , ROUND(dbms_lob.getlength(IN_JSON_OPA) / 1024 / 1024, 2) AS SIZE_IN_MB 
                  , ROUND(dbms_lob.getlength(OUT_JSON_OPA) / 1024 / 1024, 2) AS SIZE_OUT_MB
                FROM ACE1.S_DASHBOARD_HIST_OPA
                UNION
                SELECT
                    'SYN1' AS SCHEMA_NAME     , INSTANCE_ENGINE_NAME     , ENGINE_NAME        , PRESTATION_NAME
                  , TASK_NUM                  , LOT_NUM                  , START_BUILD_JSON   , END_BUILD_JSON
                  , START_CALL_ENGINE         , END_CALL_ENGINE          , START_READ_JSON    , END_READ_JSON
                  , STATUS,SUMMARY            , MONTH_LEVEL              , ID_TDB_INTERFACE   , IN_JSON_OPA_SIZE_MB
                  , ROUND(dbms_lob.getlength(IN_JSON_OPA) / 1024 / 1024, 2) AS SIZE_IN_MB 
                  , ROUND(dbms_lob.getlength(OUT_JSON_OPA) / 1024 / 1024, 2) AS SIZE_OUT_MB
                FROM SYN1.S_DASHBOARD_HIST_OPA
                )
,cleanHist as (
      SELECT  /*+ PARALLEL */
         ID_TDB_INTERFACE
        ,ENGINE_NAME
        ,START_CALL_ENGINE
        ,END_CALL_ENGINE
        ,EXTRACT(SECOND FROM(END_CALL_ENGINE-START_CALL_ENGINE) DAY TO SECOND) AS TOTAL_OPA
        ,to_number(REPLACE(TRIM(SUBSTR(SUMMARY,INSTR(SUMMARY,':',1, 1)+1, INSTR(SUMMARY,'-',1, 2) -INSTR(SUMMARY,':',1, 1)-1)),',','.')) AS CasesRead
        ,to_number(REPLACE(TRIM(SUBSTR(SUMMARY,INSTR(SUMMARY,':',1, 2)+1, INSTR(SUMMARY,'-',1, 3) -INSTR(SUMMARY,':',1, 2)-1)),',','.')) AS CasesProcessed
        ,TO_NUMBER(REPLACE(TRIM(SUBSTR(SUMMARY,INSTR(SUMMARY,':',1, 3)+1, INSTR(SUMMARY,'-',1, 4) -INSTR(SUMMARY,':',1, 3)-1)),',','.')) AS CasesIgnored
        ,to_number(REPLACE(TRIM(SUBSTR(SUMMARY,INSTR(SUMMARY,':',1, 4)+1, INSTR(SUMMARY,'-',1, 5) -INSTR(SUMMARY,':',1, 4)-1)),',','.')) AS ProcessorDurationSec
        ,REPLACE(TRIM(SUBSTR(SUMMARY,INSTR(SUMMARY,':',1, 5)+1, LENGTH(SUMMARY) -INSTR(SUMMARY,':',1, 5))),',','.')                      AS ProcessorCasesPerSec
        ,summary
        ,size_in_mb
        ,size_out_mb
        ,start_build_json
      FROM  AllHist
      WHERE   STATUS ='Completed'      AND SUMMARY NOT LIKE '%ORA-%'
      AND START_BUILD_JSON >= &start_date_FR                     
      AND START_BUILD_JSON <= &end_date_FR
             )
,AllData as (
      select
         case 
           when casesRead = 0 then '00000 - 00000'
           else lpad((floor((CasesRead/&interval_size))*&interval_size),5,'0') || ' - ' || 
                lpad((floor((casesRead/&interval_size)+1)*&interval_size)-1,5,0) 
         end cases_int
        ,ch2.*
      from
        CleanHist ch2
            )
,intervTimeOPA as (
SELECT
   /*+PARALLEL */
    cases_int
   ,casesRead
   ,case
     when ProcessorDurationSec < 1  then '< 1s'
     when ProcessorDurationSec < 2  then '1-2s'
     when ProcessorDurationSec < 3  then '2-3s'
     when ProcessorDurationSec < 4  then '3-4s'
     when ProcessorDurationSec < 5  then '4-5s'
     when ProcessorDurationSec < 10 then '5-10s'
     when ProcessorDurationSec < 20 then '10-20s'
     when ProcessorDurationSec < 30 then '20-30s'
     else                     '>=30s'
    end interv_time
    ,count(*) over (partition by cases_int) CallsPerInt
    ,count(*) over () TotalCalls
FROM AllData
)
,pivotOPA as (select * from intervTimeOPA
pivot (
  count(casesRead) for interv_time in ('< 1s' as I1 ,'1-2s'  as I2 ,'2-3s' as I3 ,'3-4s' as I4 ,'4-5s' as I5 ,'5-10s' as I6 ,'10-20s' as I7 ,'20-30s' as I8 ,'>=30s' as I9 )
     )
)
select 
   all_int.cases_int "Cases"
 -- ,all_int.cases_upper_boundary
  ,case when nvl(CallsPerInt,0) = 0 then ' ' else to_char(CallsPerInt,'999G999G999G999') ||
                                                  ' (' || to_char((CallsPerInt/TotalCalls)*100,'990D99') || ' %)' end "Calls"
  ,case when cases_upper_boundary between 0 and 200 then '[' else ' ' end ||
   case when nvl(I1,0) = 0 then '          '  else  lpad(to_char(I1,'999g999'),10) end ||
   case when cases_upper_boundary between 0 and 200 then ']' else ' ' end  " <1 s"
  ,case when cases_upper_boundary between 199 and 399 then '[' else ' ' end ||
   case when nvl(I2,0) = 0 then '          '  else  lpad(to_char(I2,'999G999'),10) end ||
   case when cases_upper_boundary between 199 and 399 then ']' else ' ' end  "1-2 s"
  ,case when cases_upper_boundary between 299 and 699 then '[' else ' ' end ||
   case when nvl(I3,0) = 0 then '          '  else  lpad(to_char(I3,'999G999'),10) end ||
   case when cases_upper_boundary between 299 and 699 then ']' else ' ' end  "2-3 s"
  ,case when cases_upper_boundary between 399 and 899 then '[' else ' ' end ||
   case when nvl(I4,0) = 0 then '          '  else  lpad(to_char(I4,'999G999'),10) end ||
   case when cases_upper_boundary between 399 and 899 then ']' else ' ' end  "3-4 s"
  ,case when cases_upper_boundary between 499 and 1099 then '[' else ' ' end ||
   case when nvl(I5,0) = 0 then '          '  else  lpad(to_char(I5,'999G999'),10) end ||
   case when cases_upper_boundary between 499 and 1099 then ']' else ' ' end  "4-5 s"
  ,case when cases_upper_boundary between 599 and 1199 then '[' else ' ' end ||
   case when nvl(I6,0) = 0 then '          '  else  lpad(to_char(I6,'999G999'),10) end ||
   case when cases_upper_boundary between 599 and 1199 then ']' else ' ' end  "5-10 s"
  ,case when cases_upper_boundary between 11099 and 15000 then '[' else ' ' end ||
   case when nvl(I7,0) = 0 then '          '  else  lpad(to_char(I7,'999G999'),10) end ||
   case when cases_upper_boundary between 11099 and 15000 then ']' else ' ' end  "10-20 s"
  ,case when cases_upper_boundary between 11099 and 15000 then '[' else ' ' end ||
   case when nvl(I8,0) = 0 then '          '  else  lpad(to_char(I8,'999G999'),10) end ||
   case when cases_upper_boundary between 11099 and 15000 then ']' else ' ' end  "20-30 s"
  ,case when cases_upper_boundary between 11099 and 15000 then '[' else ' ' end ||
   case when nvl(I9,0) = 0 then '          '  else  lpad(to_char(I9,'999G999'),10) end ||
   case when cases_upper_boundary between 11099 and 15000 then ']' else ' ' end  ">=30 s"
from pivotOPA pi
right outer join (      select '00000 - 00000' cases_int , 0  cases_upper_boundary from dual
                  union select lpad((level-1)*&interval_size,5,'0') || ' - ' || lpad(((level)*&interval_size)-1,5,'0') 
                              ,level*&interval_size-1 
                        from dual connect by (level*&interval_size) <=2200
                 ) all_int on (pi.cases_int= all_int.cases_int)
UNION
select
   '==============='
  ,' '
  ,'============='
  ,'============='
  ,'============='
  ,'============='
  ,'============='
  ,'============='
  ,'============='
  ,'============='
  ,' '
from dual
UNION
select
   'Parameters'
  ,'           --->  '
  ,'Start Date :'
  ,to_char(&start_date_FR,'dd/mm/yyyy')
  ,to_char(&start_date_FR,'hh24:mi:ss')
  ,'End Date : '
  ,to_char(&end_date_FR,'dd/mm/yyyy')
  ,to_char(&end_date_FR,'hh24:mi:ss')
  ,'Interval : '
  ,to_char(&interval_size)
  ,' '
from dual
order by 1
/

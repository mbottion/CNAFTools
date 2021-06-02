define P1="&1"
define P2="&2"
define P3="&3"
define P4="&4"
define P5="&5"

set feedback off
set serveroutput on
begin
  if (upper('&P1') in ('USAGE','HELP','-?','-H'))
  then
    raise_application_error(-20000,'
+---------------------------------------------------------------------------------------
| Usage:
|    OPACallsPerMinuteINPerfs.sql [start] [end] [mode] [interval] [engine]
|   
|      Agregates OPA Execution from the dashbord and shows for each interval :
|          - Calls (packets per interval/minute)
|          - Cases (per interval/minute)
|          - Miin and max of OPA globale processing(viewed from the applications)
|          - An "old-school" graph
|
|    mode = IN  : Analyzes the injection rate by the application to OPA
|    mode = OUT : Analyses the number of cases received by the application 
|                 from OPA
|   Parameters :
|       start    : Analysis start date (dd/mm/yyyy [hh24:mi:ss])      - Default : Noon (Today or yesterday)
|       end      : Analysis end date   (dd/mm/yyyy [hh24:mi:ss])      - Default : now
|       mode     : Groups on start_engine or end engine date (IN/OUT) - Defult  : IN (Injection Rate)
|       interval : Interval wiideness (in seconds)                    - Default : 60
|       engine   : Engine name                                        - Default : %
|       
+---------------------------------------------------------------------------------------
       ');
  end if ;
end ;
/
-- -----------------------------------------------------------------
-- Parameters (use P1 -- PN, to ease script test in SQL*Dev)
-- -----------------------------------------------------------------
--
--  Analysis start date : Default (If before noon, noon yesterday, otherwise noon)
--
define start_date_FR="case when '&P1' is null then round(sysdate)-0.5 else to_date('&P1','dd/mm/yyyy hh24:mi:ss') end"
--
--  Analysis end date : default now
--
define end_date_FR="case when '&P2' is null then sysdate else to_date('&P2','dd/mm/yyyy hh24:mi:ss') end"
--
--  MOde (IN/OUT)
--
define mode="case when '&P3' is null then 'IN' else upper('&P3') end"
--
-- Case number grouping by interval
--
define interval_size="case when '&P4' is null then 60 else &P4 end"
--
--  Engine name
--
define engineName="case when '&P5' is null then '%' else '&P5' end"


define epoch="cast(to_timestamp_tz('1970-01-01 GMT', 'YYYY-MM-DD TZD') as date)"

-- -----------------------------------------------------------------
-- Columns formats
-- -----------------------------------------------------------------
column ord                 noprint
column start_period        format    a20          trunc heading "Start Period"
column end_period          format    a20          trunc heading "End Period"
column nb_calls            format    999G999      trunc heading "Calls"
column nb_calls_per_minute format    999D9        trunc heading "Calls/min"
column nb_cases            format    999G999G999  trunc heading "Cases"
column nb_cases_per_minute format    999G999      trunc heading "Cases/min"
column avg_time            format    99D9         trunc heading "Avg Time"
column max_time            format    99D9         trunc heading "Max Time"
column avg_time_bar        format    a17          trunc heading "Avg Max=60+ Sec"
column max_time_bar        format    a32          trunc heading "Max Max=120+ Sec"

break on report
compute sum label "Sums" of nb_cases nb_calls on report 

set verify on

-- -----------------------------------------------------------------
-- SQL
-- -----------------------------------------------------------------
with allHist as ( /* ********************************************************** *
                   *    Aggregate all OPA DATA from the dashboard regardless    *
                   * of the schema they come from (Application view of OPA)     *
                   * ********************************************************** */
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
,cleanHist as ( /* ********************************************************** *
                 *   Calculate needed valuses, extract data from strings      *
                 * and apply restrictions if needed                           *
                 * ********************************************************** */
      SELECT  /*+ PARALLEL */
         ID_TDB_INTERFACE
        ,ENGINE_NAME
        ,start_call_engine
        ,(trunc(start_call_engine) - &epoch)*24*3600+to_number(to_char(start_call_engine,'SSSSS')) secs_since_epoch_start_opa
        ,(trunc(  end_call_engine) - &epoch)*24*3600+to_number(to_char(  end_call_engine,'SSSSS'))   secs_since_epoch_end_opa
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
      AND ENGINE_NAME like &engineName
      )
,compl as ( /* ********************************************************** *
             *    Liste a line for each second in the period (wil         *
             *  be used to outer join the result to keep time serie)      *
             * ********************************************************** */
  select  
    ((trunc(&start_date_FR) - &epoch)*24*3600)+to_number(to_char(&start_date_FR,'SSSSS'))+level-1 secs_since_epoch -- need to be very precise (no decimal part)
   from dual 
    connect by level < (&end_date_FR - &start_date_FR)*24*3600 +1
)
,cleanHistFull as ( /* ********************************************************** *
                     *     Add lines for missing data (no cases in the second)    *
                     * ********************************************************** */
  select 
     compl.secs_since_epoch
     ,ch.*
  from
    compl compl
  left outer join cleanHist ch on (compl.secs_since_epoch = case when &mode = 'IN' then ch.secs_since_epoch_start_opa else ch.secs_since_epoch_end_opa end)
 )
,AllData as ( /* ********************************************************** *
               *     Reconvert to dates and create analysis intervals       *
               * ********************************************************** */
  SELECT
       &epoch + numtodsinterval(floor((secs_since_epoch/&interval_size))*&interval_size, 'SECOND') start_period
     , &epoch + numtodsinterval((floor((secs_since_epoch/&interval_size)+1)*&interval_size)-1, 'SECOND') end_period
    ,ch2.*
  from
    CleanHistFull ch2
  )
select
   to_char(start_period,'dd/mm/yyyy hh24:mi:ss')                                           start_period
--  ,to_char(end_period,'hh24:mi:ss')                                                       end_period
  , sum(case when secs_since_epoch_start_opa is null then 0 else 1 end)                    nb_calls            -- Count only NOT NULL VALUES
  ,sum(case when secs_since_epoch_start_opa is null then 0 else 1 end)/(&interval_size/60) nb_calls_per_minute -- Count only NOT NULL VALUES
  ,sum(casesRead)                                                                          nb_cases
  ,sum(casesRead)/(&interval_size/60)                                                      nb_cases_per_minute
  ,avg(total_opa)                                                                          avg_time
  ,max(total_opa)                                                                          max_time
  ,'.' || rpad(rpad('=',ceil(avg(total_opa)/4),'='),15,' ') || '.'                         avg_time_bar
  ,'.' || rpad(rpad('=',ceil(max(total_opa)/4),'='),30,' ') || '.'                         max_time_bar
from 
  allData
group by
   start_period
--  ,end_period
order 
  by start_period
/

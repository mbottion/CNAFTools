set serveroutput on
begin
  if (upper('&1') in ('USAGE','HELP','-?','-H'))
  then
    raise_application_error(-20000,'
+---------------------------------------------------------------------------------------
| Usage:
|    heatMapOPA.sql [start] [end] [interval] [Type]
|   
|      Extracts OPA batches informations from a given period of time and present them in
|   a heatMap (values). The zones betwen brackets shows the acceptable values for 
|   a given cases number.
|    
|      Data can be shown as rough values or percetage od total
|
|   Parameters :
|       start    : Analysis start date (dd/mm/yyyy [hh24:mi:ss])      - Default : Noon (Today or yesterday)
|       end      : Analysis end date   (dd/mm/yyyy [hh24:mi:ss])      - Default : now
|       interval : interval of cases number used to group the results - Default : 50
|       Type     : Type of display VALUES/PCT                         - Default : PCT
|       
+---------------------------------------------------------------------------------------
       ');
  end if ;
end ;
/
-- -----------------------------------------------------------------
-- Parameters
-- -----------------------------------------------------------------

--
--  Analysis start date : Default (If before noon, noon yesterday, otherwise noon)
--
define start_date_FR="case when '&1' is null then round(sysdate)-0.5 else to_date('&1','dd/mm/yyyy hh24:mi:ss') end"
--
--  Analysis end date : default now
--
  define end_date_FR="case when '&2' is null then sysdate else to_date('&2','dd/mm/yyyy hh24:mi:ss') end"
--
-- Case number grouping by interval
--
define interval_size="case when '&3' is null then 100 else to_number('&3') end"
--
--  Display Mode
--
define analysisType="case when '&4' is null then 'PCT' else upper('&4') end"


-- -----------------------------------------------------------------
-- Generic SCript - Change values to change the analysis
-- -----------------------------------------------------------------
define analysed_value="total_opa"

define maxCasesPerLot=1500

define I1_MaxVal=2
define I1_Label="< 2s"

define I2_MaxVal=5
define I2_Label="2 -5 s"

define I3_MaxVal=10
define I3_Label="5 -10s"

define I4_Label="10-20s"
define I4_MaxVal=20

define I5_MaxVal=30
define I5_Label="20-30s"

define I6_MaxVal=40
define I6_Label="30-40s"

define I7_MaxVal=50
define I7_Label="40-50s"

define I8_MaxVal=60
define I8_Label="50-60s"

define I9_MaxVal=
define I9_Label=">= 60s"

-- -----------------------------------------------------------------
-- Columns formats
-- -----------------------------------------------------------------
column "Cases"     format a13      trunc
column "Calls"     format a28      trunc
column "&I1_Label" format a12      trunc
column "&I2_Label" format a12      trunc
column "&I3_Label" format a12      trunc
column "&I4_Label" format a12      trunc
column "&I5_Label" format a12      trunc
column "&I6_Label" format a12      trunc
column "&I7_Label" format a12      trunc
column "&I8_Label" format a12      trunc
column "&I9_Label" format a10      trunc



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
,intervValueOPA as (
SELECT
   /*+PARALLEL */
    cases_int
   ,casesRead
   ,case
     when &analysed_value < 2  then '&I1_label'
     when &analysed_value < 5  then '&I2_label'
     when &analysed_value < 10 then '&I3_label'
     when &analysed_value < 20 then '&I4_label'
     when &analysed_value < 30 then '&I5_label'
     when &analysed_value < 40 then '&I6_label'
     when &analysed_value < 50 then '&I7_label'
     when &analysed_value < 60 then '&I8_label'
     else                           '&I9_label'
    end interv_value
    ,count(*) over (partition by cases_int) CallsPerInt
    ,count(*) over () TotalCalls
FROM AllData
)
,pivotOPA as (select * from intervValueOPA
pivot (
  count(casesRead) for interv_time in ('&I1_label' as I1 ,'&I2_label' as I2 ,'&I3_label' as I3 ,'&I4_label' as I4 ,'&I5_label' as I5 
                                      ,'&I6_label' as I6 ,'&I7_label' as I7 ,'&I8_label' as I8 ,'&I9_label' as I9 )
     )
)
,acceptableValues as (
  select 
     0     min_I1 , 200   max_I1
    ,199   min_I2 , 599   max_I2
    ,599   min_I3 , 1199  max_I3
    ,1099  min_I4 , 5000  max_I4
    ,11099 min_I5 , 15000 max_I5
    ,11099 min_I6 , 15000 max_I6
    ,11099 min_I7 , 15000 max_I7
    ,11099 min_I8 , 15000 max_I8
    ,11099 min_I9 , 15000 max_I9
  from dual 
)
select 
   all_int.cases_int "Cases"
--  ,all_int.cases_upper_boundary
  ,case when nvl(CallsPerInt,0) = 0 then ' ' else to_char(CallsPerInt,'999G999G999G999') ||
                                                  ' (' || to_char((CallsPerInt/TotalCalls)*100,'990D99') || ' %)' end "Calls"
   -- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
  ,case when cases_upper_boundary between min_I1 and max_I1 then '[' else ' ' end ||
   case when nvl(I1,0) = 0 then '          '  
        else  lpad(case when upper('&analysisType') = 'VALUES' then to_char(I1,'999g999')
                        else to_char(round(((I1/CallsPerInt))*100,2),'990d99') || ' % '
                   end ,10)
   end ||
   case when cases_upper_boundary between min_I1 and max_I1 then ']' else ' ' end  "&I1_label"
   -- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
  ,case when cases_upper_boundary between min_I2 and max_I2 then '[' else ' ' end ||
   case when nvl(I2,0) = 0 then '          '  
        else  lpad(case when upper('&analysisType') = 'VALUES' then to_char(I2,'999g999')
                        else to_char(round(((I2/CallsPerInt))*100,2),'990d99') || ' % '
                   end ,10)
   end ||
   case when cases_upper_boundary between min_I2 and max_I2 then ']' else ' ' end  "&I2_label"
   -- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
  ,case when cases_upper_boundary between min_I3 and max_I3 then '[' else ' ' end ||
   case when nvl(I3,0) = 0 then '          '  
        else  lpad(case when upper('&analysisType') = 'VALUES' then to_char(I3,'999g999')
                        else to_char(round(((I3/CallsPerInt))*100,2),'990d99') || ' % '
                   end ,10)
   end ||
   case when cases_upper_boundary between min_I3 and max_I3 then ']' else ' ' end  "&I3_label"
   -- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
  ,case when cases_upper_boundary between min_I4 and max_I4 then '[' else ' ' end ||
   case when nvl(I4,0) = 0 then '          '  
        else  lpad(case when upper('&analysisType') = 'VALUES' then to_char(I4,'999g999')
                        else to_char(round(((I4/CallsPerInt))*100,2),'990d99') || ' % '
                   end ,10)
   end ||
   case when cases_upper_boundary between min_I4 and max_I4 then ']' else ' ' end  "&I4_label"
   -- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
  ,case when cases_upper_boundary between min_I5 and max_I5 then '[' else ' ' end ||
   case when nvl(I5,0) = 0 then '          '  
        else  lpad(case when upper('&analysisType') = 'VALUES' then to_char(I5,'999g999')
                        else to_char(round(((I5/CallsPerInt))*100,2),'990d99') || ' % '
                   end ,10)
   end ||
   case when cases_upper_boundary between min_I5 and max_I5 then ']' else ' ' end  "&I5_label"
   -- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
  ,case when cases_upper_boundary between min_I6 and max_I6 then '[' else ' ' end ||
   case when nvl(I6,0) = 0 then '          '  
        else  lpad(case when upper('&analysisType') = 'VALUES' then to_char(I6,'999g999')
                        else to_char(round(((I6/CallsPerInt))*100,2),'990d99') || ' % '
                   end ,10)
   end ||
   case when cases_upper_boundary between min_I6 and max_I6 then ']' else ' ' end  "&I6_label"
   -- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
  ,case when cases_upper_boundary between min_I7 and max_I7 then '[' else ' ' end ||
   case when nvl(I7,0) = 0 then '          '  
        else  lpad(case when upper('&analysisType') = 'VALUES' then to_char(I7,'999g999')
                        else to_char(round(((I7/CallsPerInt))*100,2),'990d99') || ' % '
                   end ,10)
   end ||
   case when cases_upper_boundary between min_I7 and max_I7 then ']' else ' ' end  "&I7_label"
   -- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
  ,case when cases_upper_boundary between min_I8 and max_I8 then '[' else ' ' end ||
   case when nvl(I8,0) = 0 then '          '  
        else  lpad(case when upper('&analysisType') = 'VALUES' then to_char(I8,'999g999')
                        else to_char(round(((I8/CallsPerInt))*100,2),'990d99') || ' % '
                   end ,10)
   end ||
   case when cases_upper_boundary between min_I8 and max_I8 then ']' else ' ' end  "&I8_label"
   -- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
  ,case when cases_upper_boundary between min_I9 and max_I9 then '[' else ' ' end ||
   case when nvl(I9,0) = 0 then '          '  
        else  lpad(case when upper('&analysisType') = 'VALUES' then to_char(I9,'999g999')
                        else to_char(round(((I9/CallsPerInt))*100,2),'990d99') || ' % '
                   end ,10)
   end ||
   case when cases_upper_boundary between min_I9 and max_I9 then ']' else ' ' end  "&I9_label"
   -- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
from pivotOPA pi
right outer join (      select '00000 - 00000' cases_int , 0  cases_upper_boundary from dual
                  union select lpad((level-1)*&interval_size,5,'0') || ' - ' || lpad(((level)*&interval_size)-1,5,'0') 
                              ,level*&interval_size-1 
                        from dual connect by (level*&interval_size) <=2200
                 ) all_int on (pi.cases_int= all_int.cases_int)
join acceptableValues on (1=1)
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

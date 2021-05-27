set serveroutput on
begin
  if (upper('&1') in ('USAGE','HELP','-?','-H'))
  then
    raise_application_error(-20000,'
+---------------------------------------------------------------------------------------
| Usage:
|    OPARegis.sql [start] [end]    
|   
|   extract OPA batches informations
|
|   Parameters :
|       start  : Analysis start date (dd/mm/yyyy [hh24:mi:ss]) - Default : Midnight today
|       end    : Analysis end date   (dd/mm/yyyy [hh24:mi:ss]) - Default : now
|       
+---------------------------------------------------------------------------------------
       ');
  end if ;
end ;
/

define start_date="case when '&1' is null then trunc(sysdate) else to_date('&1','dd/mm/yyyy hh24:mi:ss') end"
define   end_date="case when '&2' is null then sysdate        else to_date('&2','dd/mm/yyyy hh24:mi:ss') end"

set verify on
-- -----------------------------------------------------------------
-- SQL
-- -----------------------------------------------------------------
SELECT
        /*+PARALLEL */
        ENGINE_NAME           ,
        to_char(START_CALL_ENGINE,'dd/mm/yyyy hh24:mi:ss') START_CALL_ENGINE,
        "CasesRead"           ,
        "ProcessorDurationSec",
        TOTAL_OPA
FROM
        (
                SELECT  ID_TDB_INTERFACE                                                                                                                                         ,
                        ENGINE_NAME                                                                                                                                              ,
                        START_CALL_ENGINE,
                        END_CALL_ENGINE                                                                                                                                          ,
                        EXTRACT(SECOND FROM(END_CALL_ENGINE                          -START_CALL_ENGINE) DAY TO SECOND)                                 AS TOTAL_OPA             ,
                        TO_NUMBER(REPLACE(TRIM(SUBSTR(SUMMARY,INSTR(SUMMARY,':',1, 1)+1, INSTR(SUMMARY,'-',1, 2) -INSTR(SUMMARY,':',1, 1)-1)),',','.')) AS "CasesRead"           ,
                        TO_NUMBER(REPLACE(TRIM(SUBSTR(SUMMARY,INSTR(SUMMARY,':',1, 2)+1, INSTR(SUMMARY,'-',1, 3) -INSTR(SUMMARY,':',1, 2)-1)),',','.')) AS "CasesProcessed"      ,
                        TO_NUMBER(REPLACE(TRIM(SUBSTR(SUMMARY,INSTR(SUMMARY,':',1, 3)+1, INSTR(SUMMARY,'-',1, 4) -INSTR(SUMMARY,':',1, 3)-1)),',','.')) AS "CasesIgnored"        ,
                        TO_NUMBER(REPLACE(TRIM(SUBSTR(SUMMARY,INSTR(SUMMARY,':',1, 4)+1, INSTR(SUMMARY,'-',1, 5) -INSTR(SUMMARY,':',1, 4)-1)),',','.')) AS "ProcessorDurationSec",
                        TO_NUMBER(REPLACE(TRIM(SUBSTR(SUMMARY,INSTR(SUMMARY,':',1, 5)+1, LENGTH(SUMMARY) -INSTR(SUMMARY,':',1, 5))),',','.'))           AS "ProcessorCasesPerSec"
                FROM    RDACCENTURE.V_S_DASHBOARD_HIST_OPA
                WHERE   STATUS ='Completed'
                        AND SUMMARY NOT LIKE '%ORA-%'
                        AND -- Filtre sur les traitements
                        START_BUILD_JSON >= &start_date AND START_BUILD_JSON <= &end_date
        )
ORDER BY START_CALL_ENGINE ASC
/

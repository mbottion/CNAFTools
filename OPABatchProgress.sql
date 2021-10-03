set serveroutput on
begin
  if (upper('&1') in ('USAGE','HELP','-?','-H'))
  then
    raise_application_error(-20000,'
+---------------------------------------------------------------------------------------
| Usage:
|    OPABatchProgress.sql [start] [end] [interval]    
|   
|   ACCENTURE''s request to sho batch progress
|
|   Parameters :
|       start    : Analysis start date (dd/mm/yyyy [hh24:mi:ss])      - Default : Noon (Today or yesterday)
|       end      : Analysis end   date (dd/mm/yyyy [hh24:mi:ss])      - Default : Now
|       groupe   : If HOUR, gives results per hour                    - Default : No grouping
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
define start_date_FR="case when '&1' is null then round(sysdate) -0.5 else to_date('&1','dd/mm/yyyy hh24:mi:ss') end" 
define   end_date_FR="case when '&2' is null then sysdate             else to_date('&2','dd/mm/yyyy hh24:mi:ss') end" 
define        groupe="case when '&3' is null then 'All'               else upper('&3') end"

-- ===============================
-- Dossiers chargés - % Anomalies
-- ===============================
-- Dossiers reçus + # dossiers distinct avec des anomalies

column dat_deb   format a20          heading "Date debut"
column dat_fin   format a20          heading "Date fin"
column grp_recu  format 9999         heading "Intervalle"
column nb_recu   format 999G999G999  heading "#Doss. traites"
column nb_ano    format 999G999      heading "#Doss. distincts en anomalies"
column pct_ano   format 99D99        heading "% Doss. rejetes"

break on dat_deb on dat_fin on report
compute sum of nb_recu nb_ano  on report 

WITH RECEIVE AS
        (
                SELECT  SUM(NOMBRE_DEMANDES) AS NB_RECU,
                        case 
                          when &groupe = 'HOUR' then 
                            to_char(time_creation,'dd/mm/yyyy HH24') || ':00 --> ' || to_char(time_creation+1/24,'dd/mm/yyyy HH24') || ':00'
                          else
                            'All'
                        end as grp_recu
                       ,case
                        when &groupe = 'HOUR' then
                          to_char(time_creation,'YYYYMMDDHH24') 
                        else
                          '0000'
                        end as start_grp_recu
                FROM    TEC.STG_IN_JMS
                WHERE   STATUS            ='LOADED'
                        AND TIME_CREATION between  &start_date_FR and &end_date_FR
                group by
                        case 
                          when &groupe = 'HOUR' then 
                            to_char(time_creation,'dd/mm/yyyy HH24') || ':00 --> ' || to_char(time_creation+1/24,'dd/mm/yyyy HH24') || ':00'
                          else
                            'All'
                        end
                       ,case
                        when &groupe = 'HOUR' then
                          to_char(time_creation,'YYYYMMDDHH24') 
                        else
                          '0000'
                        end
        )
        ,
        ANO AS
        (
                SELECT  NVL(COUNT(DISTINCT numeroDossier), 0) AS NB_ANO,
                        case 
                          when &groupe = 'HOUR' then 
                            to_char(time_creation,'dd/mm/yyyy HH24') || ':00 --> ' || to_char(time_creation+1/24,'dd/mm/yyyy HH24') || ':00'
                          else
                            'All'
                        end grp_ano
                       ,case
                        when &groupe = 'HOUR' then
                          to_char(time_creation,'YYYYMMDDHH24') 
                        else
                          '0000'
                        end start_grp_ano
                FROM    TEC.STG_OUT_ANO_AL,
                        JSON_TABLE (MESSAGE_JSON, '$[*]' COLUMNS ( numeroDossier NUMBER PATH '$.identificationTraitementErreur.indicateursSuiviMatriculaire.numeroDossier'))
                WHERE   TIME_CREATION between  &start_date_FR and &end_date_FR
                group by
                        case 
                          when &groupe = 'HOUR' then 
                            to_char(time_creation,'dd/mm/yyyy HH24') || ':00 --> ' || to_char(time_creation+1/24,'dd/mm/yyyy HH24') || ':00'
                          else
                            'All'
                        end
                       ,case
                        when &groupe = 'HOUR' then
                          to_char(time_creation,'YYYYMMDDHH24') 
                        else
                          '0000'
                        end
        )
SELECT  &start_date_FR                        dat_deb
       ,&end_date_FR                          dat_fin
       ,grp_recu                              
       ,T1.NB_RECU                            
       ,T2.NB_ANO                             
       ,ROUND((T2.NB_ANO/T1.NB_RECU) * 100,4) pct_ano
FROM    RECEIVE T1,
        ANO T2
where 
   t1.start_grp_recu=t2.start_grp_ano
order by start_grp_recu
/

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

break on "Date Debut" on "Date Fin"

WITH RECEIVE AS
        (
                SELECT  SUM(NOMBRE_DEMANDES) AS NB_RECU,
                        case 
                          when &groupe = 'HOUR' then 
                            to_char(time_creation,'HH24') || ':00 --> ' || to_char(time_creation+1/24,'HH24') || ':00'
                          else
                            'All'
                        end as grp_recu
                FROM    TEC.STG_IN_JMS
                WHERE   STATUS            ='LOADED'
                        AND TIME_CREATION between  &start_date_FR and &end_date_FR
                group by
                        case 
                          when &groupe = 'HOUR' then 
                            to_char(time_creation,'HH24') || ':00 --> ' || to_char(time_creation+1/24,'HH24') || ':00'
                          else
                            'All'
                        end
        )
        ,
        ANO AS
        (
                SELECT  NVL(COUNT(DISTINCT numeroDossier), 0) AS NB_ANO,
                        case 
                          when &groupe = 'HOUR' then 
                            to_char(time_creation,'HH24') || ':00 --> ' || to_char(time_creation+1/24,'HH24') || ':00'
                          else
                            'All'
                        end as grp_ano
                FROM    TEC.STG_OUT_ANO_AL,
                        JSON_TABLE (MESSAGE_JSON, '$[*]' COLUMNS ( numeroDossier NUMBER PATH '$.identificationTraitementErreur.indicateursSuiviMatriculaire.numeroDossier'))
                WHERE   TIME_CREATION between  &start_date_FR and &end_date_FR
                group by
                        case 
                          when &groupe = 'HOUR' then 
                            to_char(time_creation,'HH24') || ':00 --> ' || to_char(time_creation+1/24,'HH24') || ':00'
                          else
                            'All'
                        end
        )
SELECT  &start_date_FR                        AS "Date debut"                   ,
        &end_date_FR                          AS "Date fin"                     ,
        grp_recu                              AS "Intervalle"                   ,
        T1.NB_RECU                            AS "#Doss. traites"               ,
        T2.NB_ANO                             AS "#Doss. distincts en anomalies",
        ROUND((T2.NB_ANO/T1.NB_RECU) * 100,4) AS "% Doss. rejetes"
FROM    RECEIVE T1,
        ANO T2
where 
   t1.grp_recu=t2.grp_ano
order by 3
/

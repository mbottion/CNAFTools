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

-- ===============================
-- Dossiers chargés - % Anomalies
-- ===============================
-- Dossiers reçus + # dossiers distinct avec des anomalies

WITH RECEIVE AS
        (
                SELECT  SUM(NOMBRE_DEMANDES) AS NB_RECU
                FROM    TEC.STG_IN_JMS
                WHERE   STATUS            ='LOADED'
                        AND TIME_CREATION > TO_DATE('29/05/2021 12:00')
        )
        ,
        ANO AS
        (
                SELECT  NVL(COUNT(DISTINCT numeroDossier), 0) AS NB_ANO
                FROM    TEC.STG_OUT_ANO_AL,
                        JSON_TABLE (MESSAGE_JSON, '$[*]' COLUMNS ( numeroDossier NUMBER PATH '$.identificationTraitementErreur.indicateursSuiviMatriculaire.numeroDossier'))
                WHERE   TIME_CREATION > &start_date_FR
        )
SELECT  SYSDATE                               AS "Date comptage"                   ,
        T1.NB_RECU                            AS "#Dossiers traites"               ,
        T2.NB_ANO                             AS "#Dossiers distincts en anomalies",
        ROUND((T2.NB_ANO/T1.NB_RECU) * 100,4) AS "% Dossiers rejetes"
FROM    RECEIVE T1,
        ANO T2
/

set serveroutput on
set feedback off
begin
  if (upper('&1') in ('USAGE','HELP','-?','-H'))
  then
    raise_application_error(-20000,'
+---------------------------------------------------------------------------------------
| Usage:
|    tableauDeBord.sql [start] [end]   
|   
|   ACCENTURE''s request to follow the processing
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


col LIQ1_D  format a9      heading "LIQ1 (d)"
col LIQ1_T  format a8      heading "Duree"
col LIQ1_V  format a12     heading "d/min"
col LIQ2_D  format A9      heading "LIQ2 (d)"
col LIQ2_T  format a8      heading "Duree"
col LIQ2_V  format a12     heading "d/min"
col LIQF1_D format a9      heading "LIQF1 (d)"
col LIQF1_T format a8      heading "Duree"
col LIQF1_V format a12     heading "d/min"
col LIQF2_D format a9      heading "LIQF2 (d)"
col LIQF2_T format a8      heading "Duree"
col LIQF2_V format a12     heading "d/min"
col SYN1_D  format a9      heading "SYN1 (d)"
col SYN1_T  format a8      heading "Duree"
col SYN1_V  format a12     heading "d/min"

alter session set nls_numeric_characters=', ';

WITH tmp AS (
  SELECT
    status
   ,SUM (nombre_demandes) AS en_attente
  FROM
    tec.stg_in_jms
  WHERE
    REGEXP_LIKE (status
    ,'TO_LOAD_')
  GROUP BY
    status
),my_suivi_boucle AS (
  SELECT
    id_etape
   ,id_tdb
   ,dtd_etape          AS dtd
   ,nb_enregistrements AS dossiers
   ,CASE
      WHEN     dtf_lancement  IS NOT NULL
           AND dtd_etape_next IS NULL THEN
                lpad (EXTRACT (HOUR FROM (dtf_lancement - dtd_etape) DAY TO SECOND),2,0) || ':' || 
                lpad (EXTRACT (MINUTE FROM (dtf_lancement - dtd_etape) DAY TO SECOND),2,0) || ':' || 
                lpad (EXTRACT (SECOND FROM (dtf_lancement - dtd_etape) DAY TO SECOND),2,0)
      WHEN dtd_etape_next IS NULL THEN
                '--EN COURS--'
      ELSE
                lpad (EXTRACT (HOUR FROM (dtd_etape_next - dtd_etape) DAY TO SECOND),2,0) || ':' || 
                lpad (EXTRACT (MINUTE FROM (dtd_etape_next - dtd_etape) DAY TO SECOND),2,0) || ':' || 
                lpad (EXTRACT (SECOND FROM (dtd_etape_next - dtd_etape) DAY TO SECOND),2,0)
     END                AS temps
   ,CASE
      WHEN     dtf_lancement  IS NOT NULL
           AND dtd_etape_next IS NULL THEN
           (EXTRACT (HOUR FROM (dtf_lancement - dtd_etape) DAY TO SECOND) * 3600 + 
            EXTRACT (MINUTE FROM (dtf_lancement - dtd_etape) DAY TO SECOND) * 60 + 
            EXTRACT (SECOND FROM (dtf_lancement - dtd_etape) DAY TO SECOND)) / 60
      WHEN dtd_etape_next IS NULL THEN
           NULL
      ELSE
           (EXTRACT (HOUR FROM (dtd_etape_next - dtd_etape) DAY TO SECOND) * 3600 + 
            EXTRACT (MINUTE FROM (dtd_etape_next - dtd_etape) DAY TO SECOND) * 60 + 
            EXTRACT (SECOND FROM (dtd_etape_next - dtd_etape) DAY TO SECOND)) / 60
     END                AS minutes
  FROM
    tec.v_suivi_boucle_infos
),tdb AS (
  SELECT  /*+PARALLEL(4)*/
    t2.schema_name
   ,to_char (t1.dtd,'dd/mm hh24:mi:ss')              start_date
   ,lpad (ltrim (to_char (t1.dossiers,'999G990')),7) dossiers
   ,CASE t1.temps
      WHEN '--EN COURS--' THEN
        'RUN'
      ELSE
        NULL
     END                                              "St"
   ,CASE t1.temps
      WHEN '--EN COURS--' THEN
        ' [' || trunc ((sysdate - to_date (to_char (t1.dtd,'dd/mm/yyyy hh24:mi:ss'),'dd/mm/yyyy hh24:mi:ss')) * 24 * 60) || '+]'
      ELSE
        t1.temps
     END                                              duree
   ,CASE t1.temps
      WHEN '--EN COURS--' THEN
        '(' || ltrim (to_char (t3.en_attente,'999G990')) || ')'
      ELSE
        lpad (ltrim (to_char (round (dossiers / minutes),'999G990')),6)
     END                                              vitesse
  FROM
         my_suivi_boucle t1
    INNER JOIN tec.tdb_lancement_interface t2 ON (t2.id_lancement = t1.id_tdb)
    LEFT OUTER JOIN tmp                         t3 ON (t3.status = 'TO_LOAD_' || t2.schema_name)
  WHERE
      code_int in ('CALCUL_AL_BATCH','SYNCHRO_FOYER')
    AND t1.dtd BETWEEN &start_date_fr AND &end_date_fr
--    T2.STATUT_LANCEMENT  in ('Succes','En Cours') AND
--    AND T1.TEMPS ='--EN COURS--'
--    AND T1.TEMPS >='00:30:00'
)
SELECT
  *
FROM
  tdb PIVOT (
    MAX (dossiers)
  AS d,MAX (duree) AS t,MAX (vitesse) AS v
    FOR schema_name
    IN ('LIQ1' AS liq1,'LIQ2' AS liq2,'LIQF1' AS liqf1,'LIQF2' AS liqf2,'SYN1' AS syn1)
  )
ORDER BY
  to_date (start_date,'dd/mm hh24:mi:ss')
/

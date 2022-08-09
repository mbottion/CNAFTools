set serveroutput on
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

column liq1      format a40          heading "LIQ1"
column liq2      format a40          heading "LIQ2"
column liqf1     format a40          heading "LIQF1"
column liqf2     format a40          heading "LIQF2"

alter session set nls_numeric_characters=', ';

WITH tmp AS (
    SELECT
        status,
        SUM(nombre_demandes) AS en_attente
    FROM
        tec.stg_in_jms
    WHERE
        REGEXP_LIKE ( status,'TO_LOAD_' )
    GROUP BY
        status
), my_suivi_boucle AS (
    SELECT
        id_etape,
        id_tdb,
        dtd_etape          AS dtd,
        nb_enregistrements AS dossiers,
        CASE
            WHEN dtf_lancement IS NOT NULL
                 AND dtd_etape_next IS NULL THEN
                lpad(EXTRACT(HOUR FROM(dtf_lancement - dtd_etape) DAY TO SECOND), 2, 0)
                || ':'
                || lpad(EXTRACT(MINUTE FROM(dtf_lancement - dtd_etape) DAY TO SECOND), 2, 0)
                || ':'
                || lpad(EXTRACT(SECOND FROM(dtf_lancement - dtd_etape) DAY TO SECOND), 2, 0)
            WHEN dtd_etape_next IS NULL THEN
                '--EN COURS--'
            ELSE
                lpad(EXTRACT(HOUR FROM(dtd_etape_next - dtd_etape) DAY TO SECOND), 2, 0)
                || ':'
                || lpad(EXTRACT(MINUTE FROM(dtd_etape_next - dtd_etape) DAY TO SECOND), 2, 0)
                || ':'
                || lpad(EXTRACT(SECOND FROM(dtd_etape_next - dtd_etape) DAY TO SECOND), 2, 0)
        END                AS temps,
        CASE
            WHEN dtf_lancement IS NOT NULL
                 AND dtd_etape_next IS NULL THEN
                ( EXTRACT(HOUR FROM(dtf_lancement - dtd_etape) DAY TO SECOND) * 3600 + EXTRACT(MINUTE FROM(dtf_lancement - dtd_etape)
                DAY TO SECOND) * 60 + EXTRACT(SECOND FROM(dtf_lancement - dtd_etape) DAY TO SECOND) ) / 60
            WHEN dtd_etape_next IS NULL THEN
                NULL
            ELSE
                ( EXTRACT(HOUR FROM(dtd_etape_next - dtd_etape) DAY TO SECOND) * 3600 + EXTRACT(MINUTE FROM(dtd_etape_next - dtd_etape)
                DAY TO SECOND) * 60 + EXTRACT(SECOND FROM(dtd_etape_next - dtd_etape) DAY TO SECOND) ) / 60
        END                AS minutes
    FROM
        tec.v_suivi_boucle_infos
), tdb AS (
    SELECT  /*+PARALLEL(4)*/
--    t1.id_tdb,
        t2.schema_name,
--    code_int,
        to_char(t1.dtd, 'dd/mm/yyyy hh24:mi:ss') start_date,
--    t2.dtd_lancement,
--    t2.dtf_lancement,
        CASE t1.temps
            WHEN '--EN COURS--' THEN
                ltrim(to_char(t1.dossiers, '999G999G990'))
                || ' d '
                || ' En cours '
                || ' (Suivant : '
                || ltrim(to_char(t3.en_attente, '999G990'))
                || ')'
            ELSE
                ltrim(to_char(t1.dossiers, '999G999G990'))
                || ' d --> '
                || t1.temps
                || ' ('
                || ltrim(to_char(round(dossiers / minutes), '999G990'))
                || ' d/min)'
        END                                      info
--    t1.dossiers,
--    t1.temps,
--    t3.en_attente
    FROM
             my_suivi_boucle t1
        INNER JOIN tec.tdb_lancement_interface t2 ON ( t2.id_lancement = t1.id_tdb )
        LEFT OUTER JOIN tmp                         t3 ON ( t3.status = 'TO_LOAD_' || t2.schema_name )
    WHERE
--    T2.STATUT_LANCEMENT  in ('Succes','En Cours') AND
            code_int = 'CALCUL_AL_BATCH'
--    AND T1.TEMPS ='--EN COURS--'
        AND t1.dtd between  &start_date_FR and &end_date_FR
--    AND T1.TEMPS >='00:30:00'
)
SELECT
    *
FROM
    tdb PIVOT (
        MAX ( info )
        FOR schema_name
        IN ( 'LIQ1' AS "Liq1", 'LIQ2' AS "Liq2", 'LIQF1' AS "Liqf1", 'LIQF2' AS "Liqf2" )
    )
ORDER BY
    to_date(start_date, 'dd/mm/yyyy hh24:mi:ss')
/

exec_sql()
{
#
#  Don't forget to use : set -o pipefail un the main program to have error managempent
#
  local VERBOSE=N
  local SILENT=N
  if [ "$1" = "-silent" ]
  then 
    SILENT=Y
    shift
  fi
  if [ "$1" = "-no_error" ]
  then
    err_mgmt="whenever sqlerror continue"
    shift
  else
    err_mgmt="whenever sqlerror exit failure"
  fi
  if [ "$1" = "-verbose" ]
  then
    VERBOSE=Y
    shift
  fi
  local login="$1"
  local stmt="$2"
  local lib="$3"
  local bloc_sql="$err_mgmt
set recsep off
set head off 
set feed off
set pages 0
set lines 2000
connect ${login}
$stmt"
  REDIR_FILE=""
  REDIR_FILE=$(mktemp)
  if [ "$lib" != "" ] 
  then
     printf "%-75s : " "$lib";
     sqlplus -s /nolog >$REDIR_FILE 2>&1 <<%EOF%
$bloc_sql
%EOF%
    status=$?
  else
     sqlplus -s /nolog <<%EOF% | tee $REDIR_FILE  
$bloc_sql
%EOF%
    status=$?
  fi
  if [ $status -eq 0 -a "$(egrep "SP2-" $REDIR_FILE)" != "" ]
  then
    status=1
  fi
  if [ "$lib" != "" ]
  then
    [ $status -ne 0 ] && { echo "*** ERREUR ***" ; test -f $REDIR_FILE && cat $REDIR_FILE ; rm -f $REDIR_FILE ; } \
                      || { echo "OK" ; [ "$VERBOSE" = "Y" ] && test -f $REDIR_FILE && sed -e "s;^;    > ;" $REDIR_FILE ; }
  fi 
  rm -f $REDIR_FILE
  [ $status -ne 0 ] && return 1
  return $status
}
# - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
#     Teste un répertoire et le crée
# - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
checkDir()
{
  printf "%-75s : " "  - Existence of $1"
  if [ ! -d $1 ]
  then
    echo "Non Existent"
    printf "%-75s : " "    - Creation of $1"
    mkdir -p $1 && echo OK || { echo "*** ERROR ***" ; return 1 ; }
  else
    echo "OK"
  fi
  printf "%-75s : " "    - $1 is writable"
  [ -w $1 ] && echo OK || { echo "*** ERROR ***" ; return 1 ; }
  return 0
}

# - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
#     Trace
# - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
startRun()
{
  START_INTERM_EPOCH=$(date +%s)
  echo   "========================================================================================" 
  echo   " Demarrage de l'execution"
  echo   "========================================================================================" 
  echo   "  - $1"
  echo   "  - Demarrage a    : $(date)"
  echo   "========================================================================================" 
  echo
}
# - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
#     Trace
# - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
endRun()
{
  END_INTERM_EPOCH=$(date +%s)
  all_secs2=$(expr $END_INTERM_EPOCH - $START_INTERM_EPOCH)
  mins2=$(expr $all_secs2 / 60)
  secs2=$(expr $all_secs2 % 60 | awk '{printf("%02d",$0)}')
  echo
  echo   "========================================================================================" 
  echo   "- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - "
  echo   "  - Fin a         : $(date)" 
  echo   "  - Duree         : ${mins2}:${secs2}"
  echo   "========================================================================================" 
  echo   "Script LOG in : $LOG_FILE"
  echo   "========================================================================================" 
}
# - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
#     Trace
# - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
startStep()
{
  STEP="$1"
  STEP_START_EPOCH=$(date +%s)
  echo
  echo "       - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - "
  echo "       - Debut Etape   : $STEP"
  echo "       - Demarrage a   : $(date)" 
  echo "       - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - "
  echo
}
# - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
#     Trace
# - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
endStep()
{
  STEP_END_EPOCH=$(date +%s)
  all_secs2=$(expr $STEP_END_EPOCH - $STEP_START_EPOCH)
  mins2=$(expr $all_secs2 / 60)
  secs2=$(expr $all_secs2 % 60 | awk '{printf("%02d",$0)}')
  echo
  echo "       - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - "
  echo "       - Fin Etape     : $STEP"
  echo "       - Terminee a    : $(date)" 
  echo "       - Duree         : ${mins2}:${secs2}"
  echo "       - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - "
}
# - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
#     Abort du programme
# - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
die() 
{
  echo "
ERROR :
  $*"
  endRun
  exit 1
}

###tty -s && die "Merci de lancer ce script en NOHUP"


script=/admindb/dupdb/backup_oci/scripts/duplicate_db_oci.sh
source=prd03exa
dest=tst19c
source_pdb=BNA0PRD
dest_pdb=BNA0T19
dbid=1995892334
time="2023-01-23_08:00:00"
para=64

set -o pipefail
startRun "Duplication de $source vers $dest"
echo
echo "
    Source      : $source
    Destination : $dest
    PITR        : $time
    Parallel    : $para
"

echo "  - Positionnement environnement $dest"
[ ! -f $HOME/$dest.env ] && die "ERREUR : Fichier d'environnement introuvable"
. $HOME/$dest.env || die "Impossible de positionner l'environnement"

startStep "Duplication de la base de données"
$script -s $source -d $dest -t "$time" -i $dbid -M "${source_pdb}>${dest_pdb}" -n -p $para -F | sed -e "s;^;         ;"

[ "$(exec_sql "/ as sysdba" "select open_mode from v\$database")" != "OPEN" ] || die "La base n'est pas ouverte, abandon de la procedure"

srvctl stop database -d $ORACLE_UNQNAME || die "Impossible de stopper la base"
srvctl start database -d $ORACLE_UNQNAME || die "Impossible de lancer la base"
srvctl status service -d $ORACLE_UNQNAME
srvctl start service -d $ORACLE_UNQNAME

echo
echo "  - La base est ouverte, suite de la procedure"
echo
endStep

startStep "Parametrage de la classe de jobs"

exec_sql "/ as sysdba" "
define pdbName=$dest_pdb
alter session set container=&pdbName ;
set head on pages 200
col owner format a20
col job_class_name forma a30
col service format a20
prompt
Prompt =================================================
Prompt Etat initial
Prompt =================================================
Prompt

select owner,job_class_name,service from dba_scheduler_job_classes where job_class_name like '%NSI%';

prompt
Prompt =================================================
Prompt Ajustement du service
Prompt =================================================
prompt

set serveroutput on
alter session set current_schema=SYS ;
DECLARE
  srv_value VARCHAR2(100);
begin
  DBMS_OUTPUT.ENABLE( 1000000 ) ;
  DBMS_OUTPUT.PUT_LINE('DEBUT');
  DBMS_SCHEDULER.GET_ATTRIBUTE('BATCH_NSI_JOB_CLASS', 'SERVICE',srv_value);
  DBMS_OUTPUT.PUT_LINE('Old srv_value='||srv_value);
  DBMS_OUTPUT.PUT_LINE('Modification');
  DBMS_SCHEDULER.SET_ATTRIBUTE('BATCH_NSI_JOB_CLASS', 'SERVICE',SYS_CONTEXT('USERENV','CON_NAME')||'_BATCH') ;
 DBMS_SCHEDULER.GET_ATTRIBUTE('BATCH_NSI_JOB_CLASS', 'SERVICE',srv_value);
  DBMS_OUTPUT.PUT_LINE('New srv_value='||srv_value);
end;
/

grant execute on BATCH_NSI_JOB_CLASS to TEC ;
grant execute on BATCH_NSI_JOB_CLASS to ACE1 ;
grant execute on BATCH_NSI_JOB_CLASS to SYN1 ;
grant execute on BATCH_NSI_JOB_CLASS to LIQ1 ;
grant execute on BATCH_NSI_JOB_CLASS to LIQF1 ;
grant execute on BATCH_NSI_JOB_CLASS to LIQ2 ;
grant execute on BATCH_NSI_JOB_CLASS to LIQF2 ;


prompt
Prompt =================================================
Prompt Etat final
Prompt =================================================
Prompt
select owner,job_class_name,service from dba_scheduler_job_classes where job_class_name like '%NSI%';

col table_name format a20
col grantee format a5
col privilege format a10

select table_name,grantee,privilege from dba_tab_privs
where table_name = 'BATCH_NSI_JOB_CLASS' ;


" || die "impossible de modifier la classe de jobs"


[ "$(exec_sql "/ as sysdba" "
alter session set container=$dest_pdb ;
alter session set current_schema=SYS ;
select to_char(count(1)) 
from   dba_scheduler_job_classes 
where  job_class_name like  '%NSI%' 
and    service=upper('${dest_pdb}_batch');")" = "1" ] || die "La classe de jobs est mal paramtree"

echo 
echo "  - Tests de la classe : Lancement de 10 jobs et vérification du resultat apres 60 sec."
echo
echo "    - Lancement"

prefix="TEST_$(date +%s)"
exec_sql "/ as sysdba" "
set term on
alter session set container=$dest_pdb ;
alter session set current_schema=SYS ;
Begin
  for i in 1 .. 10 -- Nombre de jobs à lancer
  loop
    dbms_scheduler.create_job(job_name => '${prefix}_' || to_char(sysdate,'yyyymmdd_hh24miss') || '' || i
                                 ,job_type=> 'PLSQL_BLOCK'
                                 ,job_action=>'begin dbms_lock.sleep(abs(mod(dbms_random.random,20))+1) ; end ;'
                                 ,enabled=> true
                                 --
                                 --      Si les jobs ne se lancent pas, mettre en commentaire 
                                 --  le paramètre ci-dessous, pour confirmer le bon fonctionnement de 
                                 --  dbms_scheduler()
                                 --
                                 ,job_class=> 'BATCH_NSI_JOB_CLASS'
                                 ) ;
  end loop ;
end ;
/
"
echo "    - Attente 60 secondes"
sleep 60
echo "    - Verification"
v=$(exec_sql "/ as sysdba" "
alter session set container=$dest_pdb ;
alter session set current_schema=SYS ;
select to_char(count(1))
from dba_scheduler_job_run_details 
where job_name like '${prefix}%' 
and status='SUCCEEDED';") 
#[ "$v" != "10" ] && die "Erreur d'execution des jobs ($v jobs reussis)"

echo "      ==> Les jobs sont bien termines"
endStep

startStep "Positionnement des parametres de production"

exec_sql -no_error "/ as sysdba" "
--
--  Refaire les directories de DBMS_OPTIM
--
drop directory DBMS_OPTIM_LOGDIR;
drop directory DBMS_OPTIM_ADMINDIR;
DECLARE
  l_home varchar2(255);
BEGIN
 
  SYS.dbms_system.get_env('ORACLE_HOME', l_home);

  execute immediate
  'CREATE OR REPLACE DIRECTORY DBMS_OPTIM_ADMINDIR as ' ||
  sys.dbms_assert.enquote_literal(l_home||'/rdbms/admin');

  execute immediate
  'CREATE OR REPLACE DIRECTORY DBMS_OPTIM_LOGDIR as ' ||
  sys.dbms_assert.enquote_literal(l_home||'/cfgtoollogs');
END;
/
@\$ORACLE_HOME/rdbms/admin/utlfixdirs.sql

--
--  Tous les fix controls activés
--
alter system reset \"_fix_control_\" scope=both ;
ALTER SYSTEM set \"_fix_control\"='27268249:0','5909305:OFF' scope=both ;
Set serveroutput on
execute dbms_optim_bundle.enable_optim_fixes('ON','BOTH', 'YES') ;

--
-- Paramètres DB
--


alter system set \"_adaptive_window_consolidator_enabled\" = false scope=both ;
alter system set \"_lm_res_hash_bucket\" = 32768 scope=spfile ;
alter system set control_file_record_keep_time = 39 scope=both ;
alter system set db_block_checking = MEDIUM scope=both ;
alter system set ddl_lock_timeout = 30 scope=both ;
alter system reset dml_locks scope=spfile ;
alter system set enable_ddl_logging=TRUE scope=both ;
alter system set inmemory_automatic_level=MEDIUM scope=both ;
alter system set inmemory_size = 20G  scope=spfile ;
alter system set inmemory_virtual_columns=ENABLE scope=both ;
alter system set open_cursors = 2000  scope=spfile ;
alter system set parallel_force_local = TRUE  scope=both ;
alter system set pre_page_sga=FALSE scope=spfile ;
alter system set processes=4000 scope=spfile ;
alter system set recyclebin = off  scope=spfile ;
alter system set sga_max_size = 200G  scope=spfile ;
alter system set sga_target = 200G  scope=spfile ;
alter system set pga_aggregate_limit=0  scope=both ;
alter system set pga_aggregate_target=100G  scope=both ;
alter system set \"_lm_share_lock_opt\"=false scope=spfile ;


"

endStep

startStep "Arret/Relance"
echo "  - Arret"
srvctl stop database -d $ORACLE_UNQNAME || die "Impossible de stopper la base"
echo "    ==> OK"
echo "  - Relance"
srvctl start database -d $ORACLE_UNQNAME || die "Impossible de relancer la base"
echo "    ==> OK"
endStep

startStep "Parametrage OPA"

exec_sql -no_error "/ as sysdba" "
define pdbName=$dest_pdb
alter session set container=$dest_pdb ;
alter session set current_schema=SYS ;
set echo on
BEGIN
   DBMS_NETWORK_ACL_ADMIN.DROP_ACL(
      acl => '/sys/acls/utl_http_CNAF_OPA_&pdbName..xml');
END;
/

BEGIN
  DBMS_NETWORK_ACL_ADMIN.CREATE_ACL(
     acl          => '/sys/acls/utl_http_CNAF_OPA_&pdbName..xml',
     description  => 'OPA Access &pdbName',
     principal    => 'TEC',
     is_grant     => TRUE,
     privilege    => 'connect');
END;
/

BEGIN
  DBMS_NETWORK_ACL_ADMIN.ADD_PRIVILEGE(
        acl         => '/sys/acls/utl_http_CNAF_OPA_&pdbName..xml',
        principal   => 'TEC',
        is_grant    =>  TRUE,
        privilege   => 'use-client-certificates',
                start_date => null,
                end_date => null);
END;
/

BEGIN
   DBMS_NETWORK_ACL_ADMIN.ASSIGN_ACL(
       acl => '/sys/acls/utl_http_CNAF_OPA_&pdbName..xml',
       host => 'caf-france-opa2-met.custhelp.com',
       lower_port => 443,
       upper_port => 443);
END;
/

set SERVEROUTPUT on

BEGIN
  for s in (SELECT DISTINCT SCHEMA_NAME FROM TEC.P_PARAM_SCHEMA_DISP)
  loop
    dbms_output.put_line ('ACL pour : ' || s.schema_name ) ;
    DBMS_NETWORK_ACL_ADMIN.ADD_PRIVILEGE(
          acl         => '/sys/acls/utl_http_CNAF_OPA_&pdbName..xml',
          principal   => s.schema_name,
          is_grant    =>  TRUE,
          privilege   => 'use-client-certificates',
                  start_date => null,
                  end_date => null);
    DBMS_NETWORK_ACL_ADMIN.ADD_PRIVILEGE(
          acl         => '/sys/acls/utl_http_CNAF_OPA_&pdbName..xml',
          principal   => s.schema_name,
          is_grant    =>  TRUE,
          privilege   => 'connect',
                  start_date => null,
                  end_date => null);
  end loop ;
END;
/

-- ===============================================================
-- Mise à jour des URL OPA en Métrologie aprés un refresh de PROD
-- ===============================================================
-- Régis Decaux 03/12/2021
-- ===============================================================
alter session set current_schema=tec ;
Declare

    vSql VARCHAR2(200); 
    CURSOR CR IS SELECT DISTINCT SCHEMA_NAME FROM TEC.P_PARAM_SCHEMA_DISP union select 'TEC' from dual; 
    
BEGIN

FOR vRec IN CR LOOP
    dbms_output.put_line (' ');
    dbms_output.put_line ('Parametres OPA pour : ' || vRec.schema_name) ;
    vSql :='ALTER SESSION SET CURRENT_SCHEMA ='    || vRec.schema_name;
    EXECUTE IMMEDIATE vSql;
    dbms_output.put_line ('Current schema      : ' || sys_context('userenv','current_schema')) ;
    UPDATE P_PARAM_OPA SET STR_VALUE= REPLACE(STR_VALUE,'caf-france-opa2.custhelp.com','caf-france-opa2-met.custhelp.com')
    where NAME ='URL' AND TYPE IN('URL_OPA','URL_TOKEN_OPA','HTTP_OPA','URL_HUB_OPA_ABOUT');
    COMMIT;
    --
    -- MOdifie pour réentrance
    --
    UPDATE P_PARAM_OPA SET STR_VALUE= REPLACE(STR_VALUE,'-mt/assessor','/assessor')
    where NAME ='URL' AND TYPE IN('URL_OPA','URL_TOKEN_OPA','HTTP_OPA');
    UPDATE P_PARAM_OPA SET STR_VALUE= REPLACE(STR_VALUE,'/assessor','-mt/assessor')
    where NAME ='URL' AND TYPE IN('URL_OPA','URL_TOKEN_OPA','HTTP_OPA');

    --
    --    MOts de passes
    --
    UPDATE P_PARAM_OPA SET STR_VALUE= '133E7CD9648F0E4F2A8616E4D61DD58B80A2504242C24617'
    where NAME ='PWD_WALLET' AND TYPE IN('URL_OPA','URL_TOKEN_OPA','HTTP_OPA');

    UPDATE P_PARAM_OPA SET STR_VALUE= '5932D45FA86DA065E077D2B8FE8ED680D081D4B74AA75531321D6C3A9F61C35C'
    where NAME ='PWD' AND TYPE IN('URL_OPA','URL_TOKEN_OPA','HTTP_OPA');

    --
    -- Emplacement Wallet
    --
    UPDATE P_PARAM_OPA SET STR_VALUE= '/admindb/wallet/opa_certificat/tst2'
    where NAME ='PATH_WALLET' AND TYPE IN('URL_OPA','URL_TOKEN_OPA','HTTP_OPA');
    
    COMMIT; 
END LOOP;

END;
/
column engine_name format a30
column prestation_name format a5
column type format a20
column contenttype format a20
column str_value format a130


select * from tec.p_param_opa ;
select * from tec.p_param_opa where name in ('URL','PATH_WALLET') ;
"

echo
echo "  - Verifications"
echo
echo "    - URLs"
n=$(exec_sql "/ as sysdba" "
alter session set container=$dest_pdb ;
alter session set current_schema=SYS ;
select to_char(count(1)) 
from (      select * from TEC.P_PARAM_OPA
      union select * from LIQ1.P_PARAM_OPA
      union select * from LIQ2.P_PARAM_OPA
      union select * from LIQF1.P_PARAM_OPA
      union select * from LIQF2.P_PARAM_OPA
      union select * from SYN1.P_PARAM_OPA
      union select * from ACE1.P_PARAM_OPA)
where 
  NAME ='URL' AND TYPE IN('URL_OPA','URL_TOKEN_OPA','HTTP_OPA','URL_HUB_OPA_ABOUT')
  and STR_VALUE not like '%caf-france-opa2-met.custhelp.com%'
/
")
  [ "$n" != "0" ] && die "Erreur de parametrage des URL, ($n url incorrects)"
echo "      ==> URL Correctement modifiees"
echo
echo "    - Wallets"
n=$(exec_sql "/ as sysdba" "
alter session set container=$dest_pdb ;
alter session set current_schema=SYS ;
select to_char(count(1)) 
from (      select * from TEC.P_PARAM_OPA
      union select * from LIQ1.P_PARAM_OPA
      union select * from LIQ2.P_PARAM_OPA
      union select * from LIQF1.P_PARAM_OPA
      union select * from LIQF2.P_PARAM_OPA
      union select * from SYN1.P_PARAM_OPA
      union select * from ACE1.P_PARAM_OPA)
where 
  NAME ='PATH_WALLET' AND TYPE IN('URL_OPA','URL_TOKEN_OPA','HTTP_OPA')
  and STR_VALUE not like '%tst2%'
/
")
  [ "$n" != "0" ] && die "Erreur de parametrage des WALLETS, ($n wallets incorrects)"
  echo "      ==> URL Wallets correctement modifies"

  echo 
  echo "  - lancement de la reinitialisation des schemas"

exec_sql "/ as sysdba" "
alter session set container=$dest_pdb ;
alter session set current_schema=SYS ;
set feed on
Prompt Lancement REINIT BATCHES
Prompt
begin
    dbms_scheduler.create_job(job_name => 'START_REINIT_' || to_char(sysdate,'yyyymmdd_hh24miss') 
                                 ,job_type=> 'PLSQL_BLOCK'
                                 ,job_action=>'

DECLARE
-- Declarations
l_PPURGE_STG_IN_JMS VARCHAR2 (1);
l_PPURGE_STG_OUT_JMS VARCHAR2 (1);
l_PCALCUL_STAT VARCHAR2 (1);
BEGIN
-- Initialization
l_PPURGE_STG_IN_JMS := ''N'';
l_PPURGE_STG_OUT_JMS := ''N'';
l_PCALCUL_STAT := ''Y'';



-- Call
TEC.PKG_TOOLS_ADMIN.PR_MAIN_PURGE_DROPPART_STAT (
PPURGE_STG_IN_JMS => l_PPURGE_STG_IN_JMS,
PPURGE_STG_OUT_JMS => l_PPURGE_STG_OUT_JMS,
PCALCUL_STAT => l_PCALCUL_STAT);



-- Transaction Control
COMMIT;
END;'
                                 ,enabled=> true
                                 --
                                 --      Si les jobs ne se lancent pas, mettre en commentaire
                                 --  le paramètre ci-dessous, pour confirmer le bon fonctionnement de
                                 --  dbms_scheduler()
                                 --
                                 ,job_class=> 'BATCH_NSI_JOB_CLASS'
                                 ) ;
end ;
/
"  || die "Erreur de lancement de la reinitialisation des batches"

  echo 
  echo "  - Activation des comptes ACCENTURE"

exec_sql "/ as sysdba" "
alter session set container=$dest_pdb ;
alter user rdaccenture account unlock ;
grant dba to rdaccenture ;
alter user gmaccenture account unlock ;
grant dba to gmaccenture ;"

  echo 
  echo "  - Retention a 5 jours et positionnement de la retention des AL a NONE"
  echo 
exec_sql "/ as sysdba" "
alter system set db_flashback_retention_target=7200 scope=both ;
"
  echo "
configure archivelog deletion policy to none ;
CONFIGURE RETENTION POLICY TO RECOVERY WINDOW OF 5 DAYS;
delete archivelog all ;
yes
show all ;
" | rman target /
  echo
  echo "  - Attente 60 sec"
sleep 60
  echo
  echo "  - Etat reinit"
  echo
exec_sql "/ as sysdba" "
alter session set container=$dest_pdb ;
alter session set current_schema=SYS ;
col CODE_INT format a20
col id_etape format 999999999
col nom_etape format a30
col dtd_etape format a30
col dtf_etape format a30
col duree format a30
set head on pages 200
alter session set nls_date_format='dd/mm/yyyy hh24:mi:ss';
SELECT T2.CODE_INT, T2.SCHEMA_NAME, ID_ETAPE, NOM_ETAPE, DTD_ETAPE, DTF_ETAPE, (DTF_ETAPE - DTD_ETAPE) AS DUREE
FROM TEC.TDB_LANCEMENT_INTERFACE_ETAPE T1
INNER JOIN TEC.TDB_LANCEMENT_INTERFACE T2 ON (T1.ID_TDB = T2.ID_LANCEMENT)
WHERE
T2.CODE_INT ='REINIT_BATCH_OPA'
and DTD_ETAPE > systimestamp - 1
ORDER BY T2.SCHEMA_NAME, T1.ID_ETAPE DESC;
"

echo "
==========================================================================================

Reinitialisation en cours, la base sera disponble lorsque la reinit sera terminee.

POur vérifier l'avancement, utiliser :

. \$HOME/$dest.env ; echo \"alter session set container=$dest_pdb ;
alter session set current_schema=SYS ;
col CODE_INT format a20
col id_etape format 999999999
col nom_etape format a30
col dtd_etape format a30
col dtf_etape format a30
col duree format a30
set head on pages 200 lines 200
alter session set nls_date_format='dd/mm/yyyy hh24:mi:ss';
SELECT T2.CODE_INT, T2.SCHEMA_NAME, ID_ETAPE, NOM_ETAPE, DTD_ETAPE, DTF_ETAPE, (DTF_ETAPE - DTD_ETAPE) AS DUREE
FROM TEC.TDB_LANCEMENT_INTERFACE_ETAPE T1
INNER JOIN TEC.TDB_LANCEMENT_INTERFACE T2 ON (T1.ID_TDB = T2.ID_LANCEMENT)
WHERE
T2.CODE_INT ='REINIT_BATCH_OPA'
and DTD_ETAPE > systimestamp - 1
ORDER BY T2.SCHEMA_NAME, T1.ID_ETAPE DESC;\" | sqlplus / as sysdba

==========================================================================================
"

endStep

endRun

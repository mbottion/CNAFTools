die() { echo $* ; rm -rf $$.script ; exit 1 ; }

usage()
{
  echo "getAllDDL PDB"
  exit 1
}
[ "$1" = "" ] && usage 
PDB=${1^^}
d=$(date +%Y%m%d_%H%M%S)
DIR="DDL_$d"
mkdir -p $DIR || die "Unable to create dir"
for s in TEC LIQ1 LIQ2 LIQF1 LIQF2 SYN1 ACE1
do
  mkdir -p $DIR/$s
  echo "Extractiong DDL for $s ......" 
sqlplus -s / as sysdba >/dev/null <<%% || { [ -f $DIR/$s/full.sql ] && tail -40  $DIR/$s/full.sql ; die "SQL Error when processing $s" ; }
whenever sqlerror exit failure

set long 100000
set head off
set echo off
set pagesize 0
set verify off
set feedback off
col file_name format a50 newline
alter session set container=$PDB ;

spool $DIR/$s/full.sql

set long 999999999

select 'OUTFILE $DIR/' || owner || '/' || object_type || '_' || lower(object_name) || '.sql' filename , dbms_metadata.get_ddl(object_type, object_name, owner)
from
(
    --Convert DBA_OBJECTS.OBJECT_TYPE to DBMS_METADATA object type:
    select
        owner,
        --Java object names may need to be converted with DBMS_JAVA.LONGNAME.
        --That code is not included since many database don't have Java installed.
        object_name,
        decode(object_type,
            'DATABASE LINK',      'DB_LINK',
            'JOB',                'PROCOBJ',
            'RULE SET',           'PROCOBJ',
            'RULE',               'PROCOBJ',
            'EVALUATION CONTEXT', 'PROCOBJ',
            'CREDENTIAL',         'PROCOBJ',
            'CHAIN',              'PROCOBJ',
            'PROGRAM',            'PROCOBJ',
            'PACKAGE',            'PACKAGE_SPEC',
            'PACKAGE BODY',       'PACKAGE_BODY',
            'TYPE',               'TYPE_SPEC',
            'TYPE BODY',          'TYPE_BODY',
            'MATERIALIZED VIEW',  'MATERIALIZED_VIEW',
            'QUEUE',              'AQ_QUEUE',
            'JAVA CLASS',         'JAVA_CLASS',
            'JAVA TYPE',          'JAVA_TYPE',
            'JAVA SOURCE',        'JAVA_SOURCE',
            'JAVA RESOURCE',      'JAVA_RESOURCE',
            'XML SCHEMA',         'XMLSCHEMA',
            object_type
        ) object_type
    from dba_objects 
    where owner in ('$s')
        --These objects are included with other object types.
        and object_type not in ('INDEX PARTITION','INDEX SUBPARTITION',
           'LOB','LOB PARTITION','TABLE PARTITION','TABLE SUBPARTITION')
        --Ignore system-generated types that support collection processing.
        and not (object_type = 'TYPE' and object_name like 'SYS_PLSQL_%')
        --Exclude nested tables, their DDL is part of their parent table.
        and (owner, object_name) not in (select owner, table_name from dba_nested_tables)
        --Exclude overflow segments, their DDL is part of their parent table.
        and (owner, object_name) not in (select owner, table_name from dba_tables where iot_type = 'IOT_OVERFLOW')
        and not (object_type='SEQUENCE' and object_name like '%ISEQ%')
        and object_type not in ('JOB','RULE SET','RULE','EVALUATION CONTEXT','CREDENTIAL','CHAIN','PROGRAM') 
        --and object_name like 'PKG_SYNCHRO%'
)
order by owner, object_type, object_name;

spool off
quit
%%
  cat $DIR/$s/full.sql  |  awk '
BEGIN {outfile="'$DIR/$s'/null.txt"}
/OUTFILE/ {
  outfile=$2 
  printf("       --> Generating : %s\n",$2)
  next
}
{ print >> outfile }
'
[ $? -ne 0 ] && die "Transformation Error"

done
tar cvzf DDL_${PDB}_${d}.tgz $DIR && rm -rf $DIR
echo "DDL stored into : DDL_${PDB}_${d}.tgz"

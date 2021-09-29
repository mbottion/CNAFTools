set feedback off
col 1 new_value 1
select null "1" from dual where 1=2 ;
set define !
set verify off
whenever sqlerror exit failure
declare
dummy number ;
begin
select 1 into dummy FROM DUAL where SYS_CONTEXT('USERENV', 'CON_NAME') = 'CDB$ROOT';
exception when no_data_found then
raise_application_error(-20001,'This script must be run from the CDB$ROOT container');
end ;
/
set lines 500 trimout on trimspool on pages 2000 tab off
column name format a40
column value format a40

      select null INST_ID ,null NAME,null VALUE,null VALUE_PRD01EXA from dual where 1=2
UNION select null INST_ID ,null NAME,null VALUE,null VALUE_PRD01EXA from dual where 1=2
UNION select 9,name,value$,'4000 (BNA0PRD)' from pdb_spfile$ where name = 'job_queue_processes' and nvl(value$,'$$@@$$') != nvl('4000','$$@@$$') and pdb_uid = (select con_uid from v$pdbs where name=nvl(upper('!1'),'@X@'))
UNION select 9,'job_queue_processes','  *** Not Set in PDB ***','4000 (BNA0PRD)' from dual where not exists (select 1 from pdb_spfile$  where name = 'job_queue_processes' and pdb_uid = (select con_uid from v$pdbs where name=nvl(upper('!1'),'@X@')))
UNION select 9,name,value$,'4500 (BNA0PRD)' from pdb_spfile$ where name = 'undo_retention' and nvl(value$,'$$@@$$') != nvl('4500','$$@@$$') and pdb_uid = (select con_uid from v$pdbs where name=nvl(upper('!1'),'@X@'))
UNION select 9,'undo_retention','  *** Not Set in PDB ***','4500 (BNA0PRD)' from dual where not exists (select 1 from pdb_spfile$  where name = 'undo_retention' and pdb_uid = (select con_uid from v$pdbs where name=nvl(upper('!1'),'@X@')))
UNION select 9,name,value$,'TRUE (BNA0PRD)' from pdb_spfile$ where name = 'awr_pdb_autoflush_enabled' and nvl(value$,'$$@@$$') != nvl('TRUE','$$@@$$') and pdb_uid = (select con_uid from v$pdbs where name=nvl(upper('!1'),'@X@'))
UNION select 9,'awr_pdb_autoflush_enabled','  *** Not Set in PDB ***','TRUE (BNA0PRD)' from dual where not exists (select 1 from pdb_spfile$  where name = 'awr_pdb_autoflush_enabled' and pdb_uid = (select con_uid from v$pdbs where name=nvl(upper('!1'),'@X@')))
UNION select inst_id,name,value || case isdefault when 'FALSE' then ' (SPFILE)' else null end,' (Def)' from gv$parameter where name = 'active_instance_count' and inst_id=1 and (nvl(value,'$$@@$$') != nvl('','$$@@$$') or isdefault != 'TRUE')
-- ----
UNION select inst_id,name,value || case isdefault when 'FALSE' then ' (SPFILE)' else null end,' (Def)' from gv$parameter where name = 'active_instance_count' and inst_id=2 and (nvl(value,'$$@@$$') != nvl('','$$@@$$') or isdefault != 'TRUE')
-- ----
UNION select inst_id,name,value || case isdefault when 'FALSE' then ' (SPFILE)' else null end,' (Def)' from gv$parameter where name = 'asm_diskstring' and inst_id=1 and (nvl(value,'$$@@$$') != nvl('','$$@@$$') or isdefault != 'TRUE')
-- ----
UNION select inst_id,name,value || case isdefault when 'FALSE' then ' (SPFILE)' else null end,' (Def)' from gv$parameter where name = 'asm_diskstring' and inst_id=2 and (nvl(value,'$$@@$$') != nvl('','$$@@$$') or isdefault != 'TRUE')
-- ----
UNION select inst_id,name,value || case isdefault when 'FALSE' then ' (SPFILE)' else null end,' (Def)' from gv$parameter where name = 'asm_preferred_read_failure_groups' and inst_id=1 and (nvl(value,'$$@@$$') != nvl('','$$@@$$') or isdefault != 'TRUE')
-- ----
UNION select inst_id,name,value || case isdefault when 'FALSE' then ' (SPFILE)' else null end,' (Def)' from gv$parameter where name = 'asm_preferred_read_failure_groups' and inst_id=2 and (nvl(value,'$$@@$$') != nvl('','$$@@$$') or isdefault != 'TRUE')
-- ----
UNION select inst_id,name,value || case isdefault when 'FALSE' then ' (SPFILE)' else null end,' (Def)' from gv$parameter where name = 'audit_syslog_level' and inst_id=1 and (nvl(value,'$$@@$$') != nvl('','$$@@$$') or isdefault != 'TRUE')
-- ----
UNION select inst_id,name,value || case isdefault when 'FALSE' then ' (SPFILE)' else null end,' (Def)' from gv$parameter where name = 'audit_syslog_level' and inst_id=2 and (nvl(value,'$$@@$$') != nvl('','$$@@$$') or isdefault != 'TRUE')
-- ----
UNION select inst_id,name,value || case isdefault when 'FALSE' then ' (SPFILE)' else null end,' (Def)' from gv$parameter where name = 'buffer_pool_keep' and inst_id=1 and (nvl(value,'$$@@$$') != nvl('','$$@@$$') or isdefault != 'TRUE')
-- ----
UNION select inst_id,name,value || case isdefault when 'FALSE' then ' (SPFILE)' else null end,' (Def)' from gv$parameter where name = 'buffer_pool_keep' and inst_id=2 and (nvl(value,'$$@@$$') != nvl('','$$@@$$') or isdefault != 'TRUE')
-- ----
UNION select inst_id,name,value || case isdefault when 'FALSE' then ' (SPFILE)' else null end,' (Def)' from gv$parameter where name = 'buffer_pool_recycle' and inst_id=1 and (nvl(value,'$$@@$$') != nvl('','$$@@$$') or isdefault != 'TRUE')
-- ----
UNION select inst_id,name,value || case isdefault when 'FALSE' then ' (SPFILE)' else null end,' (Def)' from gv$parameter where name = 'buffer_pool_recycle' and inst_id=2 and (nvl(value,'$$@@$$') != nvl('','$$@@$$') or isdefault != 'TRUE')
-- ----
UNION select inst_id,name,value || case isdefault when 'FALSE' then ' (SPFILE)' else null end,' (Def)' from gv$parameter where name = 'cdb_cluster_name' and inst_id=1 and (nvl(value,'$$@@$$') != nvl('','$$@@$$') or isdefault != 'TRUE')
-- ----
UNION select inst_id,name,value || case isdefault when 'FALSE' then ' (SPFILE)' else null end,' (Def)' from gv$parameter where name = 'cdb_cluster_name' and inst_id=2 and (nvl(value,'$$@@$$') != nvl('','$$@@$$') or isdefault != 'TRUE')
-- ----
UNION select inst_id,name,value || case isdefault when 'FALSE' then ' (SPFILE)' else null end,' (Def)' from gv$parameter where name = 'cell_offload_parameters' and inst_id=1 and (nvl(value,'$$@@$$') != nvl('','$$@@$$') or isdefault != 'TRUE')
-- ----
UNION select inst_id,name,value || case isdefault when 'FALSE' then ' (SPFILE)' else null end,' (Def)' from gv$parameter where name = 'cell_offload_parameters' and inst_id=2 and (nvl(value,'$$@@$$') != nvl('','$$@@$$') or isdefault != 'TRUE')
-- ----
UNION select inst_id,name,value || case isdefault when 'FALSE' then ' (SPFILE)' else null end,' (Def)' from gv$parameter where name = 'cell_offloadgroup_name' and inst_id=1 and (nvl(value,'$$@@$$') != nvl('','$$@@$$') or isdefault != 'TRUE')
-- ----
UNION select inst_id,name,value || case isdefault when 'FALSE' then ' (SPFILE)' else null end,' (Def)' from gv$parameter where name = 'cell_offloadgroup_name' and inst_id=2 and (nvl(value,'$$@@$$') != nvl('','$$@@$$') or isdefault != 'TRUE')
-- ----
UNION select inst_id,name,value || case isdefault when 'FALSE' then ' (SPFILE)' else null end,' (Def)' from gv$parameter where name = 'circuits' and inst_id=1 and (nvl(value,'$$@@$$') != nvl('','$$@@$$') or isdefault != 'TRUE')
-- ----
UNION select inst_id,name,value || case isdefault when 'FALSE' then ' (SPFILE)' else null end,' (Def)' from gv$parameter where name = 'circuits' and inst_id=2 and (nvl(value,'$$@@$$') != nvl('','$$@@$$') or isdefault != 'TRUE')
-- ----
UNION select inst_id,name,value || case isdefault when 'FALSE' then ' (SPFILE)' else null end,' (Def)' from gv$parameter where name = 'clonedb_dir' and inst_id=1 and (nvl(value,'$$@@$$') != nvl('','$$@@$$') or isdefault != 'TRUE')
-- ----
UNION select inst_id,name,value || case isdefault when 'FALSE' then ' (SPFILE)' else null end,' (Def)' from gv$parameter where name = 'clonedb_dir' and inst_id=2 and (nvl(value,'$$@@$$') != nvl('','$$@@$$') or isdefault != 'TRUE')
-- ----
UNION select inst_id,name,value || case isdefault when 'FALSE' then ' (SPFILE)' else null end,' (Def)' from gv$parameter where name = 'commit_logging' and inst_id=1 and (nvl(value,'$$@@$$') != nvl('','$$@@$$') or isdefault != 'TRUE')
-- ----
UNION select inst_id,name,value || case isdefault when 'FALSE' then ' (SPFILE)' else null end,' (Def)' from gv$parameter where name = 'commit_logging' and inst_id=2 and (nvl(value,'$$@@$$') != nvl('','$$@@$$') or isdefault != 'TRUE')
-- ----
UNION select inst_id,name,value || case isdefault when 'FALSE' then ' (SPFILE)' else null end,' (Def)' from gv$parameter where name = 'commit_wait' and inst_id=1 and (nvl(value,'$$@@$$') != nvl('','$$@@$$') or isdefault != 'TRUE')
-- ----
UNION select inst_id,name,value || case isdefault when 'FALSE' then ' (SPFILE)' else null end,' (Def)' from gv$parameter where name = 'commit_wait' and inst_id=2 and (nvl(value,'$$@@$$') != nvl('','$$@@$$') or isdefault != 'TRUE')
-- ----
UNION select inst_id,name,value || case isdefault when 'FALSE' then ' (SPFILE)' else null end,' (Def)' from gv$parameter where name = 'commit_write' and inst_id=1 and (nvl(value,'$$@@$$') != nvl('','$$@@$$') or isdefault != 'TRUE')
-- ----
UNION select inst_id,name,value || case isdefault when 'FALSE' then ' (SPFILE)' else null end,' (Def)' from gv$parameter where name = 'commit_write' and inst_id=2 and (nvl(value,'$$@@$$') != nvl('','$$@@$$') or isdefault != 'TRUE')
-- ----
UNION select inst_id,name,value || case isdefault when 'FALSE' then ' (SPFILE)' else null end,' (Def)' from gv$parameter where name = 'create_stored_outlines' and inst_id=1 and (nvl(value,'$$@@$$') != nvl('','$$@@$$') or isdefault != 'TRUE')
-- ----
UNION select inst_id,name,value || case isdefault when 'FALSE' then ' (SPFILE)' else null end,' (Def)' from gv$parameter where name = 'create_stored_outlines' and inst_id=2 and (nvl(value,'$$@@$$') != nvl('','$$@@$$') or isdefault != 'TRUE')
-- ----
UNION select inst_id,name,value || case isdefault when 'FALSE' then ' (SPFILE)' else null end,' (Def)' from gv$parameter where name = 'db_create_online_log_dest_2' and inst_id=1 and (nvl(value,'$$@@$$') != nvl('','$$@@$$') or isdefault != 'TRUE')
-- ----
UNION select inst_id,name,value || case isdefault when 'FALSE' then ' (SPFILE)' else null end,' (Def)' from gv$parameter where name = 'db_create_online_log_dest_2' and inst_id=2 and (nvl(value,'$$@@$$') != nvl('','$$@@$$') or isdefault != 'TRUE')
-- ----
UNION select inst_id,name,value || case isdefault when 'FALSE' then ' (SPFILE)' else null end,' (Def)' from gv$parameter where name = 'db_create_online_log_dest_3' and inst_id=1 and (nvl(value,'$$@@$$') != nvl('','$$@@$$') or isdefault != 'TRUE')
-- ----
UNION select inst_id,name,value || case isdefault when 'FALSE' then ' (SPFILE)' else null end,' (Def)' from gv$parameter where name = 'db_create_online_log_dest_3' and inst_id=2 and (nvl(value,'$$@@$$') != nvl('','$$@@$$') or isdefault != 'TRUE')
-- ----
UNION select inst_id,name,value || case isdefault when 'FALSE' then ' (SPFILE)' else null end,' (Def)' from gv$parameter where name = 'db_create_online_log_dest_4' and inst_id=1 and (nvl(value,'$$@@$$') != nvl('','$$@@$$') or isdefault != 'TRUE')
-- ----
UNION select inst_id,name,value || case isdefault when 'FALSE' then ' (SPFILE)' else null end,' (Def)' from gv$parameter where name = 'db_create_online_log_dest_4' and inst_id=2 and (nvl(value,'$$@@$$') != nvl('','$$@@$$') or isdefault != 'TRUE')
-- ----
UNION select inst_id,name,value || case isdefault when 'FALSE' then ' (SPFILE)' else null end,' (Def)' from gv$parameter where name = 'db_create_online_log_dest_5' and inst_id=1 and (nvl(value,'$$@@$$') != nvl('','$$@@$$') or isdefault != 'TRUE')
-- ----
UNION select inst_id,name,value || case isdefault when 'FALSE' then ' (SPFILE)' else null end,' (Def)' from gv$parameter where name = 'db_create_online_log_dest_5' and inst_id=2 and (nvl(value,'$$@@$$') != nvl('','$$@@$$') or isdefault != 'TRUE')
-- ----
UNION select inst_id,name,value || case isdefault when 'FALSE' then ' (SPFILE)' else null end,' (Def)' from gv$parameter where name = 'db_file_name_convert' and inst_id=1 and (nvl(value,'$$@@$$') != nvl('','$$@@$$') or isdefault != 'TRUE')
-- ----
UNION select inst_id,name,value || case isdefault when 'FALSE' then ' (SPFILE)' else null end,' (Def)' from gv$parameter where name = 'db_file_name_convert' and inst_id=2 and (nvl(value,'$$@@$$') != nvl('','$$@@$$') or isdefault != 'TRUE')
-- ----
UNION select inst_id,name,value || case isdefault when 'FALSE' then ' (SPFILE)' else null end,' (Def)' from gv$parameter where name = 'db_flash_cache_file' and inst_id=1 and (nvl(value,'$$@@$$') != nvl('','$$@@$$') or isdefault != 'TRUE')
-- ----
UNION select inst_id,name,value || case isdefault when 'FALSE' then ' (SPFILE)' else null end,' (Def)' from gv$parameter where name = 'db_flash_cache_file' and inst_id=2 and (nvl(value,'$$@@$$') != nvl('','$$@@$$') or isdefault != 'TRUE')
-- ----
UNION select inst_id,name,value || case isdefault when 'FALSE' then ' (SPFILE)' else null end,' (Def)' from gv$parameter where name = 'db_performance_profile' and inst_id=1 and (nvl(value,'$$@@$$') != nvl('','$$@@$$') or isdefault != 'TRUE')
-- ----
UNION select inst_id,name,value || case isdefault when 'FALSE' then ' (SPFILE)' else null end,' (Def)' from gv$parameter where name = 'db_performance_profile' and inst_id=2 and (nvl(value,'$$@@$$') != nvl('','$$@@$$') or isdefault != 'TRUE')
-- ----
UNION select inst_id,name,value || case isdefault when 'FALSE' then ' (SPFILE)' else null end,' (Def)' from gv$parameter where name = 'event' and inst_id=1 and (nvl(value,'$$@@$$') != nvl('','$$@@$$') or isdefault != 'TRUE')
-- ----
UNION select inst_id,name,value || case isdefault when 'FALSE' then ' (SPFILE)' else null end,' (Def)' from gv$parameter where name = 'event' and inst_id=2 and (nvl(value,'$$@@$$') != nvl('','$$@@$$') or isdefault != 'TRUE')
-- ----
UNION select inst_id,name,value || case isdefault when 'FALSE' then ' (SPFILE)' else null end,' (Def)' from gv$parameter where name = 'external_keystore_credential_location' and inst_id=1 and (nvl(value,'$$@@$$') != nvl('','$$@@$$') or isdefault != 'TRUE')
-- ----
UNION select inst_id,name,value || case isdefault when 'FALSE' then ' (SPFILE)' else null end,' (Def)' from gv$parameter where name = 'external_keystore_credential_location' and inst_id=2 and (nvl(value,'$$@@$$') != nvl('','$$@@$$') or isdefault != 'TRUE')
-- ----
UNION select inst_id,name,value || case isdefault when 'FALSE' then ' (SPFILE)' else null end,' (Def)' from gv$parameter where name = 'fal_client' and inst_id=1 and (nvl(value,'$$@@$$') != nvl('','$$@@$$') or isdefault != 'TRUE')
-- ----
UNION select inst_id,name,value || case isdefault when 'FALSE' then ' (SPFILE)' else null end,' (Def)' from gv$parameter where name = 'fal_client' and inst_id=2 and (nvl(value,'$$@@$$') != nvl('','$$@@$$') or isdefault != 'TRUE')
-- ----
UNION select inst_id,name,value || case isdefault when 'FALSE' then ' (SPFILE)' else null end,' (Def)' from gv$parameter where name = 'fileio_network_adapters' and inst_id=1 and (nvl(value,'$$@@$$') != nvl('','$$@@$$') or isdefault != 'TRUE')
-- ----
UNION select inst_id,name,value || case isdefault when 'FALSE' then ' (SPFILE)' else null end,' (Def)' from gv$parameter where name = 'fileio_network_adapters' and inst_id=2 and (nvl(value,'$$@@$$') != nvl('','$$@@$$') or isdefault != 'TRUE')
-- ----
UNION select inst_id,name,value || case isdefault when 'FALSE' then ' (SPFILE)' else null end,' (Def)' from gv$parameter where name = 'fixed_date' and inst_id=1 and (nvl(value,'$$@@$$') != nvl('','$$@@$$') or isdefault != 'TRUE')
-- ----
UNION select inst_id,name,value || case isdefault when 'FALSE' then ' (SPFILE)' else null end,' (Def)' from gv$parameter where name = 'fixed_date' and inst_id=2 and (nvl(value,'$$@@$$') != nvl('','$$@@$$') or isdefault != 'TRUE')
-- ----
UNION select inst_id,name,value || case isdefault when 'FALSE' then ' (SPFILE)' else null end,' (Def)' from gv$parameter where name = 'forward_listener' and inst_id=1 and (nvl(value,'$$@@$$') != nvl('','$$@@$$') or isdefault != 'TRUE')
-- ----
UNION select inst_id,name,value || case isdefault when 'FALSE' then ' (SPFILE)' else null end,' (Def)' from gv$parameter where name = 'forward_listener' and inst_id=2 and (nvl(value,'$$@@$$') != nvl('','$$@@$$') or isdefault != 'TRUE')
-- ----
UNION select inst_id,name,value || case isdefault when 'FALSE' then ' (SPFILE)' else null end,' (Def)' from gv$parameter where name = 'ifile' and inst_id=1 and (nvl(value,'$$@@$$') != nvl('','$$@@$$') or isdefault != 'TRUE')
-- ----
UNION select inst_id,name,value || case isdefault when 'FALSE' then ' (SPFILE)' else null end,' (Def)' from gv$parameter where name = 'ifile' and inst_id=2 and (nvl(value,'$$@@$$') != nvl('','$$@@$$') or isdefault != 'TRUE')
-- ----
UNION select inst_id,name,value || case isdefault when 'FALSE' then ' (SPFILE)' else null end,' (Def)' from gv$parameter where name = 'inmemory_clause_default' and inst_id=1 and (nvl(value,'$$@@$$') != nvl('','$$@@$$') or isdefault != 'TRUE')
-- ----
UNION select inst_id,name,value || case isdefault when 'FALSE' then ' (SPFILE)' else null end,' (Def)' from gv$parameter where name = 'inmemory_clause_default' and inst_id=2 and (nvl(value,'$$@@$$') != nvl('','$$@@$$') or isdefault != 'TRUE')
-- ----
UNION select inst_id,name,value || case isdefault when 'FALSE' then ' (SPFILE)' else null end,' (Def)' from gv$parameter where name = 'inmemory_prefer_xmem_memcompress' and inst_id=1 and (nvl(value,'$$@@$$') != nvl('','$$@@$$') or isdefault != 'TRUE')
-- ----
UNION select inst_id,name,value || case isdefault when 'FALSE' then ' (SPFILE)' else null end,' (Def)' from gv$parameter where name = 'inmemory_prefer_xmem_memcompress' and inst_id=2 and (nvl(value,'$$@@$$') != nvl('','$$@@$$') or isdefault != 'TRUE')
-- ----
UNION select inst_id,name,value || case isdefault when 'FALSE' then ' (SPFILE)' else null end,' (Def)' from gv$parameter where name = 'inmemory_prefer_xmem_priority' and inst_id=1 and (nvl(value,'$$@@$$') != nvl('','$$@@$$') or isdefault != 'TRUE')
-- ----
UNION select inst_id,name,value || case isdefault when 'FALSE' then ' (SPFILE)' else null end,' (Def)' from gv$parameter where name = 'inmemory_prefer_xmem_priority' and inst_id=2 and (nvl(value,'$$@@$$') != nvl('','$$@@$$') or isdefault != 'TRUE')
-- ----
UNION select inst_id,name,value || case isdefault when 'FALSE' then ' (SPFILE)' else null end,' (Def)' from gv$parameter where name = 'instance_groups' and inst_id=1 and (nvl(value,'$$@@$$') != nvl('','$$@@$$') or isdefault != 'TRUE')
-- ----
UNION select inst_id,name,value || case isdefault when 'FALSE' then ' (SPFILE)' else null end,' (Def)' from gv$parameter where name = 'instance_groups' and inst_id=2 and (nvl(value,'$$@@$$') != nvl('','$$@@$$') or isdefault != 'TRUE')
-- ----
UNION select inst_id,name,value || case isdefault when 'FALSE' then ' (SPFILE)' else null end,' (Def)' from gv$parameter where name = 'listener_networks' and inst_id=1 and (nvl(value,'$$@@$$') != nvl('','$$@@$$') or isdefault != 'TRUE')
-- ----
UNION select inst_id,name,value || case isdefault when 'FALSE' then ' (SPFILE)' else null end,' (Def)' from gv$parameter where name = 'listener_networks' and inst_id=2 and (nvl(value,'$$@@$$') != nvl('','$$@@$$') or isdefault != 'TRUE')
-- ----
UNION select inst_id,name,value || case isdefault when 'FALSE' then ' (SPFILE)' else null end,' (Def)' from gv$parameter where name = 'lock_name_space' and inst_id=1 and (nvl(value,'$$@@$$') != nvl('','$$@@$$') or isdefault != 'TRUE')
-- ----
UNION select inst_id,name,value || case isdefault when 'FALSE' then ' (SPFILE)' else null end,' (Def)' from gv$parameter where name = 'lock_name_space' and inst_id=2 and (nvl(value,'$$@@$$') != nvl('','$$@@$$') or isdefault != 'TRUE')
-- ----
UNION select inst_id,name,value || case isdefault when 'FALSE' then ' (SPFILE)' else null end,' (Def)' from gv$parameter where name = 'log_file_name_convert' and inst_id=1 and (nvl(value,'$$@@$$') != nvl('','$$@@$$') or isdefault != 'TRUE')
-- ----
UNION select inst_id,name,value || case isdefault when 'FALSE' then ' (SPFILE)' else null end,' (Def)' from gv$parameter where name = 'log_file_name_convert' and inst_id=2 and (nvl(value,'$$@@$$') != nvl('','$$@@$$') or isdefault != 'TRUE')
-- ----
UNION select inst_id,name,value || case isdefault when 'FALSE' then ' (SPFILE)' else null end,' (Def)' from gv$parameter where name = 'max_dispatchers' and inst_id=1 and (nvl(value,'$$@@$$') != nvl('','$$@@$$') or isdefault != 'TRUE')
-- ----
UNION select inst_id,name,value || case isdefault when 'FALSE' then ' (SPFILE)' else null end,' (Def)' from gv$parameter where name = 'max_dispatchers' and inst_id=2 and (nvl(value,'$$@@$$') != nvl('','$$@@$$') or isdefault != 'TRUE')
-- ----
UNION select inst_id,name,value || case isdefault when 'FALSE' then ' (SPFILE)' else null end,' (Def)' from gv$parameter where name = 'max_shared_servers' and inst_id=1 and (nvl(value,'$$@@$$') != nvl('','$$@@$$') or isdefault != 'TRUE')
-- ----
UNION select inst_id,name,value || case isdefault when 'FALSE' then ' (SPFILE)' else null end,' (Def)' from gv$parameter where name = 'max_shared_servers' and inst_id=2 and (nvl(value,'$$@@$$') != nvl('','$$@@$$') or isdefault != 'TRUE')
-- ----
UNION select inst_id,name,value || case isdefault when 'FALSE' then ' (SPFILE)' else null end,' (Def)' from gv$parameter where name = 'nls_calendar' and inst_id=1 and (nvl(value,'$$@@$$') != nvl('','$$@@$$') or isdefault != 'TRUE')
-- ----
UNION select inst_id,name,value || case isdefault when 'FALSE' then ' (SPFILE)' else null end,' (Def)' from gv$parameter where name = 'nls_calendar' and inst_id=2 and (nvl(value,'$$@@$$') != nvl('','$$@@$$') or isdefault != 'TRUE')
-- ----
UNION select inst_id,name,value || case isdefault when 'FALSE' then ' (SPFILE)' else null end,' (Def)' from gv$parameter where name = 'nls_currency' and inst_id=1 and (nvl(value,'$$@@$$') != nvl('','$$@@$$') or isdefault != 'TRUE')
-- ----
UNION select inst_id,name,value || case isdefault when 'FALSE' then ' (SPFILE)' else null end,' (Def)' from gv$parameter where name = 'nls_currency' and inst_id=2 and (nvl(value,'$$@@$$') != nvl('','$$@@$$') or isdefault != 'TRUE')
-- ----
UNION select inst_id,name,value || case isdefault when 'FALSE' then ' (SPFILE)' else null end,' (Def)' from gv$parameter where name = 'nls_date_language' and inst_id=1 and (nvl(value,'$$@@$$') != nvl('','$$@@$$') or isdefault != 'TRUE')
-- ----
UNION select inst_id,name,value || case isdefault when 'FALSE' then ' (SPFILE)' else null end,' (Def)' from gv$parameter where name = 'nls_date_language' and inst_id=2 and (nvl(value,'$$@@$$') != nvl('','$$@@$$') or isdefault != 'TRUE')
-- ----
UNION select inst_id,name,value || case isdefault when 'FALSE' then ' (SPFILE)' else null end,' (Def)' from gv$parameter where name = 'nls_dual_currency' and inst_id=1 and (nvl(value,'$$@@$$') != nvl('','$$@@$$') or isdefault != 'TRUE')
-- ----
UNION select inst_id,name,value || case isdefault when 'FALSE' then ' (SPFILE)' else null end,' (Def)' from gv$parameter where name = 'nls_dual_currency' and inst_id=2 and (nvl(value,'$$@@$$') != nvl('','$$@@$$') or isdefault != 'TRUE')
-- ----
UNION select inst_id,name,value || case isdefault when 'FALSE' then ' (SPFILE)' else null end,' (Def)' from gv$parameter where name = 'nls_iso_currency' and inst_id=1 and (nvl(value,'$$@@$$') != nvl('','$$@@$$') or isdefault != 'TRUE')
-- ----
UNION select inst_id,name,value || case isdefault when 'FALSE' then ' (SPFILE)' else null end,' (Def)' from gv$parameter where name = 'nls_iso_currency' and inst_id=2 and (nvl(value,'$$@@$$') != nvl('','$$@@$$') or isdefault != 'TRUE')
-- ----
UNION select inst_id,name,value || case isdefault when 'FALSE' then ' (SPFILE)' else null end,' (Def)' from gv$parameter where name = 'nls_sort' and inst_id=1 and (nvl(value,'$$@@$$') != nvl('','$$@@$$') or isdefault != 'TRUE')
-- ----
UNION select inst_id,name,value || case isdefault when 'FALSE' then ' (SPFILE)' else null end,' (Def)' from gv$parameter where name = 'nls_sort' and inst_id=2 and (nvl(value,'$$@@$$') != nvl('','$$@@$$') or isdefault != 'TRUE')
-- ----
UNION select inst_id,name,value || case isdefault when 'FALSE' then ' (SPFILE)' else null end,' (Def)' from gv$parameter where name = 'nls_time_format' and inst_id=1 and (nvl(value,'$$@@$$') != nvl('','$$@@$$') or isdefault != 'TRUE')
-- ----
UNION select inst_id,name,value || case isdefault when 'FALSE' then ' (SPFILE)' else null end,' (Def)' from gv$parameter where name = 'nls_time_format' and inst_id=2 and (nvl(value,'$$@@$$') != nvl('','$$@@$$') or isdefault != 'TRUE')
-- ----
UNION select inst_id,name,value || case isdefault when 'FALSE' then ' (SPFILE)' else null end,' (Def)' from gv$parameter where name = 'nls_time_tz_format' and inst_id=1 and (nvl(value,'$$@@$$') != nvl('','$$@@$$') or isdefault != 'TRUE')
-- ----
UNION select inst_id,name,value || case isdefault when 'FALSE' then ' (SPFILE)' else null end,' (Def)' from gv$parameter where name = 'nls_time_tz_format' and inst_id=2 and (nvl(value,'$$@@$$') != nvl('','$$@@$$') or isdefault != 'TRUE')
-- ----
UNION select inst_id,name,value || case isdefault when 'FALSE' then ' (SPFILE)' else null end,' (Def)' from gv$parameter where name = 'nls_timestamp_format' and inst_id=1 and (nvl(value,'$$@@$$') != nvl('','$$@@$$') or isdefault != 'TRUE')
-- ----
UNION select inst_id,name,value || case isdefault when 'FALSE' then ' (SPFILE)' else null end,' (Def)' from gv$parameter where name = 'nls_timestamp_format' and inst_id=2 and (nvl(value,'$$@@$$') != nvl('','$$@@$$') or isdefault != 'TRUE')
-- ----
UNION select inst_id,name,value || case isdefault when 'FALSE' then ' (SPFILE)' else null end,' (Def)' from gv$parameter where name = 'nls_timestamp_tz_format' and inst_id=1 and (nvl(value,'$$@@$$') != nvl('','$$@@$$') or isdefault != 'TRUE')
-- ----
UNION select inst_id,name,value || case isdefault when 'FALSE' then ' (SPFILE)' else null end,' (Def)' from gv$parameter where name = 'nls_timestamp_tz_format' and inst_id=2 and (nvl(value,'$$@@$$') != nvl('','$$@@$$') or isdefault != 'TRUE')
-- ----
UNION select inst_id,name,value || case isdefault when 'FALSE' then ' (SPFILE)' else null end,' (Def)' from gv$parameter where name = 'parallel_instance_group' and inst_id=1 and (nvl(value,'$$@@$$') != nvl('','$$@@$$') or isdefault != 'TRUE')
-- ----
UNION select inst_id,name,value || case isdefault when 'FALSE' then ' (SPFILE)' else null end,' (Def)' from gv$parameter where name = 'parallel_instance_group' and inst_id=2 and (nvl(value,'$$@@$$') != nvl('','$$@@$$') or isdefault != 'TRUE')
-- ----
UNION select inst_id,name,value || case isdefault when 'FALSE' then ' (SPFILE)' else null end,' (Def)' from gv$parameter where name = 'pdb_file_name_convert' and inst_id=1 and (nvl(value,'$$@@$$') != nvl('','$$@@$$') or isdefault != 'TRUE')
-- ----
UNION select inst_id,name,value || case isdefault when 'FALSE' then ' (SPFILE)' else null end,' (Def)' from gv$parameter where name = 'pdb_file_name_convert' and inst_id=2 and (nvl(value,'$$@@$$') != nvl('','$$@@$$') or isdefault != 'TRUE')
-- ----
UNION select inst_id,name,value || case isdefault when 'FALSE' then ' (SPFILE)' else null end,' (Def)' from gv$parameter where name = 'pdb_lockdown' and inst_id=1 and (nvl(value,'$$@@$$') != nvl('','$$@@$$') or isdefault != 'TRUE')
-- ----
UNION select inst_id,name,value || case isdefault when 'FALSE' then ' (SPFILE)' else null end,' (Def)' from gv$parameter where name = 'pdb_lockdown' and inst_id=2 and (nvl(value,'$$@@$$') != nvl('','$$@@$$') or isdefault != 'TRUE')
-- ----
UNION select inst_id,name,value || case isdefault when 'FALSE' then ' (SPFILE)' else null end,' (Def)' from gv$parameter where name = 'pdb_os_credential' and inst_id=1 and (nvl(value,'$$@@$$') != nvl('','$$@@$$') or isdefault != 'TRUE')
-- ----
UNION select inst_id,name,value || case isdefault when 'FALSE' then ' (SPFILE)' else null end,' (Def)' from gv$parameter where name = 'pdb_os_credential' and inst_id=2 and (nvl(value,'$$@@$$') != nvl('','$$@@$$') or isdefault != 'TRUE')
-- ----
UNION select inst_id,name,value || case isdefault when 'FALSE' then ' (SPFILE)' else null end,' (Def)' from gv$parameter where name = 'pdb_template' and inst_id=1 and (nvl(value,'$$@@$$') != nvl('','$$@@$$') or isdefault != 'TRUE')
-- ----
UNION select inst_id,name,value || case isdefault when 'FALSE' then ' (SPFILE)' else null end,' (Def)' from gv$parameter where name = 'pdb_template' and inst_id=2 and (nvl(value,'$$@@$$') != nvl('','$$@@$$') or isdefault != 'TRUE')
-- ----
UNION select inst_id,name,value || case isdefault when 'FALSE' then ' (SPFILE)' else null end,' (Def)' from gv$parameter where name = 'plsql_ccflags' and inst_id=1 and (nvl(value,'$$@@$$') != nvl('','$$@@$$') or isdefault != 'TRUE')
-- ----
UNION select inst_id,name,value || case isdefault when 'FALSE' then ' (SPFILE)' else null end,' (Def)' from gv$parameter where name = 'plsql_ccflags' and inst_id=2 and (nvl(value,'$$@@$$') != nvl('','$$@@$$') or isdefault != 'TRUE')
-- ----
UNION select inst_id,name,value || case isdefault when 'FALSE' then ' (SPFILE)' else null end,' (Def)' from gv$parameter where name = 'processor_group_name' and inst_id=1 and (nvl(value,'$$@@$$') != nvl('','$$@@$$') or isdefault != 'TRUE')
-- ----
UNION select inst_id,name,value || case isdefault when 'FALSE' then ' (SPFILE)' else null end,' (Def)' from gv$parameter where name = 'processor_group_name' and inst_id=2 and (nvl(value,'$$@@$$') != nvl('','$$@@$$') or isdefault != 'TRUE')
-- ----
UNION select inst_id,name,value || case isdefault when 'FALSE' then ' (SPFILE)' else null end,' (Def)' from gv$parameter where name = 'rdbms_server_dn' and inst_id=1 and (nvl(value,'$$@@$$') != nvl('','$$@@$$') or isdefault != 'TRUE')
-- ----
UNION select inst_id,name,value || case isdefault when 'FALSE' then ' (SPFILE)' else null end,' (Def)' from gv$parameter where name = 'rdbms_server_dn' and inst_id=2 and (nvl(value,'$$@@$$') != nvl('','$$@@$$') or isdefault != 'TRUE')
-- ----
UNION select inst_id,name,value || case isdefault when 'FALSE' then ' (SPFILE)' else null end,' (Def)' from gv$parameter where name = 'redo_transport_user' and inst_id=1 and (nvl(value,'$$@@$$') != nvl('','$$@@$$') or isdefault != 'TRUE')
-- ----
UNION select inst_id,name,value || case isdefault when 'FALSE' then ' (SPFILE)' else null end,' (Def)' from gv$parameter where name = 'redo_transport_user' and inst_id=2 and (nvl(value,'$$@@$$') != nvl('','$$@@$$') or isdefault != 'TRUE')
-- ----
UNION select inst_id,name,value || case isdefault when 'FALSE' then ' (SPFILE)' else null end,' (Def)' from gv$parameter where name = 'remote_recovery_file_dest' and inst_id=1 and (nvl(value,'$$@@$$') != nvl('','$$@@$$') or isdefault != 'TRUE')
-- ----
UNION select inst_id,name,value || case isdefault when 'FALSE' then ' (SPFILE)' else null end,' (Def)' from gv$parameter where name = 'remote_recovery_file_dest' and inst_id=2 and (nvl(value,'$$@@$$') != nvl('','$$@@$$') or isdefault != 'TRUE')
-- ----
UNION select inst_id,name,value || case isdefault when 'FALSE' then ' (SPFILE)' else null end,' (Def)' from gv$parameter where name = 'rollback_segments' and inst_id=1 and (nvl(value,'$$@@$$') != nvl('','$$@@$$') or isdefault != 'TRUE')
-- ----
UNION select inst_id,name,value || case isdefault when 'FALSE' then ' (SPFILE)' else null end,' (Def)' from gv$parameter where name = 'rollback_segments' and inst_id=2 and (nvl(value,'$$@@$$') != nvl('','$$@@$$') or isdefault != 'TRUE')
-- ----
UNION select inst_id,name,value || case isdefault when 'FALSE' then ' (SPFILE)' else null end,' (Def)' from gv$parameter where name = 'shared_server_sessions' and inst_id=1 and (nvl(value,'$$@@$$') != nvl('','$$@@$$') or isdefault != 'TRUE')
-- ----
UNION select inst_id,name,value || case isdefault when 'FALSE' then ' (SPFILE)' else null end,' (Def)' from gv$parameter where name = 'shared_server_sessions' and inst_id=2 and (nvl(value,'$$@@$$') != nvl('','$$@@$$') or isdefault != 'TRUE')
-- ----
UNION select inst_id,name,value || case isdefault when 'FALSE' then ' (SPFILE)' else null end,' (Def)' from gv$parameter where name = 'smtp_out_server' and inst_id=1 and (nvl(value,'$$@@$$') != nvl('','$$@@$$') or isdefault != 'TRUE')
-- ----
UNION select inst_id,name,value || case isdefault when 'FALSE' then ' (SPFILE)' else null end,' (Def)' from gv$parameter where name = 'smtp_out_server' and inst_id=2 and (nvl(value,'$$@@$$') != nvl('','$$@@$$') or isdefault != 'TRUE')
-- ----
UNION select inst_id,name,value || case isdefault when 'FALSE' then ' (SPFILE)' else null end,' (Def)' from gv$parameter where name = 'standby_pdb_source_file_dblink' and inst_id=1 and (nvl(value,'$$@@$$') != nvl('','$$@@$$') or isdefault != 'TRUE')
-- ----
UNION select inst_id,name,value || case isdefault when 'FALSE' then ' (SPFILE)' else null end,' (Def)' from gv$parameter where name = 'standby_pdb_source_file_dblink' and inst_id=2 and (nvl(value,'$$@@$$') != nvl('','$$@@$$') or isdefault != 'TRUE')
-- ----
UNION select inst_id,name,value || case isdefault when 'FALSE' then ' (SPFILE)' else null end,' (Def)' from gv$parameter where name = 'standby_pdb_source_file_directory' and inst_id=1 and (nvl(value,'$$@@$$') != nvl('','$$@@$$') or isdefault != 'TRUE')
-- ----
UNION select inst_id,name,value || case isdefault when 'FALSE' then ' (SPFILE)' else null end,' (Def)' from gv$parameter where name = 'standby_pdb_source_file_directory' and inst_id=2 and (nvl(value,'$$@@$$') != nvl('','$$@@$$') or isdefault != 'TRUE')
-- ----
UNION select inst_id,name,value || case isdefault when 'FALSE' then ' (SPFILE)' else null end,' (Def)' from gv$parameter where name = 'tde_configuration' and inst_id=1 and (nvl(value,'$$@@$$') != nvl('','$$@@$$') or isdefault != 'TRUE')
-- ----
UNION select inst_id,name,value || case isdefault when 'FALSE' then ' (SPFILE)' else null end,' (Def)' from gv$parameter where name = 'tde_configuration' and inst_id=2 and (nvl(value,'$$@@$$') != nvl('','$$@@$$') or isdefault != 'TRUE')
-- ----
UNION select inst_id,name,value || case isdefault when 'FALSE' then ' (SPFILE)' else null end,' (Def)' from gv$parameter where name = 'tracefile_identifier' and inst_id=1 and (nvl(value,'$$@@$$') != nvl('','$$@@$$') or isdefault != 'TRUE')
-- ----
UNION select inst_id,name,value || case isdefault when 'FALSE' then ' (SPFILE)' else null end,' (Def)' from gv$parameter where name = 'tracefile_identifier' and inst_id=2 and (nvl(value,'$$@@$$') != nvl('','$$@@$$') or isdefault != 'TRUE')
-- ----
UNION select inst_id,name,value || case isdefault when 'FALSE' then ' (SPFILE)' else null end,' (Def)' from gv$parameter where name = 'unified_audit_systemlog' and inst_id=1 and (nvl(value,'$$@@$$') != nvl('','$$@@$$') or isdefault != 'TRUE')
-- ----
UNION select inst_id,name,value || case isdefault when 'FALSE' then ' (SPFILE)' else null end,' (Def)' from gv$parameter where name = 'unified_audit_systemlog' and inst_id=2 and (nvl(value,'$$@@$$') != nvl('','$$@@$$') or isdefault != 'TRUE')
-- ----
UNION select inst_id,name,value || case isdefault when 'FALSE' then ' (SPFILE)' else null end,' (Def)' from gv$parameter where name = 'wallet_root' and inst_id=1 and (nvl(value,'$$@@$$') != nvl('','$$@@$$') or isdefault != 'TRUE')
-- ----
UNION select inst_id,name,value || case isdefault when 'FALSE' then ' (SPFILE)' else null end,' (Def)' from gv$parameter where name = 'wallet_root' and inst_id=2 and (nvl(value,'$$@@$$') != nvl('','$$@@$$') or isdefault != 'TRUE')
-- ----
UNION select inst_id,name,value || case isdefault when 'FALSE' then ' (SPFILE)' else null end,'' from gv$parameter where name = 'fal_server' and inst_id=1 and (nvl(value,'$$@@$$') != nvl('','$$@@$$') or isdefault != 'FALSE')
-- ----
UNION select inst_id,name,value || case isdefault when 'FALSE' then ' (SPFILE)' else null end,'' from gv$parameter where name = 'fal_server' and inst_id=2 and (nvl(value,'$$@@$$') != nvl('','$$@@$$') or isdefault != 'FALSE')
-- ----
UNION select inst_id,name,value || case isdefault when 'FALSE' then ' (SPFILE)' else null end,'((TYPE=DEDICATED)(BROKERS=1)), ((TYPE=EMON)(BROKERS=1)) (Def)' from gv$parameter where name = 'connection_brokers' and inst_id=1 and (nvl(value,'$$@@$$') != nvl('((TYPE=DEDICATED)(BROKERS=1)), ((TYPE=EMON)(BROKERS=1))','$$@@$$') or isdefault != 'TRUE')
-- ----
UNION select inst_id,name,value || case isdefault when 'FALSE' then ' (SPFILE)' else null end,'((TYPE=DEDICATED)(BROKERS=1)), ((TYPE=EMON)(BROKERS=1)) (Def)' from gv$parameter where name = 'connection_brokers' and inst_id=2 and (nvl(value,'$$@@$$') != nvl('((TYPE=DEDICATED)(BROKERS=1)), ((TYPE=EMON)(BROKERS=1))','$$@@$$') or isdefault != 'TRUE')
-- ----
UNION select inst_id,name,value || case isdefault when 'FALSE' then ' (SPFILE)' else null end,'(DROP,3) (Def)' from gv$parameter where name = 'sec_protocol_error_further_action' and inst_id=1 and (nvl(value,'$$@@$$') != nvl('(DROP,3)','$$@@$$') or isdefault != 'TRUE')
-- ----
UNION select inst_id,name,value || case isdefault when 'FALSE' then ' (SPFILE)' else null end,'(DROP,3) (Def)' from gv$parameter where name = 'sec_protocol_error_further_action' and inst_id=2 and (nvl(value,'$$@@$$') != nvl('(DROP,3)','$$@@$$') or isdefault != 'TRUE')
-- ----
UNION select inst_id,name,value || case isdefault when 'FALSE' then ' (SPFILE)' else null end,'* (Def)' from gv$parameter where name = 'enabled_PDBs_on_standby' and inst_id=1 and (nvl(value,'$$@@$$') != nvl('*','$$@@$$') or isdefault != 'TRUE')
-- ----
UNION select inst_id,name,value || case isdefault when 'FALSE' then ' (SPFILE)' else null end,'* (Def)' from gv$parameter where name = 'enabled_PDBs_on_standby' and inst_id=2 and (nvl(value,'$$@@$$') != nvl('*','$$@@$$') or isdefault != 'TRUE')
-- ----
UNION select inst_id,name,value || case isdefault when 'FALSE' then ' (SPFILE)' else null end,'+DATAC1' from gv$parameter where name = 'db_create_file_dest' and inst_id=1 and (nvl(value,'$$@@$$') != nvl('+DATAC1','$$@@$$') or isdefault != 'FALSE')
-- ----
UNION select inst_id,name,value || case isdefault when 'FALSE' then ' (SPFILE)' else null end,'+DATAC1' from gv$parameter where name = 'db_create_file_dest' and inst_id=2 and (nvl(value,'$$@@$$') != nvl('+DATAC1','$$@@$$') or isdefault != 'FALSE')
-- ----
UNION select inst_id,name,value || case isdefault when 'FALSE' then ' (SPFILE)' else null end,'+RECOC1' from gv$parameter where name = 'db_create_online_log_dest_1' and inst_id=1 and (nvl(value,'$$@@$$') != nvl('+RECOC1','$$@@$$') or isdefault != 'FALSE')
-- ----
UNION select inst_id,name,value || case isdefault when 'FALSE' then ' (SPFILE)' else null end,'+RECOC1' from gv$parameter where name = 'db_create_online_log_dest_1' and inst_id=2 and (nvl(value,'$$@@$$') != nvl('+RECOC1','$$@@$$') or isdefault != 'FALSE')
-- ----
UNION select inst_id,name,value || case isdefault when 'FALSE' then ' (SPFILE)' else null end,'+RECOC1' from gv$parameter where name = 'db_recovery_file_dest' and inst_id=1 and (nvl(value,'$$@@$$') != nvl('+RECOC1','$$@@$$') or isdefault != 'FALSE')
-- ----
UNION select inst_id,name,value || case isdefault when 'FALSE' then ' (SPFILE)' else null end,'+RECOC1' from gv$parameter where name = 'db_recovery_file_dest' and inst_id=2 and (nvl(value,'$$@@$$') != nvl('+RECOC1','$$@@$$') or isdefault != 'FALSE')
-- ----
UNION select inst_id,name,value || case isdefault when 'FALSE' then ' (SPFILE)' else null end,',  (Def)' from gv$parameter where name = 'nls_numeric_characters' and inst_id=1 and (nvl(value,'$$@@$$') != nvl(', ','$$@@$$') or isdefault != 'TRUE')
-- ----
UNION select inst_id,name,value || case isdefault when 'FALSE' then ' (SPFILE)' else null end,',  (Def)' from gv$parameter where name = 'nls_numeric_characters' and inst_id=2 and (nvl(value,'$$@@$$') != nvl(', ','$$@@$$') or isdefault != 'TRUE')
-- ----
UNION select inst_id,name,value || case isdefault when 'FALSE' then ' (SPFILE)' else null end,'/u02/app/oracle' from gv$parameter where name = 'diagnostic_dest' and inst_id=1 and (nvl(value,'$$@@$$') != nvl('/u02/app/oracle','$$@@$$') or isdefault != 'FALSE')
-- ----
UNION select inst_id,name,value || case isdefault when 'FALSE' then ' (SPFILE)' else null end,'/u02/app/oracle' from gv$parameter where name = 'diagnostic_dest' and inst_id=2 and (nvl(value,'$$@@$$') != nvl('/u02/app/oracle','$$@@$$') or isdefault != 'FALSE')
-- ----
UNION select inst_id,name,value || case isdefault when 'FALSE' then ' (SPFILE)' else null end,'0 (Def)' from gv$parameter where name = 'awr_snapshot_time_offset' and inst_id=1 and (nvl(value,'$$@@$$') != nvl('0','$$@@$$') or isdefault != 'TRUE')
-- ----
UNION select inst_id,name,value || case isdefault when 'FALSE' then ' (SPFILE)' else null end,'0 (Def)' from gv$parameter where name = 'awr_snapshot_time_offset' and inst_id=2 and (nvl(value,'$$@@$$') != nvl('0','$$@@$$') or isdefault != 'TRUE')
-- ----
UNION select inst_id,name,value || case isdefault when 'FALSE' then ' (SPFILE)' else null end,'0 (Def)' from gv$parameter where name = 'client_result_cache_size' and inst_id=1 and (nvl(value,'$$@@$$') != nvl('0','$$@@$$') or isdefault != 'TRUE')
-- ----
UNION select inst_id,name,value || case isdefault when 'FALSE' then ' (SPFILE)' else null end,'0 (Def)' from gv$parameter where name = 'client_result_cache_size' and inst_id=2 and (nvl(value,'$$@@$$') != nvl('0','$$@@$$') or isdefault != 'TRUE')
-- ----
UNION select inst_id,name,value || case isdefault when 'FALSE' then ' (SPFILE)' else null end,'0 (Def)' from gv$parameter where name = 'data_transfer_cache_size' and inst_id=1 and (nvl(value,'$$@@$$') != nvl('0','$$@@$$') or isdefault != 'TRUE')
-- ----
UNION select inst_id,name,value || case isdefault when 'FALSE' then ' (SPFILE)' else null end,'0 (Def)' from gv$parameter where name = 'data_transfer_cache_size' and inst_id=2 and (nvl(value,'$$@@$$') != nvl('0','$$@@$$') or isdefault != 'TRUE')
-- ----
UNION select inst_id,name,value || case isdefault when 'FALSE' then ' (SPFILE)' else null end,'0 (Def)' from gv$parameter where name = 'db_16k_cache_size' and inst_id=1 and (nvl(value,'$$@@$$') != nvl('0','$$@@$$') or isdefault != 'TRUE')
-- ----
UNION select inst_id,name,value || case isdefault when 'FALSE' then ' (SPFILE)' else null end,'0 (Def)' from gv$parameter where name = 'db_16k_cache_size' and inst_id=2 and (nvl(value,'$$@@$$') != nvl('0','$$@@$$') or isdefault != 'TRUE')
-- ----
UNION select inst_id,name,value || case isdefault when 'FALSE' then ' (SPFILE)' else null end,'0 (Def)' from gv$parameter where name = 'db_2k_cache_size' and inst_id=1 and (nvl(value,'$$@@$$') != nvl('0','$$@@$$') or isdefault != 'TRUE')
-- ----
UNION select inst_id,name,value || case isdefault when 'FALSE' then ' (SPFILE)' else null end,'0 (Def)' from gv$parameter where name = 'db_2k_cache_size' and inst_id=2 and (nvl(value,'$$@@$$') != nvl('0','$$@@$$') or isdefault != 'TRUE')
-- ----
UNION select inst_id,name,value || case isdefault when 'FALSE' then ' (SPFILE)' else null end,'0 (Def)' from gv$parameter where name = 'db_32k_cache_size' and inst_id=1 and (nvl(value,'$$@@$$') != nvl('0','$$@@$$') or isdefault != 'TRUE')
-- ----
UNION select inst_id,name,value || case isdefault when 'FALSE' then ' (SPFILE)' else null end,'0 (Def)' from gv$parameter where name = 'db_32k_cache_size' and inst_id=2 and (nvl(value,'$$@@$$') != nvl('0','$$@@$$') or isdefault != 'TRUE')
-- ----
UNION select inst_id,name,value || case isdefault when 'FALSE' then ' (SPFILE)' else null end,'0 (Def)' from gv$parameter where name = 'db_4k_cache_size' and inst_id=1 and (nvl(value,'$$@@$$') != nvl('0','$$@@$$') or isdefault != 'TRUE')
-- ----
UNION select inst_id,name,value || case isdefault when 'FALSE' then ' (SPFILE)' else null end,'0 (Def)' from gv$parameter where name = 'db_4k_cache_size' and inst_id=2 and (nvl(value,'$$@@$$') != nvl('0','$$@@$$') or isdefault != 'TRUE')
-- ----
UNION select inst_id,name,value || case isdefault when 'FALSE' then ' (SPFILE)' else null end,'0 (Def)' from gv$parameter where name = 'db_8k_cache_size' and inst_id=1 and (nvl(value,'$$@@$$') != nvl('0','$$@@$$') or isdefault != 'TRUE')
-- ----
UNION select inst_id,name,value || case isdefault when 'FALSE' then ' (SPFILE)' else null end,'0 (Def)' from gv$parameter where name = 'db_8k_cache_size' and inst_id=2 and (nvl(value,'$$@@$$') != nvl('0','$$@@$$') or isdefault != 'TRUE')
-- ----
UNION select inst_id,name,value || case isdefault when 'FALSE' then ' (SPFILE)' else null end,'0 (Def)' from gv$parameter where name = 'db_big_table_cache_percent_target' and inst_id=1 and (nvl(value,'$$@@$$') != nvl('0','$$@@$$') or isdefault != 'TRUE')
-- ----
UNION select inst_id,name,value || case isdefault when 'FALSE' then ' (SPFILE)' else null end,'0 (Def)' from gv$parameter where name = 'db_big_table_cache_percent_target' and inst_id=2 and (nvl(value,'$$@@$$') != nvl('0','$$@@$$') or isdefault != 'TRUE')
-- ----
UNION select inst_id,name,value || case isdefault when 'FALSE' then ' (SPFILE)' else null end,'0 (Def)' from gv$parameter where name = 'db_block_buffers' and inst_id=1 and (nvl(value,'$$@@$$') != nvl('0','$$@@$$') or isdefault != 'TRUE')
-- ----
UNION select inst_id,name,value || case isdefault when 'FALSE' then ' (SPFILE)' else null end,'0 (Def)' from gv$parameter where name = 'db_block_buffers' and inst_id=2 and (nvl(value,'$$@@$$') != nvl('0','$$@@$$') or isdefault != 'TRUE')
-- ----
UNION select inst_id,name,value || case isdefault when 'FALSE' then ' (SPFILE)' else null end,'0 (Def)' from gv$parameter where name = 'db_cache_size' and inst_id=1 and (nvl(value,'$$@@$$') != nvl('0','$$@@$$') or isdefault != 'TRUE')
-- ----
UNION select inst_id,name,value || case isdefault when 'FALSE' then ' (SPFILE)' else null end,'0 (Def)' from gv$parameter where name = 'db_cache_size' and inst_id=2 and (nvl(value,'$$@@$$') != nvl('0','$$@@$$') or isdefault != 'TRUE')
-- ----
UNION select inst_id,name,value || case isdefault when 'FALSE' then ' (SPFILE)' else null end,'0 (Def)' from gv$parameter where name = 'db_flash_cache_size' and inst_id=1 and (nvl(value,'$$@@$$') != nvl('0','$$@@$$') or isdefault != 'TRUE')
-- ----
UNION select inst_id,name,value || case isdefault when 'FALSE' then ' (SPFILE)' else null end,'0 (Def)' from gv$parameter where name = 'db_flash_cache_size' and inst_id=2 and (nvl(value,'$$@@$$') != nvl('0','$$@@$$') or isdefault != 'TRUE')
-- ----
UNION select inst_id,name,value || case isdefault when 'FALSE' then ' (SPFILE)' else null end,'0 (Def)' from gv$parameter where name = 'db_keep_cache_size' and inst_id=1 and (nvl(value,'$$@@$$') != nvl('0','$$@@$$') or isdefault != 'TRUE')
-- ----
UNION select inst_id,name,value || case isdefault when 'FALSE' then ' (SPFILE)' else null end,'0 (Def)' from gv$parameter where name = 'db_keep_cache_size' and inst_id=2 and (nvl(value,'$$@@$$') != nvl('0','$$@@$$') or isdefault != 'TRUE')
-- ----
UNION select inst_id,name,value || case isdefault when 'FALSE' then ' (SPFILE)' else null end,'0 (Def)' from gv$parameter where name = 'db_recycle_cache_size' and inst_id=1 and (nvl(value,'$$@@$$') != nvl('0','$$@@$$') or isdefault != 'TRUE')
-- ----
UNION select inst_id,name,value || case isdefault when 'FALSE' then ' (SPFILE)' else null end,'0 (Def)' from gv$parameter where name = 'db_recycle_cache_size' and inst_id=2 and (nvl(value,'$$@@$$') != nvl('0','$$@@$$') or isdefault != 'TRUE')
-- ----
UNION select inst_id,name,value || case isdefault when 'FALSE' then ' (SPFILE)' else null end,'0 (Def)' from gv$parameter where name = 'dbwr_io_slaves' and inst_id=1 and (nvl(value,'$$@@$$') != nvl('0','$$@@$$') or isdefault != 'TRUE')
-- ----
UNION select inst_id,name,value || case isdefault when 'FALSE' then ' (SPFILE)' else null end,'0 (Def)' from gv$parameter where name = 'dbwr_io_slaves' and inst_id=2 and (nvl(value,'$$@@$$') != nvl('0','$$@@$$') or isdefault != 'TRUE')
-- ----
UNION select inst_id,name,value || case isdefault when 'FALSE' then ' (SPFILE)' else null end,'0 (Def)' from gv$parameter where name = 'disable_pdb_feature' and inst_id=1 and (nvl(value,'$$@@$$') != nvl('0','$$@@$$') or isdefault != 'TRUE')
-- ----
UNION select inst_id,name,value || case isdefault when 'FALSE' then ' (SPFILE)' else null end,'0 (Def)' from gv$parameter where name = 'disable_pdb_feature' and inst_id=2 and (nvl(value,'$$@@$$') != nvl('0','$$@@$$') or isdefault != 'TRUE')
-- ----
UNION select inst_id,name,value || case isdefault when 'FALSE' then ' (SPFILE)' else null end,'0 (Def)' from gv$parameter where name = 'fast_start_io_target' and inst_id=1 and (nvl(value,'$$@@$$') != nvl('0','$$@@$$') or isdefault != 'TRUE')
-- ----
UNION select inst_id,name,value || case isdefault when 'FALSE' then ' (SPFILE)' else null end,'0 (Def)' from gv$parameter where name = 'fast_start_io_target' and inst_id=2 and (nvl(value,'$$@@$$') != nvl('0','$$@@$$') or isdefault != 'TRUE')
-- ----
UNION select inst_id,name,value || case isdefault when 'FALSE' then ' (SPFILE)' else null end,'0 (Def)' from gv$parameter where name = 'hi_shared_memory_address' and inst_id=1 and (nvl(value,'$$@@$$') != nvl('0','$$@@$$') or isdefault != 'TRUE')
-- ----
UNION select inst_id,name,value || case isdefault when 'FALSE' then ' (SPFILE)' else null end,'0 (Def)' from gv$parameter where name = 'hi_shared_memory_address' and inst_id=2 and (nvl(value,'$$@@$$') != nvl('0','$$@@$$') or isdefault != 'TRUE')
-- ----
UNION select inst_id,name,value || case isdefault when 'FALSE' then ' (SPFILE)' else null end,'0 (Def)' from gv$parameter where name = 'inmemory_xmem_size' and inst_id=1 and (nvl(value,'$$@@$$') != nvl('0','$$@@$$') or isdefault != 'TRUE')
-- ----
UNION select inst_id,name,value || case isdefault when 'FALSE' then ' (SPFILE)' else null end,'0 (Def)' from gv$parameter where name = 'inmemory_xmem_size' and inst_id=2 and (nvl(value,'$$@@$$') != nvl('0','$$@@$$') or isdefault != 'TRUE')
-- ----
UNION select inst_id,name,value || case isdefault when 'FALSE' then ' (SPFILE)' else null end,'0 (Def)' from gv$parameter where name = 'instance_abort_delay_time' and inst_id=1 and (nvl(value,'$$@@$$') != nvl('0','$$@@$$') or isdefault != 'TRUE')
-- ----
UNION select inst_id,name,value || case isdefault when 'FALSE' then ' (SPFILE)' else null end,'0 (Def)' from gv$parameter where name = 'instance_abort_delay_time' and inst_id=2 and (nvl(value,'$$@@$$') != nvl('0','$$@@$$') or isdefault != 'TRUE')
-- ----
UNION select inst_id,name,value || case isdefault when 'FALSE' then ' (SPFILE)' else null end,'0 (Def)' from gv$parameter where name = 'java_max_sessionspace_size' and inst_id=1 and (nvl(value,'$$@@$$') != nvl('0','$$@@$$') or isdefault != 'TRUE')
-- ----
UNION select inst_id,name,value || case isdefault when 'FALSE' then ' (SPFILE)' else null end,'0 (Def)' from gv$parameter where name = 'java_max_sessionspace_size' and inst_id=2 and (nvl(value,'$$@@$$') != nvl('0','$$@@$$') or isdefault != 'TRUE')
-- ----
UNION select inst_id,name,value || case isdefault when 'FALSE' then ' (SPFILE)' else null end,'0 (Def)' from gv$parameter where name = 'java_pool_size' and inst_id=1 and (nvl(value,'$$@@$$') != nvl('0','$$@@$$') or isdefault != 'TRUE')
-- ----
UNION select inst_id,name,value || case isdefault when 'FALSE' then ' (SPFILE)' else null end,'0 (Def)' from gv$parameter where name = 'java_pool_size' and inst_id=2 and (nvl(value,'$$@@$$') != nvl('0','$$@@$$') or isdefault != 'TRUE')
-- ----
UNION select inst_id,name,value || case isdefault when 'FALSE' then ' (SPFILE)' else null end,'0 (Def)' from gv$parameter where name = 'java_soft_sessionspace_limit' and inst_id=1 and (nvl(value,'$$@@$$') != nvl('0','$$@@$$') or isdefault != 'TRUE')
-- ----
UNION select inst_id,name,value || case isdefault when 'FALSE' then ' (SPFILE)' else null end,'0 (Def)' from gv$parameter where name = 'java_soft_sessionspace_limit' and inst_id=2 and (nvl(value,'$$@@$$') != nvl('0','$$@@$$') or isdefault != 'TRUE')
-- ----
UNION select inst_id,name,value || case isdefault when 'FALSE' then ' (SPFILE)' else null end,'0 (Def)' from gv$parameter where name = 'large_pool_size' and inst_id=1 and (nvl(value,'$$@@$$') != nvl('0','$$@@$$') or isdefault != 'TRUE')
-- ----
UNION select inst_id,name,value || case isdefault when 'FALSE' then ' (SPFILE)' else null end,'0 (Def)' from gv$parameter where name = 'large_pool_size' and inst_id=2 and (nvl(value,'$$@@$$') != nvl('0','$$@@$$') or isdefault != 'TRUE')
-- ----
UNION select inst_id,name,value || case isdefault when 'FALSE' then ' (SPFILE)' else null end,'0 (Def)' from gv$parameter where name = 'license_max_sessions' and inst_id=1 and (nvl(value,'$$@@$$') != nvl('0','$$@@$$') or isdefault != 'TRUE')
-- ----
UNION select inst_id,name,value || case isdefault when 'FALSE' then ' (SPFILE)' else null end,'0 (Def)' from gv$parameter where name = 'license_max_sessions' and inst_id=2 and (nvl(value,'$$@@$$') != nvl('0','$$@@$$') or isdefault != 'TRUE')
-- ----
UNION select inst_id,name,value || case isdefault when 'FALSE' then ' (SPFILE)' else null end,'0 (Def)' from gv$parameter where name = 'license_max_users' and inst_id=1 and (nvl(value,'$$@@$$') != nvl('0','$$@@$$') or isdefault != 'TRUE')
-- ----
UNION select inst_id,name,value || case isdefault when 'FALSE' then ' (SPFILE)' else null end,'0 (Def)' from gv$parameter where name = 'license_max_users' and inst_id=2 and (nvl(value,'$$@@$$') != nvl('0','$$@@$$') or isdefault != 'TRUE')
-- ----
UNION select inst_id,name,value || case isdefault when 'FALSE' then ' (SPFILE)' else null end,'0 (Def)' from gv$parameter where name = 'license_sessions_warning' and inst_id=1 and (nvl(value,'$$@@$$') != nvl('0','$$@@$$') or isdefault != 'TRUE')
-- ----
UNION select inst_id,name,value || case isdefault when 'FALSE' then ' (SPFILE)' else null end,'0 (Def)' from gv$parameter where name = 'license_sessions_warning' and inst_id=2 and (nvl(value,'$$@@$$') != nvl('0','$$@@$$') or isdefault != 'TRUE')
-- ----
UNION select inst_id,name,value || case isdefault when 'FALSE' then ' (SPFILE)' else null end,'0 (Def)' from gv$parameter where name = 'log_checkpoint_interval' and inst_id=1 and (nvl(value,'$$@@$$') != nvl('0','$$@@$$') or isdefault != 'TRUE')
-- ----
UNION select inst_id,name,value || case isdefault when 'FALSE' then ' (SPFILE)' else null end,'0 (Def)' from gv$parameter where name = 'log_checkpoint_interval' and inst_id=2 and (nvl(value,'$$@@$$') != nvl('0','$$@@$$') or isdefault != 'TRUE')
-- ----
UNION select inst_id,name,value || case isdefault when 'FALSE' then ' (SPFILE)' else null end,'0 (Def)' from gv$parameter where name = 'max_idle_time' and inst_id=1 and (nvl(value,'$$@@$$') != nvl('0','$$@@$$') or isdefault != 'TRUE')
-- ----
UNION select inst_id,name,value || case isdefault when 'FALSE' then ' (SPFILE)' else null end,'0 (Def)' from gv$parameter where name = 'max_idle_time' and inst_id=2 and (nvl(value,'$$@@$$') != nvl('0','$$@@$$') or isdefault != 'TRUE')
-- ----
UNION select inst_id,name,value || case isdefault when 'FALSE' then ' (SPFILE)' else null end,'0 (Def)' from gv$parameter where name = 'max_iops' and inst_id=1 and (nvl(value,'$$@@$$') != nvl('0','$$@@$$') or isdefault != 'TRUE')
-- ----
UNION select inst_id,name,value || case isdefault when 'FALSE' then ' (SPFILE)' else null end,'0 (Def)' from gv$parameter where name = 'max_iops' and inst_id=2 and (nvl(value,'$$@@$$') != nvl('0','$$@@$$') or isdefault != 'TRUE')
-- ----
UNION select inst_id,name,value || case isdefault when 'FALSE' then ' (SPFILE)' else null end,'0 (Def)' from gv$parameter where name = 'max_mbps' and inst_id=1 and (nvl(value,'$$@@$$') != nvl('0','$$@@$$') or isdefault != 'TRUE')
-- ----
UNION select inst_id,name,value || case isdefault when 'FALSE' then ' (SPFILE)' else null end,'0 (Def)' from gv$parameter where name = 'max_mbps' and inst_id=2 and (nvl(value,'$$@@$$') != nvl('0','$$@@$$') or isdefault != 'TRUE')
-- ----
UNION select inst_id,name,value || case isdefault when 'FALSE' then ' (SPFILE)' else null end,'0 (Def)' from gv$parameter where name = 'memoptimize_pool_size' and inst_id=1 and (nvl(value,'$$@@$$') != nvl('0','$$@@$$') or isdefault != 'TRUE')
-- ----
UNION select inst_id,name,value || case isdefault when 'FALSE' then ' (SPFILE)' else null end,'0 (Def)' from gv$parameter where name = 'memoptimize_pool_size' and inst_id=2 and (nvl(value,'$$@@$$') != nvl('0','$$@@$$') or isdefault != 'TRUE')
-- ----
UNION select inst_id,name,value || case isdefault when 'FALSE' then ' (SPFILE)' else null end,'0 (Def)' from gv$parameter where name = 'olap_page_pool_size' and inst_id=1 and (nvl(value,'$$@@$$') != nvl('0','$$@@$$') or isdefault != 'TRUE')
-- ----
UNION select inst_id,name,value || case isdefault when 'FALSE' then ' (SPFILE)' else null end,'0 (Def)' from gv$parameter where name = 'olap_page_pool_size' and inst_id=2 and (nvl(value,'$$@@$$') != nvl('0','$$@@$$') or isdefault != 'TRUE')
-- ----
UNION select inst_id,name,value || case isdefault when 'FALSE' then ' (SPFILE)' else null end,'0 (Def)' from gv$parameter where name = 'optimizer_index_caching' and inst_id=1 and (nvl(value,'$$@@$$') != nvl('0','$$@@$$') or isdefault != 'TRUE')
-- ----
UNION select inst_id,name,value || case isdefault when 'FALSE' then ' (SPFILE)' else null end,'0 (Def)' from gv$parameter where name = 'optimizer_index_caching' and inst_id=2 and (nvl(value,'$$@@$$') != nvl('0','$$@@$$') or isdefault != 'TRUE')
-- ----
UNION select inst_id,name,value || case isdefault when 'FALSE' then ' (SPFILE)' else null end,'0 (Def)' from gv$parameter where name = 'parallel_min_percent' and inst_id=1 and (nvl(value,'$$@@$$') != nvl('0','$$@@$$') or isdefault != 'TRUE')
-- ----
UNION select inst_id,name,value || case isdefault when 'FALSE' then ' (SPFILE)' else null end,'0 (Def)' from gv$parameter where name = 'parallel_min_percent' and inst_id=2 and (nvl(value,'$$@@$$') != nvl('0','$$@@$$') or isdefault != 'TRUE')
-- ----
UNION select inst_id,name,value || case isdefault when 'FALSE' then ' (SPFILE)' else null end,'0 (Def)' from gv$parameter where name = 'recovery_parallelism' and inst_id=1 and (nvl(value,'$$@@$$') != nvl('0','$$@@$$') or isdefault != 'TRUE')
-- ----
UNION select inst_id,name,value || case isdefault when 'FALSE' then ' (SPFILE)' else null end,'0 (Def)' from gv$parameter where name = 'recovery_parallelism' and inst_id=2 and (nvl(value,'$$@@$$') != nvl('0','$$@@$$') or isdefault != 'TRUE')
-- ----
UNION select inst_id,name,value || case isdefault when 'FALSE' then ' (SPFILE)' else null end,'0 (Def)' from gv$parameter where name = 'result_cache_remote_expiration' and inst_id=1 and (nvl(value,'$$@@$$') != nvl('0','$$@@$$') or isdefault != 'TRUE')
-- ----
UNION select inst_id,name,value || case isdefault when 'FALSE' then ' (SPFILE)' else null end,'0 (Def)' from gv$parameter where name = 'result_cache_remote_expiration' and inst_id=2 and (nvl(value,'$$@@$$') != nvl('0','$$@@$$') or isdefault != 'TRUE')
-- ----
UNION select inst_id,name,value || case isdefault when 'FALSE' then ' (SPFILE)' else null end,'0 (Def)' from gv$parameter where name = 'resumable_timeout' and inst_id=1 and (nvl(value,'$$@@$$') != nvl('0','$$@@$$') or isdefault != 'TRUE')
-- ----
UNION select inst_id,name,value || case isdefault when 'FALSE' then ' (SPFILE)' else null end,'0 (Def)' from gv$parameter where name = 'resumable_timeout' and inst_id=2 and (nvl(value,'$$@@$$') != nvl('0','$$@@$$') or isdefault != 'TRUE')
-- ----
UNION select inst_id,name,value || case isdefault when 'FALSE' then ' (SPFILE)' else null end,'0 (Def)' from gv$parameter where name = 'sga_min_size' and inst_id=1 and (nvl(value,'$$@@$$') != nvl('0','$$@@$$') or isdefault != 'TRUE')
-- ----
UNION select inst_id,name,value || case isdefault when 'FALSE' then ' (SPFILE)' else null end,'0 (Def)' from gv$parameter where name = 'sga_min_size' and inst_id=2 and (nvl(value,'$$@@$$') != nvl('0','$$@@$$') or isdefault != 'TRUE')
-- ----
UNION select inst_id,name,value || case isdefault when 'FALSE' then ' (SPFILE)' else null end,'0 (Def)' from gv$parameter where name = 'shared_memory_address' and inst_id=1 and (nvl(value,'$$@@$$') != nvl('0','$$@@$$') or isdefault != 'TRUE')
-- ----
UNION select inst_id,name,value || case isdefault when 'FALSE' then ' (SPFILE)' else null end,'0 (Def)' from gv$parameter where name = 'shared_memory_address' and inst_id=2 and (nvl(value,'$$@@$$') != nvl('0','$$@@$$') or isdefault != 'TRUE')
-- ----
UNION select inst_id,name,value || case isdefault when 'FALSE' then ' (SPFILE)' else null end,'0 (Def)' from gv$parameter where name = 'sort_area_retained_size' and inst_id=1 and (nvl(value,'$$@@$$') != nvl('0','$$@@$$') or isdefault != 'TRUE')
-- ----
UNION select inst_id,name,value || case isdefault when 'FALSE' then ' (SPFILE)' else null end,'0 (Def)' from gv$parameter where name = 'sort_area_retained_size' and inst_id=2 and (nvl(value,'$$@@$$') != nvl('0','$$@@$$') or isdefault != 'TRUE')
-- ----
UNION select inst_id,name,value || case isdefault when 'FALSE' then ' (SPFILE)' else null end,'0 (Def)' from gv$parameter where name = 'streams_pool_size' and inst_id=1 and (nvl(value,'$$@@$$') != nvl('0','$$@@$$') or isdefault != 'TRUE')
-- ----
UNION select inst_id,name,value || case isdefault when 'FALSE' then ' (SPFILE)' else null end,'0 (Def)' from gv$parameter where name = 'streams_pool_size' and inst_id=2 and (nvl(value,'$$@@$$') != nvl('0','$$@@$$') or isdefault != 'TRUE')
-- ----
UNION select inst_id,name,value || case isdefault when 'FALSE' then ' (SPFILE)' else null end,'0 (Def)' from gv$parameter where name = 'timed_os_statistics' and inst_id=1 and (nvl(value,'$$@@$$') != nvl('0','$$@@$$') or isdefault != 'TRUE')
-- ----
UNION select inst_id,name,value || case isdefault when 'FALSE' then ' (SPFILE)' else null end,'0 (Def)' from gv$parameter where name = 'timed_os_statistics' and inst_id=2 and (nvl(value,'$$@@$$') != nvl('0','$$@@$$') or isdefault != 'TRUE')
-- ----
UNION select inst_id,name,value || case isdefault when 'FALSE' then ' (SPFILE)' else null end,'0' from gv$parameter where name = 'data_guard_sync_latency' and inst_id=1 and (nvl(value,'$$@@$$') != nvl('0','$$@@$$') or isdefault != 'FALSE')
-- ----
UNION select inst_id,name,value || case isdefault when 'FALSE' then ' (SPFILE)' else null end,'0' from gv$parameter where name = 'data_guard_sync_latency' and inst_id=2 and (nvl(value,'$$@@$$') != nvl('0','$$@@$$') or isdefault != 'FALSE')
-- ----
UNION select inst_id,name,value || case isdefault when 'FALSE' then ' (SPFILE)' else null end,'0' from gv$parameter where name = 'memory_max_target' and inst_id=1 and (nvl(value,'$$@@$$') != nvl('0','$$@@$$') or isdefault != 'FALSE')
-- ----
UNION select inst_id,name,value || case isdefault when 'FALSE' then ' (SPFILE)' else null end,'0' from gv$parameter where name = 'memory_max_target' and inst_id=2 and (nvl(value,'$$@@$$') != nvl('0','$$@@$$') or isdefault != 'FALSE')
-- ----
UNION select inst_id,name,value || case isdefault when 'FALSE' then ' (SPFILE)' else null end,'0' from gv$parameter where name = 'memory_target' and inst_id=1 and (nvl(value,'$$@@$$') != nvl('0','$$@@$$') or isdefault != 'FALSE')
-- ----
UNION select inst_id,name,value || case isdefault when 'FALSE' then ' (SPFILE)' else null end,'0' from gv$parameter where name = 'memory_target' and inst_id=2 and (nvl(value,'$$@@$$') != nvl('0','$$@@$$') or isdefault != 'FALSE')
-- ----
UNION select inst_id,name,value || case isdefault when 'FALSE' then ' (SPFILE)' else null end,'0' from gv$parameter where name = 'pga_aggregate_limit' and inst_id=1 and (nvl(value,'$$@@$$') != nvl('0','$$@@$$') or isdefault != 'FALSE')
-- ----
UNION select inst_id,name,value || case isdefault when 'FALSE' then ' (SPFILE)' else null end,'0' from gv$parameter where name = 'pga_aggregate_limit' and inst_id=2 and (nvl(value,'$$@@$$') != nvl('0','$$@@$$') or isdefault != 'FALSE')
-- ----
UNION select inst_id,name,value || case isdefault when 'FALSE' then ' (SPFILE)' else null end,'1 (Def)' from gv$parameter where name = 'aq_tm_processes' and inst_id=1 and (nvl(value,'$$@@$$') != nvl('1','$$@@$$') or isdefault != 'TRUE')
-- ----
UNION select inst_id,name,value || case isdefault when 'FALSE' then ' (SPFILE)' else null end,'1 (Def)' from gv$parameter where name = 'aq_tm_processes' and inst_id=2 and (nvl(value,'$$@@$$') != nvl('1','$$@@$$') or isdefault != 'TRUE')
-- ----
UNION select inst_id,name,value || case isdefault when 'FALSE' then ' (SPFILE)' else null end,'1 (Def)' from gv$parameter where name = 'commit_point_strength' and inst_id=1 and (nvl(value,'$$@@$$') != nvl('1','$$@@$$') or isdefault != 'TRUE')
-- ----
UNION select inst_id,name,value || case isdefault when 'FALSE' then ' (SPFILE)' else null end,'1 (Def)' from gv$parameter where name = 'commit_point_strength' and inst_id=2 and (nvl(value,'$$@@$$') != nvl('1','$$@@$$') or isdefault != 'TRUE')
-- ----
UNION select inst_id,name,value || case isdefault when 'FALSE' then ' (SPFILE)' else null end,'1 (Def)' from gv$parameter where name = 'exafusion_enabled' and inst_id=1 and (nvl(value,'$$@@$$') != nvl('1','$$@@$$') or isdefault != 'TRUE')
-- ----
UNION select inst_id,name,value || case isdefault when 'FALSE' then ' (SPFILE)' else null end,'1 (Def)' from gv$parameter where name = 'exafusion_enabled' and inst_id=2 and (nvl(value,'$$@@$$') != nvl('1','$$@@$$') or isdefault != 'TRUE')
-- ----
UNION select inst_id,name,value || case isdefault when 'FALSE' then ' (SPFILE)' else null end,'1 (Def)' from gv$parameter where name = 'global_txn_processes' and inst_id=1 and (nvl(value,'$$@@$$') != nvl('1','$$@@$$') or isdefault != 'TRUE')
-- ----
UNION select inst_id,name,value || case isdefault when 'FALSE' then ' (SPFILE)' else null end,'1 (Def)' from gv$parameter where name = 'global_txn_processes' and inst_id=2 and (nvl(value,'$$@@$$') != nvl('1','$$@@$$') or isdefault != 'TRUE')
-- ----
UNION select inst_id,name,value || case isdefault when 'FALSE' then ' (SPFILE)' else null end,'1 (Def)' from gv$parameter where name = 'inmemory_trickle_repopulate_servers_percent' and inst_id=1 and (nvl(value,'$$@@$$') != nvl('1','$$@@$$') or isdefault != 'TRUE')
-- ----
UNION select inst_id,name,value || case isdefault when 'FALSE' then ' (SPFILE)' else null end,'1 (Def)' from gv$parameter where name = 'inmemory_trickle_repopulate_servers_percent' and inst_id=2 and (nvl(value,'$$@@$$') != nvl('1','$$@@$$') or isdefault != 'TRUE')
-- ----
UNION select inst_id,name,value || case isdefault when 'FALSE' then ' (SPFILE)' else null end,'1 (Def)' from gv$parameter where name = 'parallel_min_degree' and inst_id=1 and (nvl(value,'$$@@$$') != nvl('1','$$@@$$') or isdefault != 'TRUE')
-- ----
UNION select inst_id,name,value || case isdefault when 'FALSE' then ' (SPFILE)' else null end,'1 (Def)' from gv$parameter where name = 'parallel_min_degree' and inst_id=2 and (nvl(value,'$$@@$$') != nvl('1','$$@@$$') or isdefault != 'TRUE')
-- ----
UNION select inst_id,name,value || case isdefault when 'FALSE' then ' (SPFILE)' else null end,'1 (Def)' from gv$parameter where name = 'shared_servers' and inst_id=1 and (nvl(value,'$$@@$$') != nvl('1','$$@@$$') or isdefault != 'TRUE')
-- ----
UNION select inst_id,name,value || case isdefault when 'FALSE' then ' (SPFILE)' else null end,'1 (Def)' from gv$parameter where name = 'shared_servers' and inst_id=2 and (nvl(value,'$$@@$$') != nvl('1','$$@@$$') or isdefault != 'TRUE')
-- ----
UNION select inst_id,name,value || case isdefault when 'FALSE' then ' (SPFILE)' else null end,'1' from gv$parameter where name = 'instance_number' and inst_id=1 and (nvl(value,'$$@@$$') != nvl('1','$$@@$$') or isdefault != 'FALSE')
-- ----
UNION select inst_id,name,value || case isdefault when 'FALSE' then ' (SPFILE)' else null end,'1' from gv$parameter where name = 'parallel_threads_per_cpu' and inst_id=1 and (nvl(value,'$$@@$$') != nvl('1','$$@@$$') or isdefault != 'FALSE')
-- ----
UNION select inst_id,name,value || case isdefault when 'FALSE' then ' (SPFILE)' else null end,'1' from gv$parameter where name = 'parallel_threads_per_cpu' and inst_id=2 and (nvl(value,'$$@@$$') != nvl('1','$$@@$$') or isdefault != 'FALSE')
-- ----
UNION select inst_id,name,value || case isdefault when 'FALSE' then ' (SPFILE)' else null end,'1' from gv$parameter where name = 'thread' and inst_id=1 and (nvl(value,'$$@@$$') != nvl('1','$$@@$$') or isdefault != 'FALSE')
-- ----
UNION select inst_id,name,value || case isdefault when 'FALSE' then ' (SPFILE)' else null end,'10 (Def)' from gv$parameter where name = 'awr_pdb_max_parallel_slaves' and inst_id=1 and (nvl(value,'$$@@$$') != nvl('10','$$@@$$') or isdefault != 'TRUE')
-- ----
UNION select inst_id,name,value || case isdefault when 'FALSE' then ' (SPFILE)' else null end,'10 (Def)' from gv$parameter where name = 'awr_pdb_max_parallel_slaves' and inst_id=2 and (nvl(value,'$$@@$$') != nvl('10','$$@@$$') or isdefault != 'TRUE')
-- ----
UNION select inst_id,name,value || case isdefault when 'FALSE' then ' (SPFILE)' else null end,'10 (Def)' from gv$parameter where name = 'object_cache_max_size_percent' and inst_id=1 and (nvl(value,'$$@@$$') != nvl('10','$$@@$$') or isdefault != 'TRUE')
-- ----
UNION select inst_id,name,value || case isdefault when 'FALSE' then ' (SPFILE)' else null end,'10 (Def)' from gv$parameter where name = 'object_cache_max_size_percent' and inst_id=2 and (nvl(value,'$$@@$$') != nvl('10','$$@@$$') or isdefault != 'TRUE')
-- ----
UNION select inst_id,name,value || case isdefault when 'FALSE' then ' (SPFILE)' else null end,'10 (Def)' from gv$parameter where name = 'session_max_open_files' and inst_id=1 and (nvl(value,'$$@@$$') != nvl('10','$$@@$$') or isdefault != 'TRUE')
-- ----
UNION select inst_id,name,value || case isdefault when 'FALSE' then ' (SPFILE)' else null end,'10 (Def)' from gv$parameter where name = 'session_max_open_files' and inst_id=2 and (nvl(value,'$$@@$$') != nvl('10','$$@@$$') or isdefault != 'TRUE')
-- ----
UNION select inst_id,name,value || case isdefault when 'FALSE' then ' (SPFILE)' else null end,'100 (Def)' from gv$parameter where name = 'max_datapump_jobs_per_pdb' and inst_id=1 and (nvl(value,'$$@@$$') != nvl('100','$$@@$$') or isdefault != 'TRUE')
-- ----
UNION select inst_id,name,value || case isdefault when 'FALSE' then ' (SPFILE)' else null end,'100 (Def)' from gv$parameter where name = 'max_datapump_jobs_per_pdb' and inst_id=2 and (nvl(value,'$$@@$$') != nvl('100','$$@@$$') or isdefault != 'TRUE')
-- ----
UNION select inst_id,name,value || case isdefault when 'FALSE' then ' (SPFILE)' else null end,'100 (Def)' from gv$parameter where name = 'optimizer_index_cost_adj' and inst_id=1 and (nvl(value,'$$@@$$') != nvl('100','$$@@$$') or isdefault != 'TRUE')
-- ----
UNION select inst_id,name,value || case isdefault when 'FALSE' then ' (SPFILE)' else null end,'100 (Def)' from gv$parameter where name = 'optimizer_index_cost_adj' and inst_id=2 and (nvl(value,'$$@@$$') != nvl('100','$$@@$$') or isdefault != 'TRUE')
-- ----
UNION select inst_id,name,value || case isdefault when 'FALSE' then ' (SPFILE)' else null end,'1024' from gv$parameter where name = 'db_files' and inst_id=1 and (nvl(value,'$$@@$$') != nvl('1024','$$@@$$') or isdefault != 'FALSE')
-- ----
UNION select inst_id,name,value || case isdefault when 'FALSE' then ' (SPFILE)' else null end,'1024' from gv$parameter where name = 'db_files' and inst_id=2 and (nvl(value,'$$@@$$') != nvl('1024','$$@@$$') or isdefault != 'FALSE')
-- ----
UNION select inst_id,name,value || case isdefault when 'FALSE' then ' (SPFILE)' else null end,'10240000 (Def)' from gv$parameter where name = 'object_cache_optimal_size' and inst_id=1 and (nvl(value,'$$@@$$') != nvl('10240000','$$@@$$') or isdefault != 'TRUE')
-- ----
UNION select inst_id,name,value || case isdefault when 'FALSE' then ' (SPFILE)' else null end,'10240000 (Def)' from gv$parameter where name = 'object_cache_optimal_size' and inst_id=2 and (nvl(value,'$$@@$$') != nvl('10240000','$$@@$$') or isdefault != 'TRUE')
-- ----
UNION select inst_id,name,value || case isdefault when 'FALSE' then ' (SPFILE)' else null end,'1048576 (Def)' from gv$parameter where name = 'bitmap_merge_area_size' and inst_id=1 and (nvl(value,'$$@@$$') != nvl('1048576','$$@@$$') or isdefault != 'TRUE')
-- ----
UNION select inst_id,name,value || case isdefault when 'FALSE' then ' (SPFILE)' else null end,'1048576 (Def)' from gv$parameter where name = 'bitmap_merge_area_size' and inst_id=2 and (nvl(value,'$$@@$$') != nvl('1048576','$$@@$$') or isdefault != 'TRUE')
-- ----
UNION select inst_id,name,value || case isdefault when 'FALSE' then ' (SPFILE)' else null end,'1048576 (Def)' from gv$parameter where name = 'unified_audit_sga_queue_size' and inst_id=1 and (nvl(value,'$$@@$$') != nvl('1048576','$$@@$$') or isdefault != 'TRUE')
-- ----
UNION select inst_id,name,value || case isdefault when 'FALSE' then ' (SPFILE)' else null end,'1048576 (Def)' from gv$parameter where name = 'unified_audit_sga_queue_size' and inst_id=2 and (nvl(value,'$$@@$$') != nvl('1048576','$$@@$$') or isdefault != 'TRUE')
-- ----
UNION select inst_id,name,value || case isdefault when 'FALSE' then ' (SPFILE)' else null end,'1073741824 (Def)' from gv$parameter where name = 'result_cache_max_size' and inst_id=1 and (nvl(value,'$$@@$$') != nvl('1073741824','$$@@$$') or isdefault != 'TRUE')
-- ----
UNION select inst_id,name,value || case isdefault when 'FALSE' then ' (SPFILE)' else null end,'1073741824 (Def)' from gv$parameter where name = 'result_cache_max_size' and inst_id=2 and (nvl(value,'$$@@$$') != nvl('1073741824','$$@@$$') or isdefault != 'TRUE')
-- ----
UNION select inst_id,name,value || case isdefault when 'FALSE' then ' (SPFILE)' else null end,'107374182400' from gv$parameter where name = 'pga_aggregate_target' and inst_id=1 and (nvl(value,'$$@@$$') != nvl('107374182400','$$@@$$') or isdefault != 'FALSE')
-- ----
UNION select inst_id,name,value || case isdefault when 'FALSE' then ' (SPFILE)' else null end,'107374182400' from gv$parameter where name = 'pga_aggregate_target' and inst_id=2 and (nvl(value,'$$@@$$') != nvl('107374182400','$$@@$$') or isdefault != 'FALSE')
-- ----
UNION select inst_id,name,value || case isdefault when 'FALSE' then ' (SPFILE)' else null end,'1181116006 (Def)' from gv$parameter where name = 'shared_pool_reserved_size' and inst_id=1 and (nvl(value,'$$@@$$') != nvl('1181116006','$$@@$$') or isdefault != 'TRUE')
-- ----
UNION select inst_id,name,value || case isdefault when 'FALSE' then ' (SPFILE)' else null end,'1181116006 (Def)' from gv$parameter where name = 'shared_pool_reserved_size' and inst_id=2 and (nvl(value,'$$@@$$') != nvl('1181116006','$$@@$$') or isdefault != 'TRUE')
-- ----
UNION select inst_id,name,value || case isdefault when 'FALSE' then ' (SPFILE)' else null end,'128 (Def)' from gv$parameter where name = 'db_file_multiblock_read_count' and inst_id=1 and (nvl(value,'$$@@$$') != nvl('128','$$@@$$') or isdefault != 'TRUE')
-- ----
UNION select inst_id,name,value || case isdefault when 'FALSE' then ' (SPFILE)' else null end,'128 (Def)' from gv$parameter where name = 'db_file_multiblock_read_count' and inst_id=2 and (nvl(value,'$$@@$$') != nvl('128','$$@@$$') or isdefault != 'TRUE')
-- ----
UNION select inst_id,name,value || case isdefault when 'FALSE' then ' (SPFILE)' else null end,'131072 (Def)' from gv$parameter where name = 'hash_area_size' and inst_id=1 and (nvl(value,'$$@@$$') != nvl('131072','$$@@$$') or isdefault != 'TRUE')
-- ----
UNION select inst_id,name,value || case isdefault when 'FALSE' then ' (SPFILE)' else null end,'131072 (Def)' from gv$parameter where name = 'hash_area_size' and inst_id=2 and (nvl(value,'$$@@$$') != nvl('131072','$$@@$$') or isdefault != 'TRUE')
-- ----
UNION select inst_id,name,value || case isdefault when 'FALSE' then ' (SPFILE)' else null end,'1440' from gv$parameter where name = 'db_flashback_retention_target' and inst_id=1 and (nvl(value,'$$@@$$') != nvl('1440','$$@@$$') or isdefault != 'FALSE')
-- ----
UNION select inst_id,name,value || case isdefault when 'FALSE' then ' (SPFILE)' else null end,'1440' from gv$parameter where name = 'db_flashback_retention_target' and inst_id=2 and (nvl(value,'$$@@$$') != nvl('1440','$$@@$$') or isdefault != 'FALSE')
-- ----
UNION select inst_id,name,value || case isdefault when 'FALSE' then ' (SPFILE)' else null end,'16384' from gv$parameter where name = 'parallel_execution_message_size' and inst_id=1 and (nvl(value,'$$@@$$') != nvl('16384','$$@@$$') or isdefault != 'FALSE')
-- ----
UNION select inst_id,name,value || case isdefault when 'FALSE' then ' (SPFILE)' else null end,'16384' from gv$parameter where name = 'parallel_execution_message_size' and inst_id=2 and (nvl(value,'$$@@$$') != nvl('16384','$$@@$$') or isdefault != 'FALSE')
-- ----
UNION select inst_id,name,value || case isdefault when 'FALSE' then ' (SPFILE)' else null end,'18.0.0' from gv$parameter where name = 'compatible' and inst_id=1 and (nvl(value,'$$@@$$') != nvl('18.0.0','$$@@$$') or isdefault != 'FALSE')
-- ----
UNION select inst_id,name,value || case isdefault when 'FALSE' then ' (SPFILE)' else null end,'18.0.0' from gv$parameter where name = 'compatible' and inst_id=2 and (nvl(value,'$$@@$$') != nvl('18.0.0','$$@@$$') or isdefault != 'FALSE')
-- ----
UNION select inst_id,name,value || case isdefault when 'FALSE' then ' (SPFILE)' else null end,'18.1.0 (Def)' from gv$parameter where name = 'optimizer_features_enable' and inst_id=1 and (nvl(value,'$$@@$$') != nvl('18.1.0','$$@@$$') or isdefault != 'TRUE')
-- ----
UNION select inst_id,name,value || case isdefault when 'FALSE' then ' (SPFILE)' else null end,'18.1.0 (Def)' from gv$parameter where name = 'optimizer_features_enable' and inst_id=2 and (nvl(value,'$$@@$$') != nvl('18.1.0','$$@@$$') or isdefault != 'TRUE')
-- ----
UNION select inst_id,name,value || case isdefault when 'FALSE' then ' (SPFILE)' else null end,'1800 (Def)' from gv$parameter where name = 'log_checkpoint_timeout' and inst_id=1 and (nvl(value,'$$@@$$') != nvl('1800','$$@@$$') or isdefault != 'TRUE')
-- ----
UNION select inst_id,name,value || case isdefault when 'FALSE' then ' (SPFILE)' else null end,'1800 (Def)' from gv$parameter where name = 'log_checkpoint_timeout' and inst_id=2 and (nvl(value,'$$@@$$') != nvl('1800','$$@@$$') or isdefault != 'TRUE')
-- ----
UNION select inst_id,name,value || case isdefault when 'FALSE' then ' (SPFILE)' else null end,'184 (Def)' from gv$parameter where name = 'parallel_min_servers' and inst_id=1 and (nvl(value,'$$@@$$') != nvl('184','$$@@$$') or isdefault != 'TRUE')
-- ----
UNION select inst_id,name,value || case isdefault when 'FALSE' then ' (SPFILE)' else null end,'184 (Def)' from gv$parameter where name = 'parallel_min_servers' and inst_id=2 and (nvl(value,'$$@@$$') != nvl('184','$$@@$$') or isdefault != 'TRUE')
-- ----
UNION select inst_id,name,value || case isdefault when 'FALSE' then ' (SPFILE)' else null end,'2 (Def)' from gv$parameter where name = 'autotask_max_active_pdbs' and inst_id=1 and (nvl(value,'$$@@$$') != nvl('2','$$@@$$') or isdefault != 'TRUE')
-- ----
UNION select inst_id,name,value || case isdefault when 'FALSE' then ' (SPFILE)' else null end,'2 (Def)' from gv$parameter where name = 'autotask_max_active_pdbs' and inst_id=2 and (nvl(value,'$$@@$$') != nvl('2','$$@@$$') or isdefault != 'TRUE')
-- ----
UNION select inst_id,name,value || case isdefault when 'FALSE' then ' (SPFILE)' else null end,'2 (Def)' from gv$parameter where name = 'cluster_database_instances' and inst_id=1 and (nvl(value,'$$@@$$') != nvl('2','$$@@$$') or isdefault != 'TRUE')
-- ----
UNION select inst_id,name,value || case isdefault when 'FALSE' then ' (SPFILE)' else null end,'2 (Def)' from gv$parameter where name = 'cluster_database_instances' and inst_id=2 and (nvl(value,'$$@@$$') != nvl('2','$$@@$$') or isdefault != 'TRUE')
-- ----
UNION select inst_id,name,value || case isdefault when 'FALSE' then ' (SPFILE)' else null end,'2 (Def)' from gv$parameter where name = 'optimizer_dynamic_sampling' and inst_id=1 and (nvl(value,'$$@@$$') != nvl('2','$$@@$$') or isdefault != 'TRUE')
-- ----
UNION select inst_id,name,value || case isdefault when 'FALSE' then ' (SPFILE)' else null end,'2 (Def)' from gv$parameter where name = 'optimizer_dynamic_sampling' and inst_id=2 and (nvl(value,'$$@@$$') != nvl('2','$$@@$$') or isdefault != 'TRUE')
-- ----
UNION select inst_id,name,value || case isdefault when 'FALSE' then ' (SPFILE)' else null end,'2 (Def)' from gv$parameter where name = 'plsql_optimize_level' and inst_id=1 and (nvl(value,'$$@@$$') != nvl('2','$$@@$$') or isdefault != 'TRUE')
-- ----
UNION select inst_id,name,value || case isdefault when 'FALSE' then ' (SPFILE)' else null end,'2 (Def)' from gv$parameter where name = 'plsql_optimize_level' and inst_id=2 and (nvl(value,'$$@@$$') != nvl('2','$$@@$$') or isdefault != 'TRUE')
-- ----
UNION select inst_id,name,value || case isdefault when 'FALSE' then ' (SPFILE)' else null end,'2' from gv$parameter where name = 'instance_number' and inst_id=2 and (nvl(value,'$$@@$$') != nvl('2','$$@@$$') or isdefault != 'FALSE')
-- ----
UNION select inst_id,name,value || case isdefault when 'FALSE' then ' (SPFILE)' else null end,'2' from gv$parameter where name = 'thread' and inst_id=2 and (nvl(value,'$$@@$$') != nvl('2','$$@@$$') or isdefault != 'FALSE')
-- ----
UNION select inst_id,name,value || case isdefault when 'FALSE' then ' (SPFILE)' else null end,'2000' from gv$parameter where name = 'open_cursors' and inst_id=1 and (nvl(value,'$$@@$$') != nvl('2000','$$@@$$') or isdefault != 'FALSE')
-- ----
UNION select inst_id,name,value || case isdefault when 'FALSE' then ' (SPFILE)' else null end,'2000' from gv$parameter where name = 'open_cursors' and inst_id=2 and (nvl(value,'$$@@$$') != nvl('2000','$$@@$$') or isdefault != 'FALSE')
-- ----
UNION select inst_id,name,value || case isdefault when 'FALSE' then ' (SPFILE)' else null end,'21474836480' from gv$parameter where name = 'inmemory_size' and inst_id=1 and (nvl(value,'$$@@$$') != nvl('21474836480','$$@@$$') or isdefault != 'FALSE')
-- ----
UNION select inst_id,name,value || case isdefault when 'FALSE' then ' (SPFILE)' else null end,'21474836480' from gv$parameter where name = 'inmemory_size' and inst_id=2 and (nvl(value,'$$@@$$') != nvl('21474836480','$$@@$$') or isdefault != 'FALSE')
-- ----
UNION select inst_id,name,value || case isdefault when 'FALSE' then ' (SPFILE)' else null end,'214748364800' from gv$parameter where name = 'sga_max_size' and inst_id=1 and (nvl(value,'$$@@$$') != nvl('214748364800','$$@@$$') or isdefault != 'FALSE')
-- ----
UNION select inst_id,name,value || case isdefault when 'FALSE' then ' (SPFILE)' else null end,'214748364800' from gv$parameter where name = 'sga_max_size' and inst_id=2 and (nvl(value,'$$@@$$') != nvl('214748364800','$$@@$$') or isdefault != 'FALSE')
-- ----
UNION select inst_id,name,value || case isdefault when 'FALSE' then ' (SPFILE)' else null end,'214748364800' from gv$parameter where name = 'sga_target' and inst_id=1 and (nvl(value,'$$@@$$') != nvl('214748364800','$$@@$$') or isdefault != 'FALSE')
-- ----
UNION select inst_id,name,value || case isdefault when 'FALSE' then ' (SPFILE)' else null end,'214748364800' from gv$parameter where name = 'sga_target' and inst_id=2 and (nvl(value,'$$@@$$') != nvl('214748364800','$$@@$$') or isdefault != 'FALSE')
-- ----
UNION select inst_id,name,value || case isdefault when 'FALSE' then ' (SPFILE)' else null end,'23622320128 (Def)' from gv$parameter where name = 'shared_pool_size' and inst_id=1 and (nvl(value,'$$@@$$') != nvl('23622320128','$$@@$$') or isdefault != 'TRUE')
-- ----
UNION select inst_id,name,value || case isdefault when 'FALSE' then ' (SPFILE)' else null end,'23622320128 (Def)' from gv$parameter where name = 'shared_pool_size' and inst_id=2 and (nvl(value,'$$@@$$') != nvl('23622320128','$$@@$$') or isdefault != 'TRUE')
-- ----
UNION select inst_id,name,value || case isdefault when 'FALSE' then ' (SPFILE)' else null end,'26716 (Def)' from gv$parameter where name = 'dml_locks' and inst_id=1 and (nvl(value,'$$@@$$') != nvl('26716','$$@@$$') or isdefault != 'TRUE')
-- ----
UNION select inst_id,name,value || case isdefault when 'FALSE' then ' (SPFILE)' else null end,'26716 (Def)' from gv$parameter where name = 'dml_locks' and inst_id=2 and (nvl(value,'$$@@$$') != nvl('26716','$$@@$$') or isdefault != 'TRUE')
-- ----
UNION select inst_id,name,value || case isdefault when 'FALSE' then ' (SPFILE)' else null end,'268435456' from gv$parameter where name = 'log_buffer' and inst_id=1 and (nvl(value,'$$@@$$') != nvl('268435456','$$@@$$') or isdefault != 'FALSE')
-- ----
UNION select inst_id,name,value || case isdefault when 'FALSE' then ' (SPFILE)' else null end,'268435456' from gv$parameter where name = 'log_buffer' and inst_id=2 and (nvl(value,'$$@@$$') != nvl('268435456','$$@@$$') or isdefault != 'FALSE')
-- ----
UNION select inst_id,name,value || case isdefault when 'FALSE' then ' (SPFILE)' else null end,'3 (Def)' from gv$parameter where name = 'sec_max_failed_login_attempts' and inst_id=1 and (nvl(value,'$$@@$$') != nvl('3','$$@@$$') or isdefault != 'TRUE')
-- ----
UNION select inst_id,name,value || case isdefault when 'FALSE' then ' (SPFILE)' else null end,'3 (Def)' from gv$parameter where name = 'sec_max_failed_login_attempts' and inst_id=2 and (nvl(value,'$$@@$$') != nvl('3','$$@@$$') or isdefault != 'TRUE')
-- ----
UNION select inst_id,name,value || case isdefault when 'FALSE' then ' (SPFILE)' else null end,'30' from gv$parameter where name = 'ddl_lock_timeout' and inst_id=1 and (nvl(value,'$$@@$$') != nvl('30','$$@@$$') or isdefault != 'FALSE')
-- ----
UNION select inst_id,name,value || case isdefault when 'FALSE' then ' (SPFILE)' else null end,'30' from gv$parameter where name = 'ddl_lock_timeout' and inst_id=2 and (nvl(value,'$$@@$$') != nvl('30','$$@@$$') or isdefault != 'FALSE')
-- ----
UNION select inst_id,name,value || case isdefault when 'FALSE' then ' (SPFILE)' else null end,'300' from gv$parameter where name = 'fast_start_mttr_target' and inst_id=1 and (nvl(value,'$$@@$$') != nvl('300','$$@@$$') or isdefault != 'FALSE')
-- ----
UNION select inst_id,name,value || case isdefault when 'FALSE' then ' (SPFILE)' else null end,'300' from gv$parameter where name = 'fast_start_mttr_target' and inst_id=2 and (nvl(value,'$$@@$$') != nvl('300','$$@@$$') or isdefault != 'FALSE')
-- ----
UNION select inst_id,name,value || case isdefault when 'FALSE' then ' (SPFILE)' else null end,'3000 (Def)' from gv$parameter where name = 'client_result_cache_lag' and inst_id=1 and (nvl(value,'$$@@$$') != nvl('3000','$$@@$$') or isdefault != 'TRUE')
-- ----
UNION select inst_id,name,value || case isdefault when 'FALSE' then ' (SPFILE)' else null end,'3000 (Def)' from gv$parameter where name = 'client_result_cache_lag' and inst_id=2 and (nvl(value,'$$@@$$') != nvl('3000','$$@@$$') or isdefault != 'TRUE')
-- ----
UNION select inst_id,name,value || case isdefault when 'FALSE' then ' (SPFILE)' else null end,'360' from gv$parameter where name = 'distributed_lock_timeout' and inst_id=1 and (nvl(value,'$$@@$$') != nvl('360','$$@@$$') or isdefault != 'FALSE')
-- ----
UNION select inst_id,name,value || case isdefault when 'FALSE' then ' (SPFILE)' else null end,'360' from gv$parameter where name = 'distributed_lock_timeout' and inst_id=2 and (nvl(value,'$$@@$$') != nvl('360','$$@@$$') or isdefault != 'FALSE')
-- ----
UNION select inst_id,name,value || case isdefault when 'FALSE' then ' (SPFILE)' else null end,'39' from gv$parameter where name = 'control_file_record_keep_time' and inst_id=1 and (nvl(value,'$$@@$$') != nvl('39','$$@@$$') or isdefault != 'FALSE')
-- ----
UNION select inst_id,name,value || case isdefault when 'FALSE' then ' (SPFILE)' else null end,'39' from gv$parameter where name = 'control_file_record_keep_time' and inst_id=2 and (nvl(value,'$$@@$$') != nvl('39','$$@@$$') or isdefault != 'FALSE')
-- ----
UNION select inst_id,name,value || case isdefault when 'FALSE' then ' (SPFILE)' else null end,'4 (Def)' from gv$parameter where name = 'gcs_server_processes' and inst_id=1 and (nvl(value,'$$@@$$') != nvl('4','$$@@$$') or isdefault != 'TRUE')
-- ----
UNION select inst_id,name,value || case isdefault when 'FALSE' then ' (SPFILE)' else null end,'4 (Def)' from gv$parameter where name = 'gcs_server_processes' and inst_id=2 and (nvl(value,'$$@@$$') != nvl('4','$$@@$$') or isdefault != 'TRUE')
-- ----
UNION select inst_id,name,value || case isdefault when 'FALSE' then ' (SPFILE)' else null end,'4 (Def)' from gv$parameter where name = 'ofs_threads' and inst_id=1 and (nvl(value,'$$@@$$') != nvl('4','$$@@$$') or isdefault != 'TRUE')
-- ----
UNION select inst_id,name,value || case isdefault when 'FALSE' then ' (SPFILE)' else null end,'4 (Def)' from gv$parameter where name = 'ofs_threads' and inst_id=2 and (nvl(value,'$$@@$$') != nvl('4','$$@@$$') or isdefault != 'TRUE')
-- ----
UNION select inst_id,name,value || case isdefault when 'FALSE' then ' (SPFILE)' else null end,'4 (Def)' from gv$parameter where name = 'open_links' and inst_id=1 and (nvl(value,'$$@@$$') != nvl('4','$$@@$$') or isdefault != 'TRUE')
-- ----
UNION select inst_id,name,value || case isdefault when 'FALSE' then ' (SPFILE)' else null end,'4 (Def)' from gv$parameter where name = 'open_links' and inst_id=2 and (nvl(value,'$$@@$$') != nvl('4','$$@@$$') or isdefault != 'TRUE')
-- ----
UNION select inst_id,name,value || case isdefault when 'FALSE' then ' (SPFILE)' else null end,'4 (Def)' from gv$parameter where name = 'open_links_per_instance' and inst_id=1 and (nvl(value,'$$@@$$') != nvl('4','$$@@$$') or isdefault != 'TRUE')
-- ----
UNION select inst_id,name,value || case isdefault when 'FALSE' then ' (SPFILE)' else null end,'4 (Def)' from gv$parameter where name = 'open_links_per_instance' and inst_id=2 and (nvl(value,'$$@@$$') != nvl('4','$$@@$$') or isdefault != 'TRUE')
-- ----
UNION select inst_id,name,value || case isdefault when 'FALSE' then ' (SPFILE)' else null end,'4' from gv$parameter where name = 'db_writer_processes' and inst_id=1 and (nvl(value,'$$@@$$') != nvl('4','$$@@$$') or isdefault != 'FALSE')
-- ----
UNION select inst_id,name,value || case isdefault when 'FALSE' then ' (SPFILE)' else null end,'4' from gv$parameter where name = 'db_writer_processes' and inst_id=2 and (nvl(value,'$$@@$$') != nvl('4','$$@@$$') or isdefault != 'FALSE')
-- ----
UNION select inst_id,name,value || case isdefault when 'FALSE' then ' (SPFILE)' else null end,'400 (Def)' from gv$parameter where name = 'target_pdbs' and inst_id=1 and (nvl(value,'$$@@$$') != nvl('400','$$@@$$') or isdefault != 'TRUE')
-- ----
UNION select inst_id,name,value || case isdefault when 'FALSE' then ' (SPFILE)' else null end,'400 (Def)' from gv$parameter where name = 'target_pdbs' and inst_id=2 and (nvl(value,'$$@@$$') != nvl('400','$$@@$$') or isdefault != 'TRUE')
-- ----
UNION select inst_id,name,value || case isdefault when 'FALSE' then ' (SPFILE)' else null end,'4000' from gv$parameter where name = 'job_queue_processes' and inst_id=1 and (nvl(value,'$$@@$$') != nvl('4000','$$@@$$') or isdefault != 'FALSE')
-- ----
UNION select inst_id,name,value || case isdefault when 'FALSE' then ' (SPFILE)' else null end,'4000' from gv$parameter where name = 'job_queue_processes' and inst_id=2 and (nvl(value,'$$@@$$') != nvl('4000','$$@@$$') or isdefault != 'FALSE')
-- ----
UNION select inst_id,name,value || case isdefault when 'FALSE' then ' (SPFILE)' else null end,'4000' from gv$parameter where name = 'processes' and inst_id=1 and (nvl(value,'$$@@$$') != nvl('4000','$$@@$$') or isdefault != 'FALSE')
-- ----
UNION select inst_id,name,value || case isdefault when 'FALSE' then ' (SPFILE)' else null end,'4000' from gv$parameter where name = 'processes' and inst_id=2 and (nvl(value,'$$@@$$') != nvl('4000','$$@@$$') or isdefault != 'FALSE')
-- ----
UNION select inst_id,name,value || case isdefault when 'FALSE' then ' (SPFILE)' else null end,'4096 (Def)' from gv$parameter where name = 'dnfs_batch_size' and inst_id=1 and (nvl(value,'$$@@$$') != nvl('4096','$$@@$$') or isdefault != 'TRUE')
-- ----
UNION select inst_id,name,value || case isdefault when 'FALSE' then ' (SPFILE)' else null end,'4096 (Def)' from gv$parameter where name = 'dnfs_batch_size' and inst_id=2 and (nvl(value,'$$@@$$') != nvl('4096','$$@@$$') or isdefault != 'TRUE')
-- ----
UNION select inst_id,name,value || case isdefault when 'FALSE' then ' (SPFILE)' else null end,'4098 (Def)' from gv$parameter where name = 'max_pdbs' and inst_id=1 and (nvl(value,'$$@@$$') != nvl('4098','$$@@$$') or isdefault != 'TRUE')
-- ----
UNION select inst_id,name,value || case isdefault when 'FALSE' then ' (SPFILE)' else null end,'4098 (Def)' from gv$parameter where name = 'max_pdbs' and inst_id=2 and (nvl(value,'$$@@$$') != nvl('4098','$$@@$$') or isdefault != 'TRUE')
-- ----
UNION select inst_id,name,value || case isdefault when 'FALSE' then ' (SPFILE)' else null end,'46 (Def)' from gv$parameter where name = 'inmemory_max_populate_servers' and inst_id=1 and (nvl(value,'$$@@$$') != nvl('46','$$@@$$') or isdefault != 'TRUE')
-- ----
UNION select inst_id,name,value || case isdefault when 'FALSE' then ' (SPFILE)' else null end,'46 (Def)' from gv$parameter where name = 'inmemory_max_populate_servers' and inst_id=2 and (nvl(value,'$$@@$$') != nvl('46','$$@@$$') or isdefault != 'TRUE')
-- ----
UNION select inst_id,name,value || case isdefault when 'FALSE' then ' (SPFILE)' else null end,'5 (Def)' from gv$parameter where name = 'result_cache_max_result' and inst_id=1 and (nvl(value,'$$@@$$') != nvl('5','$$@@$$') or isdefault != 'TRUE')
-- ----
UNION select inst_id,name,value || case isdefault when 'FALSE' then ' (SPFILE)' else null end,'5 (Def)' from gv$parameter where name = 'result_cache_max_result' and inst_id=2 and (nvl(value,'$$@@$$') != nvl('5','$$@@$$') or isdefault != 'TRUE')
-- ----
UNION select inst_id,name,value || case isdefault when 'FALSE' then ' (SPFILE)' else null end,'5 (Def)' from gv$parameter where name = 'transactions_per_rollback_segment' and inst_id=1 and (nvl(value,'$$@@$$') != nvl('5','$$@@$$') or isdefault != 'TRUE')
-- ----
UNION select inst_id,name,value || case isdefault when 'FALSE' then ' (SPFILE)' else null end,'5 (Def)' from gv$parameter where name = 'transactions_per_rollback_segment' and inst_id=2 and (nvl(value,'$$@@$$') != nvl('5','$$@@$$') or isdefault != 'TRUE')
-- ----
UNION select inst_id,name,value || case isdefault when 'FALSE' then ' (SPFILE)' else null end,'50 (Def)' from gv$parameter where name = 'session_cached_cursors' and inst_id=1 and (nvl(value,'$$@@$$') != nvl('50','$$@@$$') or isdefault != 'TRUE')
-- ----
UNION select inst_id,name,value || case isdefault when 'FALSE' then ' (SPFILE)' else null end,'50 (Def)' from gv$parameter where name = 'session_cached_cursors' and inst_id=2 and (nvl(value,'$$@@$$') != nvl('50','$$@@$$') or isdefault != 'TRUE')
-- ----
UNION select inst_id,name,value || case isdefault when 'FALSE' then ' (SPFILE)' else null end,'55754044211200' from gv$parameter where name = 'db_recovery_file_dest_size' and inst_id=1 and (nvl(value,'$$@@$$') != nvl('55754044211200','$$@@$$') or isdefault != 'FALSE')
-- ----
UNION select inst_id,name,value || case isdefault when 'FALSE' then ' (SPFILE)' else null end,'55754044211200' from gv$parameter where name = 'db_recovery_file_dest_size' and inst_id=2 and (nvl(value,'$$@@$$') != nvl('55754044211200','$$@@$$') or isdefault != 'FALSE')
-- ----
UNION select inst_id,name,value || case isdefault when 'FALSE' then ' (SPFILE)' else null end,'60 (Def)' from gv$parameter where name = 'shrd_dupl_table_refresh_rate' and inst_id=1 and (nvl(value,'$$@@$$') != nvl('60','$$@@$$') or isdefault != 'TRUE')
-- ----
UNION select inst_id,name,value || case isdefault when 'FALSE' then ' (SPFILE)' else null end,'60 (Def)' from gv$parameter where name = 'shrd_dupl_table_refresh_rate' and inst_id=2 and (nvl(value,'$$@@$$') != nvl('60','$$@@$$') or isdefault != 'TRUE')
-- ----
UNION select inst_id,name,value || case isdefault when 'FALSE' then ' (SPFILE)' else null end,'6072 (Def)' from gv$parameter where name = 'sessions' and inst_id=1 and (nvl(value,'$$@@$$') != nvl('6072','$$@@$$') or isdefault != 'TRUE')
-- ----
UNION select inst_id,name,value || case isdefault when 'FALSE' then ' (SPFILE)' else null end,'6072 (Def)' from gv$parameter where name = 'sessions' and inst_id=2 and (nvl(value,'$$@@$$') != nvl('6072','$$@@$$') or isdefault != 'TRUE')
-- ----
UNION select inst_id,name,value || case isdefault when 'FALSE' then ' (SPFILE)' else null end,'65535 (Def)' from gv$parameter where name = 'containers_parallel_degree' and inst_id=1 and (nvl(value,'$$@@$$') != nvl('65535','$$@@$$') or isdefault != 'TRUE')
-- ----
UNION select inst_id,name,value || case isdefault when 'FALSE' then ' (SPFILE)' else null end,'65535 (Def)' from gv$parameter where name = 'containers_parallel_degree' and inst_id=2 and (nvl(value,'$$@@$$') != nvl('65535','$$@@$$') or isdefault != 'TRUE')
-- ----
UNION select inst_id,name,value || case isdefault when 'FALSE' then ' (SPFILE)' else null end,'65536 (Def)' from gv$parameter where name = 'sort_area_size' and inst_id=1 and (nvl(value,'$$@@$$') != nvl('65536','$$@@$$') or isdefault != 'TRUE')
-- ----
UNION select inst_id,name,value || case isdefault when 'FALSE' then ' (SPFILE)' else null end,'65536 (Def)' from gv$parameter where name = 'sort_area_size' and inst_id=2 and (nvl(value,'$$@@$$') != nvl('65536','$$@@$$') or isdefault != 'TRUE')
-- ----
UNION select inst_id,name,value || case isdefault when 'FALSE' then ' (SPFILE)' else null end,'6679 (Def)' from gv$parameter where name = 'transactions' and inst_id=1 and (nvl(value,'$$@@$$') != nvl('6679','$$@@$$') or isdefault != 'TRUE')
-- ----
UNION select inst_id,name,value || case isdefault when 'FALSE' then ' (SPFILE)' else null end,'6679 (Def)' from gv$parameter where name = 'transactions' and inst_id=2 and (nvl(value,'$$@@$$') != nvl('6679','$$@@$$') or isdefault != 'TRUE')
-- ----
UNION select inst_id,name,value || case isdefault when 'FALSE' then ' (SPFILE)' else null end,'8192' from gv$parameter where name = 'db_block_size' and inst_id=1 and (nvl(value,'$$@@$$') != nvl('8192','$$@@$$') or isdefault != 'FALSE')
-- ----
UNION select inst_id,name,value || case isdefault when 'FALSE' then ' (SPFILE)' else null end,'8192' from gv$parameter where name = 'db_block_size' and inst_id=2 and (nvl(value,'$$@@$$') != nvl('8192','$$@@$$') or isdefault != 'FALSE')
-- ----
UNION select inst_id,name,value || case isdefault when 'FALSE' then ' (SPFILE)' else null end,'8388608 (Def)' from gv$parameter where name = 'create_bitmap_area_size' and inst_id=1 and (nvl(value,'$$@@$$') != nvl('8388608','$$@@$$') or isdefault != 'TRUE')
-- ----
UNION select inst_id,name,value || case isdefault when 'FALSE' then ' (SPFILE)' else null end,'8388608 (Def)' from gv$parameter where name = 'create_bitmap_area_size' and inst_id=2 and (nvl(value,'$$@@$$') != nvl('8388608','$$@@$$') or isdefault != 'TRUE')
-- ----
UNION select inst_id,name,value || case isdefault when 'FALSE' then ' (SPFILE)' else null end,'900' from gv$parameter where name = 'archive_lag_target' and inst_id=1 and (nvl(value,'$$@@$$') != nvl('900','$$@@$$') or isdefault != 'FALSE')
-- ----
UNION select inst_id,name,value || case isdefault when 'FALSE' then ' (SPFILE)' else null end,'900' from gv$parameter where name = 'archive_lag_target' and inst_id=2 and (nvl(value,'$$@@$$') != nvl('900','$$@@$$') or isdefault != 'FALSE')
-- ----
UNION select inst_id,name,value || case isdefault when 'FALSE' then ' (SPFILE)' else null end,'900' from gv$parameter where name = 'undo_retention' and inst_id=1 and (nvl(value,'$$@@$$') != nvl('900','$$@@$$') or isdefault != 'FALSE')
-- ----
UNION select inst_id,name,value || case isdefault when 'FALSE' then ' (SPFILE)' else null end,'900' from gv$parameter where name = 'undo_retention' and inst_id=2 and (nvl(value,'$$@@$$') != nvl('900','$$@@$$') or isdefault != 'FALSE')
-- ----
UNION select inst_id,name,value || case isdefault when 'FALSE' then ' (SPFILE)' else null end,'92 (Def)' from gv$parameter where name = 'cpu_count' and inst_id=1 and (nvl(value,'$$@@$$') != nvl('92','$$@@$$') or isdefault != 'TRUE')
-- ----
UNION select inst_id,name,value || case isdefault when 'FALSE' then ' (SPFILE)' else null end,'92 (Def)' from gv$parameter where name = 'cpu_count' and inst_id=2 and (nvl(value,'$$@@$$') != nvl('92','$$@@$$') or isdefault != 'TRUE')
-- ----
UNION select inst_id,name,value || case isdefault when 'FALSE' then ' (SPFILE)' else null end,'92 (Def)' from gv$parameter where name = 'resource_manager_cpu_allocation' and inst_id=1 and (nvl(value,'$$@@$$') != nvl('92','$$@@$$') or isdefault != 'TRUE')
-- ----
UNION select inst_id,name,value || case isdefault when 'FALSE' then ' (SPFILE)' else null end,'92 (Def)' from gv$parameter where name = 'resource_manager_cpu_allocation' and inst_id=2 and (nvl(value,'$$@@$$') != nvl('92','$$@@$$') or isdefault != 'TRUE')
-- ----
UNION select inst_id,name,value || case isdefault when 'FALSE' then ' (SPFILE)' else null end,'920 (Def)' from gv$parameter where name = 'parallel_max_servers' and inst_id=1 and (nvl(value,'$$@@$$') != nvl('920','$$@@$$') or isdefault != 'TRUE')
-- ----
UNION select inst_id,name,value || case isdefault when 'FALSE' then ' (SPFILE)' else null end,'920 (Def)' from gv$parameter where name = 'parallel_max_servers' and inst_id=2 and (nvl(value,'$$@@$$') != nvl('920','$$@@$$') or isdefault != 'TRUE')
-- ----
UNION select inst_id,name,value || case isdefault when 'FALSE' then ' (SPFILE)' else null end,'920 (Def)' from gv$parameter where name = 'parallel_servers_target' and inst_id=1 and (nvl(value,'$$@@$$') != nvl('920','$$@@$$') or isdefault != 'TRUE')
-- ----
UNION select inst_id,name,value || case isdefault when 'FALSE' then ' (SPFILE)' else null end,'920 (Def)' from gv$parameter where name = 'parallel_servers_target' and inst_id=2 and (nvl(value,'$$@@$$') != nvl('920','$$@@$$') or isdefault != 'TRUE')
-- ----
UNION select inst_id,name,value || case isdefault when 'FALSE' then ' (SPFILE)' else null end,'ADAPTIVE (Def)' from gv$parameter where name = 'cell_offload_compaction' and inst_id=1 and (nvl(value,'$$@@$$') != nvl('ADAPTIVE','$$@@$$') or isdefault != 'TRUE')
-- ----
UNION select inst_id,name,value || case isdefault when 'FALSE' then ' (SPFILE)' else null end,'ADAPTIVE (Def)' from gv$parameter where name = 'cell_offload_compaction' and inst_id=2 and (nvl(value,'$$@@$$') != nvl('ADAPTIVE','$$@@$$') or isdefault != 'TRUE')
-- ----
UNION select inst_id,name,value || case isdefault when 'FALSE' then ' (SPFILE)' else null end,'ALL (Def)' from gv$parameter where name = 'outbound_dblink_protocols' and inst_id=1 and (nvl(value,'$$@@$$') != nvl('ALL','$$@@$$') or isdefault != 'TRUE')
-- ----
UNION select inst_id,name,value || case isdefault when 'FALSE' then ' (SPFILE)' else null end,'ALL (Def)' from gv$parameter where name = 'outbound_dblink_protocols' and inst_id=2 and (nvl(value,'$$@@$$') != nvl('ALL','$$@@$$') or isdefault != 'TRUE')
-- ----
UNION select inst_id,name,value || case isdefault when 'FALSE' then ' (SPFILE)' else null end,'ALL_ROWS (Def)' from gv$parameter where name = 'optimizer_mode' and inst_id=1 and (nvl(value,'$$@@$$') != nvl('ALL_ROWS','$$@@$$') or isdefault != 'TRUE')
-- ----
UNION select inst_id,name,value || case isdefault when 'FALSE' then ' (SPFILE)' else null end,'ALL_ROWS (Def)' from gv$parameter where name = 'optimizer_mode' and inst_id=2 and (nvl(value,'$$@@$$') != nvl('ALL_ROWS','$$@@$$') or isdefault != 'TRUE')
-- ----
UNION select inst_id,name,value || case isdefault when 'FALSE' then ' (SPFILE)' else null end,'AMERICA' from gv$parameter where name = 'nls_territory' and inst_id=1 and (nvl(value,'$$@@$$') != nvl('AMERICA','$$@@$$') or isdefault != 'FALSE')
-- ----
UNION select inst_id,name,value || case isdefault when 'FALSE' then ' (SPFILE)' else null end,'AMERICA' from gv$parameter where name = 'nls_territory' and inst_id=2 and (nvl(value,'$$@@$$') != nvl('AMERICA','$$@@$$') or isdefault != 'FALSE')
-- ----
UNION select inst_id,name,value || case isdefault when 'FALSE' then ' (SPFILE)' else null end,'AMERICAN' from gv$parameter where name = 'nls_language' and inst_id=1 and (nvl(value,'$$@@$$') != nvl('AMERICAN','$$@@$$') or isdefault != 'FALSE')
-- ----
UNION select inst_id,name,value || case isdefault when 'FALSE' then ' (SPFILE)' else null end,'AMERICAN' from gv$parameter where name = 'nls_language' and inst_id=2 and (nvl(value,'$$@@$$') != nvl('AMERICAN','$$@@$$') or isdefault != 'FALSE')
-- ----
UNION select inst_id,name,value || case isdefault when 'FALSE' then ' (SPFILE)' else null end,'AUTO (Def)' from gv$parameter where name = 'cell_offload_plan_display' and inst_id=1 and (nvl(value,'$$@@$$') != nvl('AUTO','$$@@$$') or isdefault != 'TRUE')
-- ----
UNION select inst_id,name,value || case isdefault when 'FALSE' then ' (SPFILE)' else null end,'AUTO (Def)' from gv$parameter where name = 'cell_offload_plan_display' and inst_id=2 and (nvl(value,'$$@@$$') != nvl('AUTO','$$@@$$') or isdefault != 'TRUE')
-- ----
UNION select inst_id,name,value || case isdefault when 'FALSE' then ' (SPFILE)' else null end,'AUTO (Def)' from gv$parameter where name = 'parallel_min_time_threshold' and inst_id=1 and (nvl(value,'$$@@$$') != nvl('AUTO','$$@@$$') or isdefault != 'TRUE')
-- ----
UNION select inst_id,name,value || case isdefault when 'FALSE' then ' (SPFILE)' else null end,'AUTO (Def)' from gv$parameter where name = 'parallel_min_time_threshold' and inst_id=2 and (nvl(value,'$$@@$$') != nvl('AUTO','$$@@$$') or isdefault != 'TRUE')
-- ----
UNION select inst_id,name,value || case isdefault when 'FALSE' then ' (SPFILE)' else null end,'AUTO (Def)' from gv$parameter where name = 'undo_management' and inst_id=1 and (nvl(value,'$$@@$$') != nvl('AUTO','$$@@$$') or isdefault != 'TRUE')
-- ----
UNION select inst_id,name,value || case isdefault when 'FALSE' then ' (SPFILE)' else null end,'AUTO (Def)' from gv$parameter where name = 'undo_management' and inst_id=2 and (nvl(value,'$$@@$$') != nvl('AUTO','$$@@$$') or isdefault != 'TRUE')
-- ----
UNION select inst_id,name,value || case isdefault when 'FALSE' then ' (SPFILE)' else null end,'AUTO (Def)' from gv$parameter where name = 'workarea_size_policy' and inst_id=1 and (nvl(value,'$$@@$$') != nvl('AUTO','$$@@$$') or isdefault != 'TRUE')
-- ----
UNION select inst_id,name,value || case isdefault when 'FALSE' then ' (SPFILE)' else null end,'AUTO (Def)' from gv$parameter where name = 'workarea_size_policy' and inst_id=2 and (nvl(value,'$$@@$$') != nvl('AUTO','$$@@$$') or isdefault != 'TRUE')
-- ----
UNION select inst_id,name,value || case isdefault when 'FALSE' then ' (SPFILE)' else null end,'AUTO' from gv$parameter where name = 'standby_file_management' and inst_id=1 and (nvl(value,'$$@@$$') != nvl('AUTO','$$@@$$') or isdefault != 'FALSE')
-- ----
UNION select inst_id,name,value || case isdefault when 'FALSE' then ' (SPFILE)' else null end,'AUTO' from gv$parameter where name = 'standby_file_management' and inst_id=2 and (nvl(value,'$$@@$$') != nvl('AUTO','$$@@$$') or isdefault != 'FALSE')
-- ----
UNION select inst_id,name,value || case isdefault when 'FALSE' then ' (SPFILE)' else null end,'BINARY (Def)' from gv$parameter where name = 'nls_comp' and inst_id=1 and (nvl(value,'$$@@$$') != nvl('BINARY','$$@@$$') or isdefault != 'TRUE')
-- ----
UNION select inst_id,name,value || case isdefault when 'FALSE' then ' (SPFILE)' else null end,'BINARY (Def)' from gv$parameter where name = 'nls_comp' and inst_id=2 and (nvl(value,'$$@@$$') != nvl('BINARY','$$@@$$') or isdefault != 'TRUE')
-- ----
UNION select inst_id,name,value || case isdefault when 'FALSE' then ' (SPFILE)' else null end,'BYTE (Def)' from gv$parameter where name = 'nls_length_semantics' and inst_id=1 and (nvl(value,'$$@@$$') != nvl('BYTE','$$@@$$') or isdefault != 'TRUE')
-- ----
UNION select inst_id,name,value || case isdefault when 'FALSE' then ' (SPFILE)' else null end,'BYTE (Def)' from gv$parameter where name = 'nls_length_semantics' and inst_id=2 and (nvl(value,'$$@@$$') != nvl('BYTE','$$@@$$') or isdefault != 'TRUE')
-- ----
UNION select inst_id,name,value || case isdefault when 'FALSE' then ' (SPFILE)' else null end,'C## (Def)' from gv$parameter where name = 'common_user_prefix' and inst_id=1 and (nvl(value,'$$@@$$') != nvl('C##','$$@@$$') or isdefault != 'TRUE')
-- ----
UNION select inst_id,name,value || case isdefault when 'FALSE' then ' (SPFILE)' else null end,'C## (Def)' from gv$parameter where name = 'common_user_prefix' and inst_id=2 and (nvl(value,'$$@@$$') != nvl('C##','$$@@$$') or isdefault != 'TRUE')
-- ----
UNION select inst_id,name,value || case isdefault when 'FALSE' then ' (SPFILE)' else null end,'CLOUD_ONLY' from gv$parameter where name = 'encrypt_new_tablespaces' and inst_id=1 and (nvl(value,'$$@@$$') != nvl('CLOUD_ONLY','$$@@$$') or isdefault != 'FALSE')
-- ----
UNION select inst_id,name,value || case isdefault when 'FALSE' then ' (SPFILE)' else null end,'CLOUD_ONLY' from gv$parameter where name = 'encrypt_new_tablespaces' and inst_id=2 and (nvl(value,'$$@@$$') != nvl('CLOUD_ONLY','$$@@$$') or isdefault != 'FALSE')
-- ----
UNION select inst_id,name,value || case isdefault when 'FALSE' then ' (SPFILE)' else null end,'CPU (Def)' from gv$parameter where name = 'parallel_degree_limit' and inst_id=1 and (nvl(value,'$$@@$$') != nvl('CPU','$$@@$$') or isdefault != 'TRUE')
-- ----
UNION select inst_id,name,value || case isdefault when 'FALSE' then ' (SPFILE)' else null end,'CPU (Def)' from gv$parameter where name = 'parallel_degree_limit' and inst_id=2 and (nvl(value,'$$@@$$') != nvl('CPU','$$@@$$') or isdefault != 'TRUE')
-- ----
UNION select inst_id,name,value || case isdefault when 'FALSE' then ' (SPFILE)' else null end,'DB' from gv$parameter where name = 'audit_trail' and inst_id=1 and (nvl(value,'$$@@$$') != nvl('DB','$$@@$$') or isdefault != 'FALSE')
-- ----
UNION select inst_id,name,value || case isdefault when 'FALSE' then ' (SPFILE)' else null end,'DB' from gv$parameter where name = 'audit_trail' and inst_id=2 and (nvl(value,'$$@@$$') != nvl('DB','$$@@$$') or isdefault != 'FALSE')
-- ----
UNION select inst_id,name,value || case isdefault when 'FALSE' then ' (SPFILE)' else null end,'DD/MM/YYYY HH24:MI:SS (Def)' from gv$parameter where name = 'nls_date_format' and inst_id=1 and (nvl(value,'$$@@$$') != nvl('DD/MM/YYYY HH24:MI:SS','$$@@$$') or isdefault != 'TRUE')
-- ----
UNION select inst_id,name,value || case isdefault when 'FALSE' then ' (SPFILE)' else null end,'DD/MM/YYYY HH24:MI:SS (Def)' from gv$parameter where name = 'nls_date_format' and inst_id=2 and (nvl(value,'$$@@$$') != nvl('DD/MM/YYYY HH24:MI:SS','$$@@$$') or isdefault != 'TRUE')
-- ----
UNION select inst_id,name,value || case isdefault when 'FALSE' then ' (SPFILE)' else null end,'DEFAULT (Def)' from gv$parameter where name = 'inmemory_force' and inst_id=1 and (nvl(value,'$$@@$$') != nvl('DEFAULT','$$@@$$') or isdefault != 'TRUE')
-- ----
UNION select inst_id,name,value || case isdefault when 'FALSE' then ' (SPFILE)' else null end,'DEFAULT (Def)' from gv$parameter where name = 'inmemory_force' and inst_id=2 and (nvl(value,'$$@@$$') != nvl('DEFAULT','$$@@$$') or isdefault != 'TRUE')
-- ----
UNION select inst_id,name,value || case isdefault when 'FALSE' then ' (SPFILE)' else null end,'DEFAULT (Def)' from gv$parameter where name = 'sqltune_category' and inst_id=1 and (nvl(value,'$$@@$$') != nvl('DEFAULT','$$@@$$') or isdefault != 'TRUE')
-- ----
UNION select inst_id,name,value || case isdefault when 'FALSE' then ' (SPFILE)' else null end,'DEFAULT (Def)' from gv$parameter where name = 'sqltune_category' and inst_id=2 and (nvl(value,'$$@@$$') != nvl('DEFAULT','$$@@$$') or isdefault != 'TRUE')
-- ----
UNION select inst_id,name,value || case isdefault when 'FALSE' then ' (SPFILE)' else null end,'DEFAULT_CDB_PLAN' from gv$parameter where name = 'resource_manager_plan' and inst_id=1 and (nvl(value,'$$@@$$') != nvl('DEFAULT_CDB_PLAN','$$@@$$') or isdefault != 'FALSE')
-- ----
UNION select inst_id,name,value || case isdefault when 'FALSE' then ' (SPFILE)' else null end,'DEFAULT_CDB_PLAN' from gv$parameter where name = 'resource_manager_plan' and inst_id=2 and (nvl(value,'$$@@$$') != nvl('DEFAULT_CDB_PLAN','$$@@$$') or isdefault != 'FALSE')
-- ----
UNION select inst_id,name,value || case isdefault when 'FALSE' then ' (SPFILE)' else null end,'DIAGNOSTIC+TUNING' from gv$parameter where name = 'control_management_pack_access' and inst_id=1 and (nvl(value,'$$@@$$') != nvl('DIAGNOSTIC+TUNING','$$@@$$') or isdefault != 'FALSE')
-- ----
UNION select inst_id,name,value || case isdefault when 'FALSE' then ' (SPFILE)' else null end,'DIAGNOSTIC+TUNING' from gv$parameter where name = 'control_management_pack_access' and inst_id=2 and (nvl(value,'$$@@$$') != nvl('DIAGNOSTIC+TUNING','$$@@$$') or isdefault != 'FALSE')
-- ----
UNION select inst_id,name,value || case isdefault when 'FALSE' then ' (SPFILE)' else null end,'DISABLE (Def)' from gv$parameter where name = 'inmemory_optimized_arithmetic' and inst_id=1 and (nvl(value,'$$@@$$') != nvl('DISABLE','$$@@$$') or isdefault != 'TRUE')
-- ----
UNION select inst_id,name,value || case isdefault when 'FALSE' then ' (SPFILE)' else null end,'DISABLE (Def)' from gv$parameter where name = 'inmemory_optimized_arithmetic' and inst_id=2 and (nvl(value,'$$@@$$') != nvl('DISABLE','$$@@$$') or isdefault != 'TRUE')
-- ----
UNION select inst_id,name,value || case isdefault when 'FALSE' then ' (SPFILE)' else null end,'DISABLE:ALL (Def)' from gv$parameter where name = 'plsql_warnings' and inst_id=1 and (nvl(value,'$$@@$$') != nvl('DISABLE:ALL','$$@@$$') or isdefault != 'TRUE')
-- ----
UNION select inst_id,name,value || case isdefault when 'FALSE' then ' (SPFILE)' else null end,'DISABLE:ALL (Def)' from gv$parameter where name = 'plsql_warnings' and inst_id=2 and (nvl(value,'$$@@$$') != nvl('DISABLE:ALL','$$@@$$') or isdefault != 'TRUE')
-- ----
UNION select inst_id,name,value || case isdefault when 'FALSE' then ' (SPFILE)' else null end,'ENABLE (Def)' from gv$parameter where name = 'inmemory_expressions_usage' and inst_id=1 and (nvl(value,'$$@@$$') != nvl('ENABLE','$$@@$$') or isdefault != 'TRUE')
-- ----
UNION select inst_id,name,value || case isdefault when 'FALSE' then ' (SPFILE)' else null end,'ENABLE (Def)' from gv$parameter where name = 'inmemory_expressions_usage' and inst_id=2 and (nvl(value,'$$@@$$') != nvl('ENABLE','$$@@$$') or isdefault != 'TRUE')
-- ----
UNION select inst_id,name,value || case isdefault when 'FALSE' then ' (SPFILE)' else null end,'ENABLE (Def)' from gv$parameter where name = 'inmemory_query' and inst_id=1 and (nvl(value,'$$@@$$') != nvl('ENABLE','$$@@$$') or isdefault != 'TRUE')
-- ----
UNION select inst_id,name,value || case isdefault when 'FALSE' then ' (SPFILE)' else null end,'ENABLE (Def)' from gv$parameter where name = 'inmemory_query' and inst_id=2 and (nvl(value,'$$@@$$') != nvl('ENABLE','$$@@$$') or isdefault != 'TRUE')
-- ----
UNION select inst_id,name,value || case isdefault when 'FALSE' then ' (SPFILE)' else null end,'ENABLE' from gv$parameter where name = 'inmemory_virtual_columns' and inst_id=1 and (nvl(value,'$$@@$$') != nvl('ENABLE','$$@@$$') or isdefault != 'FALSE')
-- ----
UNION select inst_id,name,value || case isdefault when 'FALSE' then ' (SPFILE)' else null end,'ENABLE' from gv$parameter where name = 'inmemory_virtual_columns' and inst_id=2 and (nvl(value,'$$@@$$') != nvl('ENABLE','$$@@$$') or isdefault != 'FALSE')
-- ----
UNION select inst_id,name,value || case isdefault when 'FALSE' then ' (SPFILE)' else null end,'EXACT (Def)' from gv$parameter where name = 'cursor_sharing' and inst_id=1 and (nvl(value,'$$@@$$') != nvl('EXACT','$$@@$$') or isdefault != 'TRUE')
-- ----
UNION select inst_id,name,value || case isdefault when 'FALSE' then ' (SPFILE)' else null end,'EXACT (Def)' from gv$parameter where name = 'cursor_sharing' and inst_id=2 and (nvl(value,'$$@@$$') != nvl('EXACT','$$@@$$') or isdefault != 'TRUE')
-- ----
UNION select inst_id,name,value || case isdefault when 'FALSE' then ' (SPFILE)' else null end,'EXCLUSIVE' from gv$parameter where name = 'remote_login_passwordfile' and inst_id=1 and (nvl(value,'$$@@$$') != nvl('EXCLUSIVE','$$@@$$') or isdefault != 'FALSE')
-- ----
UNION select inst_id,name,value || case isdefault when 'FALSE' then ' (SPFILE)' else null end,'EXCLUSIVE' from gv$parameter where name = 'remote_login_passwordfile' and inst_id=2 and (nvl(value,'$$@@$$') != nvl('EXCLUSIVE','$$@@$$') or isdefault != 'FALSE')
-- ----
UNION select inst_id,name,value || case isdefault when 'FALSE' then ' (SPFILE)' else null end,'FALSE (Def)' from gv$parameter where name = 'DBFIPS_140' and inst_id=1 and (nvl(value,'$$@@$$') != nvl('FALSE','$$@@$$') or isdefault != 'TRUE')
-- ----
UNION select inst_id,name,value || case isdefault when 'FALSE' then ' (SPFILE)' else null end,'FALSE (Def)' from gv$parameter where name = 'DBFIPS_140' and inst_id=2 and (nvl(value,'$$@@$$') != nvl('FALSE','$$@@$$') or isdefault != 'TRUE')
-- ----
UNION select inst_id,name,value || case isdefault when 'FALSE' then ' (SPFILE)' else null end,'FALSE (Def)' from gv$parameter where name = 'O7_DICTIONARY_ACCESSIBILITY' and inst_id=1 and (nvl(value,'$$@@$$') != nvl('FALSE','$$@@$$') or isdefault != 'TRUE')
-- ----
UNION select inst_id,name,value || case isdefault when 'FALSE' then ' (SPFILE)' else null end,'FALSE (Def)' from gv$parameter where name = 'O7_DICTIONARY_ACCESSIBILITY' and inst_id=2 and (nvl(value,'$$@@$$') != nvl('FALSE','$$@@$$') or isdefault != 'TRUE')
-- ----
UNION select inst_id,name,value || case isdefault when 'FALSE' then ' (SPFILE)' else null end,'FALSE (Def)' from gv$parameter where name = 'allow_global_dblinks' and inst_id=1 and (nvl(value,'$$@@$$') != nvl('FALSE','$$@@$$') or isdefault != 'TRUE')
-- ----
UNION select inst_id,name,value || case isdefault when 'FALSE' then ' (SPFILE)' else null end,'FALSE (Def)' from gv$parameter where name = 'allow_global_dblinks' and inst_id=2 and (nvl(value,'$$@@$$') != nvl('FALSE','$$@@$$') or isdefault != 'TRUE')
-- ----
UNION select inst_id,name,value || case isdefault when 'FALSE' then ' (SPFILE)' else null end,'FALSE (Def)' from gv$parameter where name = 'allow_group_access_to_sga' and inst_id=1 and (nvl(value,'$$@@$$') != nvl('FALSE','$$@@$$') or isdefault != 'TRUE')
-- ----
UNION select inst_id,name,value || case isdefault when 'FALSE' then ' (SPFILE)' else null end,'FALSE (Def)' from gv$parameter where name = 'allow_group_access_to_sga' and inst_id=2 and (nvl(value,'$$@@$$') != nvl('FALSE','$$@@$$') or isdefault != 'TRUE')
-- ----
UNION select inst_id,name,value || case isdefault when 'FALSE' then ' (SPFILE)' else null end,'FALSE (Def)' from gv$parameter where name = 'approx_for_aggregation' and inst_id=1 and (nvl(value,'$$@@$$') != nvl('FALSE','$$@@$$') or isdefault != 'TRUE')
-- ----
UNION select inst_id,name,value || case isdefault when 'FALSE' then ' (SPFILE)' else null end,'FALSE (Def)' from gv$parameter where name = 'approx_for_aggregation' and inst_id=2 and (nvl(value,'$$@@$$') != nvl('FALSE','$$@@$$') or isdefault != 'TRUE')
-- ----
UNION select inst_id,name,value || case isdefault when 'FALSE' then ' (SPFILE)' else null end,'FALSE (Def)' from gv$parameter where name = 'approx_for_count_distinct' and inst_id=1 and (nvl(value,'$$@@$$') != nvl('FALSE','$$@@$$') or isdefault != 'TRUE')
-- ----
UNION select inst_id,name,value || case isdefault when 'FALSE' then ' (SPFILE)' else null end,'FALSE (Def)' from gv$parameter where name = 'approx_for_count_distinct' and inst_id=2 and (nvl(value,'$$@@$$') != nvl('FALSE','$$@@$$') or isdefault != 'TRUE')
-- ----
UNION select inst_id,name,value || case isdefault when 'FALSE' then ' (SPFILE)' else null end,'FALSE (Def)' from gv$parameter where name = 'backup_tape_io_slaves' and inst_id=1 and (nvl(value,'$$@@$$') != nvl('FALSE','$$@@$$') or isdefault != 'TRUE')
-- ----
UNION select inst_id,name,value || case isdefault when 'FALSE' then ' (SPFILE)' else null end,'FALSE (Def)' from gv$parameter where name = 'backup_tape_io_slaves' and inst_id=2 and (nvl(value,'$$@@$$') != nvl('FALSE','$$@@$$') or isdefault != 'TRUE')
-- ----
UNION select inst_id,name,value || case isdefault when 'FALSE' then ' (SPFILE)' else null end,'FALSE (Def)' from gv$parameter where name = 'blank_trimming' and inst_id=1 and (nvl(value,'$$@@$$') != nvl('FALSE','$$@@$$') or isdefault != 'TRUE')
-- ----
UNION select inst_id,name,value || case isdefault when 'FALSE' then ' (SPFILE)' else null end,'FALSE (Def)' from gv$parameter where name = 'blank_trimming' and inst_id=2 and (nvl(value,'$$@@$$') != nvl('FALSE','$$@@$$') or isdefault != 'TRUE')
-- ----
UNION select inst_id,name,value || case isdefault when 'FALSE' then ' (SPFILE)' else null end,'FALSE (Def)' from gv$parameter where name = 'cdb_cluster' and inst_id=1 and (nvl(value,'$$@@$$') != nvl('FALSE','$$@@$$') or isdefault != 'TRUE')
-- ----
UNION select inst_id,name,value || case isdefault when 'FALSE' then ' (SPFILE)' else null end,'FALSE (Def)' from gv$parameter where name = 'cdb_cluster' and inst_id=2 and (nvl(value,'$$@@$$') != nvl('FALSE','$$@@$$') or isdefault != 'TRUE')
-- ----
UNION select inst_id,name,value || case isdefault when 'FALSE' then ' (SPFILE)' else null end,'FALSE (Def)' from gv$parameter where name = 'clonedb' and inst_id=1 and (nvl(value,'$$@@$$') != nvl('FALSE','$$@@$$') or isdefault != 'TRUE')
-- ----
UNION select inst_id,name,value || case isdefault when 'FALSE' then ' (SPFILE)' else null end,'FALSE (Def)' from gv$parameter where name = 'clonedb' and inst_id=2 and (nvl(value,'$$@@$$') != nvl('FALSE','$$@@$$') or isdefault != 'TRUE')
-- ----
UNION select inst_id,name,value || case isdefault when 'FALSE' then ' (SPFILE)' else null end,'FALSE (Def)' from gv$parameter where name = 'cursor_space_for_time' and inst_id=1 and (nvl(value,'$$@@$$') != nvl('FALSE','$$@@$$') or isdefault != 'TRUE')
-- ----
UNION select inst_id,name,value || case isdefault when 'FALSE' then ' (SPFILE)' else null end,'FALSE (Def)' from gv$parameter where name = 'cursor_space_for_time' and inst_id=2 and (nvl(value,'$$@@$$') != nvl('FALSE','$$@@$$') or isdefault != 'TRUE')
-- ----
UNION select inst_id,name,value || case isdefault when 'FALSE' then ' (SPFILE)' else null end,'FALSE (Def)' from gv$parameter where name = 'enable_dnfs_dispatcher' and inst_id=1 and (nvl(value,'$$@@$$') != nvl('FALSE','$$@@$$') or isdefault != 'TRUE')
-- ----
UNION select inst_id,name,value || case isdefault when 'FALSE' then ' (SPFILE)' else null end,'FALSE (Def)' from gv$parameter where name = 'enable_dnfs_dispatcher' and inst_id=2 and (nvl(value,'$$@@$$') != nvl('FALSE','$$@@$$') or isdefault != 'TRUE')
-- ----
UNION select inst_id,name,value || case isdefault when 'FALSE' then ' (SPFILE)' else null end,'FALSE (Def)' from gv$parameter where name = 'enable_goldengate_replication' and inst_id=1 and (nvl(value,'$$@@$$') != nvl('FALSE','$$@@$$') or isdefault != 'TRUE')
-- ----
UNION select inst_id,name,value || case isdefault when 'FALSE' then ' (SPFILE)' else null end,'FALSE (Def)' from gv$parameter where name = 'enable_goldengate_replication' and inst_id=2 and (nvl(value,'$$@@$$') != nvl('FALSE','$$@@$$') or isdefault != 'TRUE')
-- ----
UNION select inst_id,name,value || case isdefault when 'FALSE' then ' (SPFILE)' else null end,'FALSE (Def)' from gv$parameter where name = 'file_mapping' and inst_id=1 and (nvl(value,'$$@@$$') != nvl('FALSE','$$@@$$') or isdefault != 'TRUE')
-- ----
UNION select inst_id,name,value || case isdefault when 'FALSE' then ' (SPFILE)' else null end,'FALSE (Def)' from gv$parameter where name = 'file_mapping' and inst_id=2 and (nvl(value,'$$@@$$') != nvl('FALSE','$$@@$$') or isdefault != 'TRUE')
-- ----
UNION select inst_id,name,value || case isdefault when 'FALSE' then ' (SPFILE)' else null end,'FALSE (Def)' from gv$parameter where name = 'global_names' and inst_id=1 and (nvl(value,'$$@@$$') != nvl('FALSE','$$@@$$') or isdefault != 'TRUE')
-- ----
UNION select inst_id,name,value || case isdefault when 'FALSE' then ' (SPFILE)' else null end,'FALSE (Def)' from gv$parameter where name = 'global_names' and inst_id=2 and (nvl(value,'$$@@$$') != nvl('FALSE','$$@@$$') or isdefault != 'TRUE')
-- ----
UNION select inst_id,name,value || case isdefault when 'FALSE' then ' (SPFILE)' else null end,'FALSE (Def)' from gv$parameter where name = 'instant_restore' and inst_id=1 and (nvl(value,'$$@@$$') != nvl('FALSE','$$@@$$') or isdefault != 'TRUE')
-- ----
UNION select inst_id,name,value || case isdefault when 'FALSE' then ' (SPFILE)' else null end,'FALSE (Def)' from gv$parameter where name = 'instant_restore' and inst_id=2 and (nvl(value,'$$@@$$') != nvl('FALSE','$$@@$$') or isdefault != 'TRUE')
-- ----
UNION select inst_id,name,value || case isdefault when 'FALSE' then ' (SPFILE)' else null end,'FALSE (Def)' from gv$parameter where name = 'lock_sga' and inst_id=1 and (nvl(value,'$$@@$$') != nvl('FALSE','$$@@$$') or isdefault != 'TRUE')
-- ----
UNION select inst_id,name,value || case isdefault when 'FALSE' then ' (SPFILE)' else null end,'FALSE (Def)' from gv$parameter where name = 'lock_sga' and inst_id=2 and (nvl(value,'$$@@$$') != nvl('FALSE','$$@@$$') or isdefault != 'TRUE')
-- ----
UNION select inst_id,name,value || case isdefault when 'FALSE' then ' (SPFILE)' else null end,'FALSE (Def)' from gv$parameter where name = 'log_checkpoints_to_alert' and inst_id=1 and (nvl(value,'$$@@$$') != nvl('FALSE','$$@@$$') or isdefault != 'TRUE')
-- ----
UNION select inst_id,name,value || case isdefault when 'FALSE' then ' (SPFILE)' else null end,'FALSE (Def)' from gv$parameter where name = 'log_checkpoints_to_alert' and inst_id=2 and (nvl(value,'$$@@$$') != nvl('FALSE','$$@@$$') or isdefault != 'TRUE')
-- ----
UNION select inst_id,name,value || case isdefault when 'FALSE' then ' (SPFILE)' else null end,'FALSE (Def)' from gv$parameter where name = 'nls_nchar_conv_excp' and inst_id=1 and (nvl(value,'$$@@$$') != nvl('FALSE','$$@@$$') or isdefault != 'TRUE')
-- ----
UNION select inst_id,name,value || case isdefault when 'FALSE' then ' (SPFILE)' else null end,'FALSE (Def)' from gv$parameter where name = 'nls_nchar_conv_excp' and inst_id=2 and (nvl(value,'$$@@$$') != nvl('FALSE','$$@@$$') or isdefault != 'TRUE')
-- ----
UNION select inst_id,name,value || case isdefault when 'FALSE' then ' (SPFILE)' else null end,'FALSE (Def)' from gv$parameter where name = 'noncdb_compatible' and inst_id=1 and (nvl(value,'$$@@$$') != nvl('FALSE','$$@@$$') or isdefault != 'TRUE')
-- ----
UNION select inst_id,name,value || case isdefault when 'FALSE' then ' (SPFILE)' else null end,'FALSE (Def)' from gv$parameter where name = 'noncdb_compatible' and inst_id=2 and (nvl(value,'$$@@$$') != nvl('FALSE','$$@@$$') or isdefault != 'TRUE')
-- ----
UNION select inst_id,name,value || case isdefault when 'FALSE' then ' (SPFILE)' else null end,'FALSE (Def)' from gv$parameter where name = 'one_step_plugin_for_pdb_with_tde' and inst_id=1 and (nvl(value,'$$@@$$') != nvl('FALSE','$$@@$$') or isdefault != 'TRUE')
-- ----
UNION select inst_id,name,value || case isdefault when 'FALSE' then ' (SPFILE)' else null end,'FALSE (Def)' from gv$parameter where name = 'one_step_plugin_for_pdb_with_tde' and inst_id=2 and (nvl(value,'$$@@$$') != nvl('FALSE','$$@@$$') or isdefault != 'TRUE')
-- ----
UNION select inst_id,name,value || case isdefault when 'FALSE' then ' (SPFILE)' else null end,'FALSE (Def)' from gv$parameter where name = 'optimizer_adaptive_reporting_only' and inst_id=1 and (nvl(value,'$$@@$$') != nvl('FALSE','$$@@$$') or isdefault != 'TRUE')
-- ----
UNION select inst_id,name,value || case isdefault when 'FALSE' then ' (SPFILE)' else null end,'FALSE (Def)' from gv$parameter where name = 'optimizer_adaptive_reporting_only' and inst_id=2 and (nvl(value,'$$@@$$') != nvl('FALSE','$$@@$$') or isdefault != 'TRUE')
-- ----
UNION select inst_id,name,value || case isdefault when 'FALSE' then ' (SPFILE)' else null end,'FALSE (Def)' from gv$parameter where name = 'optimizer_adaptive_statistics' and inst_id=1 and (nvl(value,'$$@@$$') != nvl('FALSE','$$@@$$') or isdefault != 'TRUE')
-- ----
UNION select inst_id,name,value || case isdefault when 'FALSE' then ' (SPFILE)' else null end,'FALSE (Def)' from gv$parameter where name = 'optimizer_adaptive_statistics' and inst_id=2 and (nvl(value,'$$@@$$') != nvl('FALSE','$$@@$$') or isdefault != 'TRUE')
-- ----
UNION select inst_id,name,value || case isdefault when 'FALSE' then ' (SPFILE)' else null end,'FALSE (Def)' from gv$parameter where name = 'optimizer_capture_sql_plan_baselines' and inst_id=1 and (nvl(value,'$$@@$$') != nvl('FALSE','$$@@$$') or isdefault != 'TRUE')
-- ----
UNION select inst_id,name,value || case isdefault when 'FALSE' then ' (SPFILE)' else null end,'FALSE (Def)' from gv$parameter where name = 'optimizer_capture_sql_plan_baselines' and inst_id=2 and (nvl(value,'$$@@$$') != nvl('FALSE','$$@@$$') or isdefault != 'TRUE')
-- ----
UNION select inst_id,name,value || case isdefault when 'FALSE' then ' (SPFILE)' else null end,'FALSE (Def)' from gv$parameter where name = 'optimizer_ignore_hints' and inst_id=1 and (nvl(value,'$$@@$$') != nvl('FALSE','$$@@$$') or isdefault != 'TRUE')
-- ----
UNION select inst_id,name,value || case isdefault when 'FALSE' then ' (SPFILE)' else null end,'FALSE (Def)' from gv$parameter where name = 'optimizer_ignore_hints' and inst_id=2 and (nvl(value,'$$@@$$') != nvl('FALSE','$$@@$$') or isdefault != 'TRUE')
-- ----
UNION select inst_id,name,value || case isdefault when 'FALSE' then ' (SPFILE)' else null end,'FALSE (Def)' from gv$parameter where name = 'optimizer_ignore_parallel_hints' and inst_id=1 and (nvl(value,'$$@@$$') != nvl('FALSE','$$@@$$') or isdefault != 'TRUE')
-- ----
UNION select inst_id,name,value || case isdefault when 'FALSE' then ' (SPFILE)' else null end,'FALSE (Def)' from gv$parameter where name = 'optimizer_ignore_parallel_hints' and inst_id=2 and (nvl(value,'$$@@$$') != nvl('FALSE','$$@@$$') or isdefault != 'TRUE')
-- ----
UNION select inst_id,name,value || case isdefault when 'FALSE' then ' (SPFILE)' else null end,'FALSE (Def)' from gv$parameter where name = 'optimizer_use_invisible_indexes' and inst_id=1 and (nvl(value,'$$@@$$') != nvl('FALSE','$$@@$$') or isdefault != 'TRUE')
-- ----
UNION select inst_id,name,value || case isdefault when 'FALSE' then ' (SPFILE)' else null end,'FALSE (Def)' from gv$parameter where name = 'optimizer_use_invisible_indexes' and inst_id=2 and (nvl(value,'$$@@$$') != nvl('FALSE','$$@@$$') or isdefault != 'TRUE')
-- ----
UNION select inst_id,name,value || case isdefault when 'FALSE' then ' (SPFILE)' else null end,'FALSE (Def)' from gv$parameter where name = 'optimizer_use_pending_statistics' and inst_id=1 and (nvl(value,'$$@@$$') != nvl('FALSE','$$@@$$') or isdefault != 'TRUE')
-- ----
UNION select inst_id,name,value || case isdefault when 'FALSE' then ' (SPFILE)' else null end,'FALSE (Def)' from gv$parameter where name = 'optimizer_use_pending_statistics' and inst_id=2 and (nvl(value,'$$@@$$') != nvl('FALSE','$$@@$$') or isdefault != 'TRUE')
-- ----
UNION select inst_id,name,value || case isdefault when 'FALSE' then ' (SPFILE)' else null end,'FALSE (Def)' from gv$parameter where name = 'os_roles' and inst_id=1 and (nvl(value,'$$@@$$') != nvl('FALSE','$$@@$$') or isdefault != 'TRUE')
-- ----
UNION select inst_id,name,value || case isdefault when 'FALSE' then ' (SPFILE)' else null end,'FALSE (Def)' from gv$parameter where name = 'os_roles' and inst_id=2 and (nvl(value,'$$@@$$') != nvl('FALSE','$$@@$$') or isdefault != 'TRUE')
-- ----
UNION select inst_id,name,value || case isdefault when 'FALSE' then ' (SPFILE)' else null end,'FALSE (Def)' from gv$parameter where name = 'parallel_adaptive_multi_user' and inst_id=1 and (nvl(value,'$$@@$$') != nvl('FALSE','$$@@$$') or isdefault != 'TRUE')
-- ----
UNION select inst_id,name,value || case isdefault when 'FALSE' then ' (SPFILE)' else null end,'FALSE (Def)' from gv$parameter where name = 'parallel_adaptive_multi_user' and inst_id=2 and (nvl(value,'$$@@$$') != nvl('FALSE','$$@@$$') or isdefault != 'TRUE')
-- ----
UNION select inst_id,name,value || case isdefault when 'FALSE' then ' (SPFILE)' else null end,'FALSE (Def)' from gv$parameter where name = 'plsql_debug' and inst_id=1 and (nvl(value,'$$@@$$') != nvl('FALSE','$$@@$$') or isdefault != 'TRUE')
-- ----
UNION select inst_id,name,value || case isdefault when 'FALSE' then ' (SPFILE)' else null end,'FALSE (Def)' from gv$parameter where name = 'plsql_debug' and inst_id=2 and (nvl(value,'$$@@$$') != nvl('FALSE','$$@@$$') or isdefault != 'TRUE')
-- ----
UNION select inst_id,name,value || case isdefault when 'FALSE' then ' (SPFILE)' else null end,'FALSE (Def)' from gv$parameter where name = 'plsql_v2_compatibility' and inst_id=1 and (nvl(value,'$$@@$$') != nvl('FALSE','$$@@$$') or isdefault != 'TRUE')
-- ----
UNION select inst_id,name,value || case isdefault when 'FALSE' then ' (SPFILE)' else null end,'FALSE (Def)' from gv$parameter where name = 'plsql_v2_compatibility' and inst_id=2 and (nvl(value,'$$@@$$') != nvl('FALSE','$$@@$$') or isdefault != 'TRUE')
-- ----
UNION select inst_id,name,value || case isdefault when 'FALSE' then ' (SPFILE)' else null end,'FALSE (Def)' from gv$parameter where name = 'read_only_open_delayed' and inst_id=1 and (nvl(value,'$$@@$$') != nvl('FALSE','$$@@$$') or isdefault != 'TRUE')
-- ----
UNION select inst_id,name,value || case isdefault when 'FALSE' then ' (SPFILE)' else null end,'FALSE (Def)' from gv$parameter where name = 'read_only_open_delayed' and inst_id=2 and (nvl(value,'$$@@$$') != nvl('FALSE','$$@@$$') or isdefault != 'TRUE')
-- ----
UNION select inst_id,name,value || case isdefault when 'FALSE' then ' (SPFILE)' else null end,'FALSE (Def)' from gv$parameter where name = 'remote_os_authent' and inst_id=1 and (nvl(value,'$$@@$$') != nvl('FALSE','$$@@$$') or isdefault != 'TRUE')
-- ----
UNION select inst_id,name,value || case isdefault when 'FALSE' then ' (SPFILE)' else null end,'FALSE (Def)' from gv$parameter where name = 'remote_os_authent' and inst_id=2 and (nvl(value,'$$@@$$') != nvl('FALSE','$$@@$$') or isdefault != 'TRUE')
-- ----
UNION select inst_id,name,value || case isdefault when 'FALSE' then ' (SPFILE)' else null end,'FALSE (Def)' from gv$parameter where name = 'remote_os_roles' and inst_id=1 and (nvl(value,'$$@@$$') != nvl('FALSE','$$@@$$') or isdefault != 'TRUE')
-- ----
UNION select inst_id,name,value || case isdefault when 'FALSE' then ' (SPFILE)' else null end,'FALSE (Def)' from gv$parameter where name = 'remote_os_roles' and inst_id=2 and (nvl(value,'$$@@$$') != nvl('FALSE','$$@@$$') or isdefault != 'TRUE')
-- ----
UNION select inst_id,name,value || case isdefault when 'FALSE' then ' (SPFILE)' else null end,'FALSE (Def)' from gv$parameter where name = 'resource_manage_goldengate' and inst_id=1 and (nvl(value,'$$@@$$') != nvl('FALSE','$$@@$$') or isdefault != 'TRUE')
-- ----
UNION select inst_id,name,value || case isdefault when 'FALSE' then ' (SPFILE)' else null end,'FALSE (Def)' from gv$parameter where name = 'resource_manage_goldengate' and inst_id=2 and (nvl(value,'$$@@$$') != nvl('FALSE','$$@@$$') or isdefault != 'TRUE')
-- ----
UNION select inst_id,name,value || case isdefault when 'FALSE' then ' (SPFILE)' else null end,'FALSE (Def)' from gv$parameter where name = 'sec_return_server_release_banner' and inst_id=1 and (nvl(value,'$$@@$$') != nvl('FALSE','$$@@$$') or isdefault != 'TRUE')
-- ----
UNION select inst_id,name,value || case isdefault when 'FALSE' then ' (SPFILE)' else null end,'FALSE (Def)' from gv$parameter where name = 'sec_return_server_release_banner' and inst_id=2 and (nvl(value,'$$@@$$') != nvl('FALSE','$$@@$$') or isdefault != 'TRUE')
-- ----
UNION select inst_id,name,value || case isdefault when 'FALSE' then ' (SPFILE)' else null end,'FALSE (Def)' from gv$parameter where name = 'spatial_vector_acceleration' and inst_id=1 and (nvl(value,'$$@@$$') != nvl('FALSE','$$@@$$') or isdefault != 'TRUE')
-- ----
UNION select inst_id,name,value || case isdefault when 'FALSE' then ' (SPFILE)' else null end,'FALSE (Def)' from gv$parameter where name = 'spatial_vector_acceleration' and inst_id=2 and (nvl(value,'$$@@$$') != nvl('FALSE','$$@@$$') or isdefault != 'TRUE')
-- ----
UNION select inst_id,name,value || case isdefault when 'FALSE' then ' (SPFILE)' else null end,'FALSE (Def)' from gv$parameter where name = 'sql_trace' and inst_id=1 and (nvl(value,'$$@@$$') != nvl('FALSE','$$@@$$') or isdefault != 'TRUE')
-- ----
UNION select inst_id,name,value || case isdefault when 'FALSE' then ' (SPFILE)' else null end,'FALSE (Def)' from gv$parameter where name = 'sql_trace' and inst_id=2 and (nvl(value,'$$@@$$') != nvl('FALSE','$$@@$$') or isdefault != 'TRUE')
-- ----
UNION select inst_id,name,value || case isdefault when 'FALSE' then ' (SPFILE)' else null end,'FALSE (Def)' from gv$parameter where name = 'star_transformation_enabled' and inst_id=1 and (nvl(value,'$$@@$$') != nvl('FALSE','$$@@$$') or isdefault != 'TRUE')
-- ----
UNION select inst_id,name,value || case isdefault when 'FALSE' then ' (SPFILE)' else null end,'FALSE (Def)' from gv$parameter where name = 'star_transformation_enabled' and inst_id=2 and (nvl(value,'$$@@$$') != nvl('FALSE','$$@@$$') or isdefault != 'TRUE')
-- ----
UNION select inst_id,name,value || case isdefault when 'FALSE' then ' (SPFILE)' else null end,'FALSE (Def)' from gv$parameter where name = 'temp_undo_enabled' and inst_id=1 and (nvl(value,'$$@@$$') != nvl('FALSE','$$@@$$') or isdefault != 'TRUE')
-- ----
UNION select inst_id,name,value || case isdefault when 'FALSE' then ' (SPFILE)' else null end,'FALSE (Def)' from gv$parameter where name = 'temp_undo_enabled' and inst_id=2 and (nvl(value,'$$@@$$') != nvl('FALSE','$$@@$$') or isdefault != 'TRUE')
-- ----
UNION select inst_id,name,value || case isdefault when 'FALSE' then ' (SPFILE)' else null end,'FALSE (Def)' from gv$parameter where name = 'threaded_execution' and inst_id=1 and (nvl(value,'$$@@$$') != nvl('FALSE','$$@@$$') or isdefault != 'TRUE')
-- ----
UNION select inst_id,name,value || case isdefault when 'FALSE' then ' (SPFILE)' else null end,'FALSE (Def)' from gv$parameter where name = 'threaded_execution' and inst_id=2 and (nvl(value,'$$@@$$') != nvl('FALSE','$$@@$$') or isdefault != 'TRUE')
-- ----
UNION select inst_id,name,value || case isdefault when 'FALSE' then ' (SPFILE)' else null end,'FALSE (Def)' from gv$parameter where name = 'use_dedicated_broker' and inst_id=1 and (nvl(value,'$$@@$$') != nvl('FALSE','$$@@$$') or isdefault != 'TRUE')
-- ----
UNION select inst_id,name,value || case isdefault when 'FALSE' then ' (SPFILE)' else null end,'FALSE (Def)' from gv$parameter where name = 'use_dedicated_broker' and inst_id=2 and (nvl(value,'$$@@$$') != nvl('FALSE','$$@@$$') or isdefault != 'TRUE')
-- ----
UNION select inst_id,name,value || case isdefault when 'FALSE' then ' (SPFILE)' else null end,'FALSE' from gv$parameter where name = 'pre_page_sga' and inst_id=1 and (nvl(value,'$$@@$$') != nvl('FALSE','$$@@$$') or isdefault != 'FALSE')
-- ----
UNION select inst_id,name,value || case isdefault when 'FALSE' then ' (SPFILE)' else null end,'FALSE' from gv$parameter where name = 'pre_page_sga' and inst_id=2 and (nvl(value,'$$@@$$') != nvl('FALSE','$$@@$$') or isdefault != 'FALSE')
-- ----
UNION select inst_id,name,value || case isdefault when 'FALSE' then ' (SPFILE)' else null end,'IDENTIFIERS:NONE (Def)' from gv$parameter where name = 'plscope_settings' and inst_id=1 and (nvl(value,'$$@@$$') != nvl('IDENTIFIERS:NONE','$$@@$$') or isdefault != 'TRUE')
-- ----
UNION select inst_id,name,value || case isdefault when 'FALSE' then ' (SPFILE)' else null end,'IDENTIFIERS:NONE (Def)' from gv$parameter where name = 'plscope_settings' and inst_id=2 and (nvl(value,'$$@@$$') != nvl('IDENTIFIERS:NONE','$$@@$$') or isdefault != 'TRUE')
-- ----
UNION select inst_id,name,value || case isdefault when 'FALSE' then ' (SPFILE)' else null end,'IMMEDIATE (Def)' from gv$parameter where name = 'cursor_invalidation' and inst_id=1 and (nvl(value,'$$@@$$') != nvl('IMMEDIATE','$$@@$$') or isdefault != 'TRUE')
-- ----
UNION select inst_id,name,value || case isdefault when 'FALSE' then ' (SPFILE)' else null end,'IMMEDIATE (Def)' from gv$parameter where name = 'cursor_invalidation' and inst_id=2 and (nvl(value,'$$@@$$') != nvl('IMMEDIATE','$$@@$$') or isdefault != 'TRUE')
-- ----
UNION select inst_id,name,value || case isdefault when 'FALSE' then ' (SPFILE)' else null end,'INTERPRETED (Def)' from gv$parameter where name = 'plsql_code_type' and inst_id=1 and (nvl(value,'$$@@$$') != nvl('INTERPRETED','$$@@$$') or isdefault != 'TRUE')
-- ----
UNION select inst_id,name,value || case isdefault when 'FALSE' then ' (SPFILE)' else null end,'INTERPRETED (Def)' from gv$parameter where name = 'plsql_code_type' and inst_id=2 and (nvl(value,'$$@@$$') != nvl('INTERPRETED','$$@@$$') or isdefault != 'TRUE')
-- ----
UNION select inst_id,name,value || case isdefault when 'FALSE' then ' (SPFILE)' else null end,'LOCAL (Def)' from gv$parameter where name = 'adg_account_info_tracking' and inst_id=1 and (nvl(value,'$$@@$$') != nvl('LOCAL','$$@@$$') or isdefault != 'TRUE')
-- ----
UNION select inst_id,name,value || case isdefault when 'FALSE' then ' (SPFILE)' else null end,'LOCAL (Def)' from gv$parameter where name = 'adg_account_info_tracking' and inst_id=2 and (nvl(value,'$$@@$$') != nvl('LOCAL','$$@@$$') or isdefault != 'TRUE')
-- ----
UNION select inst_id,name,value || case isdefault when 'FALSE' then ' (SPFILE)' else null end,'LOW (Def)' from gv$parameter where name = 'fast_start_parallel_rollback' and inst_id=1 and (nvl(value,'$$@@$$') != nvl('LOW','$$@@$$') or isdefault != 'TRUE')
-- ----
UNION select inst_id,name,value || case isdefault when 'FALSE' then ' (SPFILE)' else null end,'LOW (Def)' from gv$parameter where name = 'fast_start_parallel_rollback' and inst_id=2 and (nvl(value,'$$@@$$') != nvl('LOW','$$@@$$') or isdefault != 'TRUE')
-- ----
UNION select inst_id,name,value || case isdefault when 'FALSE' then ' (SPFILE)' else null end,'MANUAL (Def)' from gv$parameter where name = 'parallel_degree_policy' and inst_id=1 and (nvl(value,'$$@@$$') != nvl('MANUAL','$$@@$$') or isdefault != 'TRUE')
-- ----
UNION select inst_id,name,value || case isdefault when 'FALSE' then ' (SPFILE)' else null end,'MANUAL (Def)' from gv$parameter where name = 'parallel_degree_policy' and inst_id=2 and (nvl(value,'$$@@$$') != nvl('MANUAL','$$@@$$') or isdefault != 'TRUE')
-- ----
UNION select inst_id,name,value || case isdefault when 'FALSE' then ' (SPFILE)' else null end,'MANUAL (Def)' from gv$parameter where name = 'result_cache_mode' and inst_id=1 and (nvl(value,'$$@@$$') != nvl('MANUAL','$$@@$$') or isdefault != 'TRUE')
-- ----
UNION select inst_id,name,value || case isdefault when 'FALSE' then ' (SPFILE)' else null end,'MANUAL (Def)' from gv$parameter where name = 'result_cache_mode' and inst_id=2 and (nvl(value,'$$@@$$') != nvl('MANUAL','$$@@$$') or isdefault != 'TRUE')
-- ----
UNION select inst_id,name,value || case isdefault when 'FALSE' then ' (SPFILE)' else null end,'MEDIUM' from gv$parameter where name = 'db_block_checking' and inst_id=1 and (nvl(value,'$$@@$$') != nvl('MEDIUM','$$@@$$') or isdefault != 'FALSE')
-- ----
UNION select inst_id,name,value || case isdefault when 'FALSE' then ' (SPFILE)' else null end,'MEDIUM' from gv$parameter where name = 'db_block_checking' and inst_id=2 and (nvl(value,'$$@@$$') != nvl('MEDIUM','$$@@$$') or isdefault != 'FALSE')
-- ----
UNION select inst_id,name,value || case isdefault when 'FALSE' then ' (SPFILE)' else null end,'MEDIUM' from gv$parameter where name = 'inmemory_automatic_level' and inst_id=1 and (nvl(value,'$$@@$$') != nvl('MEDIUM','$$@@$$') or isdefault != 'FALSE')
-- ----
UNION select inst_id,name,value || case isdefault when 'FALSE' then ' (SPFILE)' else null end,'MEDIUM' from gv$parameter where name = 'inmemory_automatic_level' and inst_id=2 and (nvl(value,'$$@@$$') != nvl('MEDIUM','$$@@$$') or isdefault != 'FALSE')
-- ----
UNION select inst_id,name,value || case isdefault when 'FALSE' then ' (SPFILE)' else null end,'METADATA (Def)' from gv$parameter where name = 'default_sharing' and inst_id=1 and (nvl(value,'$$@@$$') != nvl('METADATA','$$@@$$') or isdefault != 'TRUE')
-- ----
UNION select inst_id,name,value || case isdefault when 'FALSE' then ' (SPFILE)' else null end,'NONE (Def)' from gv$parameter where name = 'db_index_compression_inheritance' and inst_id=1 and (nvl(value,'$$@@$$') != nvl('NONE','$$@@$$') or isdefault != 'TRUE')
-- ----
UNION select inst_id,name,value || case isdefault when 'FALSE' then ' (SPFILE)' else null end,'NONE (Def)' from gv$parameter where name = 'db_index_compression_inheritance' and inst_id=2 and (nvl(value,'$$@@$$') != nvl('NONE','$$@@$$') or isdefault != 'TRUE')
-- ----
UNION select inst_id,name,value || case isdefault when 'FALSE' then ' (SPFILE)' else null end,'NONE (Def)' from gv$parameter where name = 'ldap_directory_access' and inst_id=1 and (nvl(value,'$$@@$$') != nvl('NONE','$$@@$$') or isdefault != 'TRUE')
-- ----
UNION select inst_id,name,value || case isdefault when 'FALSE' then ' (SPFILE)' else null end,'NONE (Def)' from gv$parameter where name = 'ldap_directory_access' and inst_id=2 and (nvl(value,'$$@@$$') != nvl('NONE','$$@@$$') or isdefault != 'TRUE')
-- ----
UNION select inst_id,name,value || case isdefault when 'FALSE' then ' (SPFILE)' else null end,'NONE (Def)' from gv$parameter where name = 'standby_db_preserve_states' and inst_id=1 and (nvl(value,'$$@@$$') != nvl('NONE','$$@@$$') or isdefault != 'TRUE')
-- ----
UNION select inst_id,name,value || case isdefault when 'FALSE' then ' (SPFILE)' else null end,'NONE (Def)' from gv$parameter where name = 'standby_db_preserve_states' and inst_id=2 and (nvl(value,'$$@@$$') != nvl('NONE','$$@@$$') or isdefault != 'TRUE')
-- ----
UNION select inst_id,name,value || case isdefault when 'FALSE' then ' (SPFILE)' else null end,'OFF (Def)' from gv$parameter where name = 'db_ultra_safe' and inst_id=1 and (nvl(value,'$$@@$$') != nvl('OFF','$$@@$$') or isdefault != 'TRUE')
-- ----
UNION select inst_id,name,value || case isdefault when 'FALSE' then ' (SPFILE)' else null end,'OFF (Def)' from gv$parameter where name = 'db_ultra_safe' and inst_id=2 and (nvl(value,'$$@@$$') != nvl('OFF','$$@@$$') or isdefault != 'TRUE')
-- ----
UNION select inst_id,name,value || case isdefault when 'FALSE' then ' (SPFILE)' else null end,'OFF (Def)' from gv$parameter where name = 'heat_map' and inst_id=1 and (nvl(value,'$$@@$$') != nvl('OFF','$$@@$$') or isdefault != 'TRUE')
-- ----
UNION select inst_id,name,value || case isdefault when 'FALSE' then ' (SPFILE)' else null end,'OFF (Def)' from gv$parameter where name = 'heat_map' and inst_id=2 and (nvl(value,'$$@@$$') != nvl('OFF','$$@@$$') or isdefault != 'TRUE')
-- ----
UNION select inst_id,name,value || case isdefault when 'FALSE' then ' (SPFILE)' else null end,'OFF' from gv$parameter where name = 'recyclebin' and inst_id=1 and (nvl(value,'$$@@$$') != nvl('OFF','$$@@$$') or isdefault != 'FALSE')
-- ----
UNION select inst_id,name,value || case isdefault when 'FALSE' then ' (SPFILE)' else null end,'OFF' from gv$parameter where name = 'recyclebin' and inst_id=2 and (nvl(value,'$$@@$$') != nvl('OFF','$$@@$$') or isdefault != 'FALSE')
-- ----
UNION select inst_id,name,value || case isdefault when 'FALSE' then ' (SPFILE)' else null end,'ON (Def)' from gv$parameter where name = 'db_cache_advice' and inst_id=1 and (nvl(value,'$$@@$$') != nvl('ON','$$@@$$') or isdefault != 'TRUE')
-- ----
UNION select inst_id,name,value || case isdefault when 'FALSE' then ' (SPFILE)' else null end,'ON (Def)' from gv$parameter where name = 'db_cache_advice' and inst_id=2 and (nvl(value,'$$@@$$') != nvl('ON','$$@@$$') or isdefault != 'TRUE')
-- ----
UNION select inst_id,name,value || case isdefault when 'FALSE' then ' (SPFILE)' else null end,'ONLY' from gv$parameter where name = 'use_large_pages' and inst_id=1 and (nvl(value,'$$@@$$') != nvl('ONLY','$$@@$$') or isdefault != 'FALSE')
-- ----
UNION select inst_id,name,value || case isdefault when 'FALSE' then ' (SPFILE)' else null end,'ONLY' from gv$parameter where name = 'use_large_pages' and inst_id=2 and (nvl(value,'$$@@$$') != nvl('ONLY','$$@@$$') or isdefault != 'FALSE')
-- ----
UNION select inst_id,name,value || case isdefault when 'FALSE' then ' (SPFILE)' else null end,'ORA$PTT_ (Def)' from gv$parameter where name = 'private_temp_table_prefix' and inst_id=1 and (nvl(value,'$$@@$$') != nvl('ORA$PTT_','$$@@$$') or isdefault != 'TRUE')
-- ----
UNION select inst_id,name,value || case isdefault when 'FALSE' then ' (SPFILE)' else null end,'ORA$PTT_ (Def)' from gv$parameter where name = 'private_temp_table_prefix' and inst_id=2 and (nvl(value,'$$@@$$') != nvl('ORA$PTT_','$$@@$$') or isdefault != 'TRUE')
-- ----
UNION select inst_id,name,value || case isdefault when 'FALSE' then ' (SPFILE)' else null end,'PREFERRED (Def)' from gv$parameter where name = 'db_securefile' and inst_id=1 and (nvl(value,'$$@@$$') != nvl('PREFERRED','$$@@$$') or isdefault != 'TRUE')
-- ----
UNION select inst_id,name,value || case isdefault when 'FALSE' then ' (SPFILE)' else null end,'PREFERRED (Def)' from gv$parameter where name = 'db_securefile' and inst_id=2 and (nvl(value,'$$@@$$') != nvl('PREFERRED','$$@@$$') or isdefault != 'TRUE')
-- ----
UNION select inst_id,name,value || case isdefault when 'FALSE' then ' (SPFILE)' else null end,'RDBMS (Def)' from gv$parameter where name = 'instance_type' and inst_id=1 and (nvl(value,'$$@@$$') != nvl('RDBMS','$$@@$$') or isdefault != 'TRUE')
-- ----
UNION select inst_id,name,value || case isdefault when 'FALSE' then ' (SPFILE)' else null end,'RDBMS (Def)' from gv$parameter where name = 'instance_type' and inst_id=2 and (nvl(value,'$$@@$$') != nvl('RDBMS','$$@@$$') or isdefault != 'TRUE')
-- ----
UNION select inst_id,name,value || case isdefault when 'FALSE' then ' (SPFILE)' else null end,'READ-WRITE (Def)' from gv$parameter where name = 'instance_mode' and inst_id=1 and (nvl(value,'$$@@$$') != nvl('READ-WRITE','$$@@$$') or isdefault != 'TRUE')
-- ----
UNION select inst_id,name,value || case isdefault when 'FALSE' then ' (SPFILE)' else null end,'READ-WRITE (Def)' from gv$parameter where name = 'instance_mode' and inst_id=2 and (nvl(value,'$$@@$$') != nvl('READ-WRITE','$$@@$$') or isdefault != 'TRUE')
-- ----
UNION select inst_id,name,value || case isdefault when 'FALSE' then ' (SPFILE)' else null end,'STANDARD (Def)' from gv$parameter where name = 'max_string_size' and inst_id=1 and (nvl(value,'$$@@$$') != nvl('STANDARD','$$@@$$') or isdefault != 'TRUE')
-- ----
UNION select inst_id,name,value || case isdefault when 'FALSE' then ' (SPFILE)' else null end,'STANDARD (Def)' from gv$parameter where name = 'max_string_size' and inst_id=2 and (nvl(value,'$$@@$$') != nvl('STANDARD','$$@@$$') or isdefault != 'TRUE')
-- ----
UNION select inst_id,name,value || case isdefault when 'FALSE' then ' (SPFILE)' else null end,'TIMESTAMP (Def)' from gv$parameter where name = 'remote_dependencies_mode' and inst_id=1 and (nvl(value,'$$@@$$') != nvl('TIMESTAMP','$$@@$$') or isdefault != 'TRUE')
-- ----
UNION select inst_id,name,value || case isdefault when 'FALSE' then ' (SPFILE)' else null end,'TIMESTAMP (Def)' from gv$parameter where name = 'remote_dependencies_mode' and inst_id=2 and (nvl(value,'$$@@$$') != nvl('TIMESTAMP','$$@@$$') or isdefault != 'TRUE')
-- ----
UNION select inst_id,name,value || case isdefault when 'FALSE' then ' (SPFILE)' else null end,'TRACE (Def)' from gv$parameter where name = 'sec_protocol_error_trace_action' and inst_id=1 and (nvl(value,'$$@@$$') != nvl('TRACE','$$@@$$') or isdefault != 'TRUE')
-- ----
UNION select inst_id,name,value || case isdefault when 'FALSE' then ' (SPFILE)' else null end,'TRACE (Def)' from gv$parameter where name = 'sec_protocol_error_trace_action' and inst_id=2 and (nvl(value,'$$@@$$') != nvl('TRACE','$$@@$$') or isdefault != 'TRUE')
-- ----
UNION select inst_id,name,value || case isdefault when 'FALSE' then ' (SPFILE)' else null end,'TRUE (Def)' from gv$parameter where name = 'cell_offload_decryption' and inst_id=1 and (nvl(value,'$$@@$$') != nvl('TRUE','$$@@$$') or isdefault != 'TRUE')
-- ----
UNION select inst_id,name,value || case isdefault when 'FALSE' then ' (SPFILE)' else null end,'TRUE (Def)' from gv$parameter where name = 'cell_offload_decryption' and inst_id=2 and (nvl(value,'$$@@$$') != nvl('TRUE','$$@@$$') or isdefault != 'TRUE')
-- ----
UNION select inst_id,name,value || case isdefault when 'FALSE' then ' (SPFILE)' else null end,'TRUE (Def)' from gv$parameter where name = 'cell_offload_processing' and inst_id=1 and (nvl(value,'$$@@$$') != nvl('TRUE','$$@@$$') or isdefault != 'TRUE')
-- ----
UNION select inst_id,name,value || case isdefault when 'FALSE' then ' (SPFILE)' else null end,'TRUE (Def)' from gv$parameter where name = 'cell_offload_processing' and inst_id=2 and (nvl(value,'$$@@$$') != nvl('TRUE','$$@@$$') or isdefault != 'TRUE')
-- ----
UNION select inst_id,name,value || case isdefault when 'FALSE' then ' (SPFILE)' else null end,'TRUE (Def)' from gv$parameter where name = 'db_unrecoverable_scn_tracking' and inst_id=1 and (nvl(value,'$$@@$$') != nvl('TRUE','$$@@$$') or isdefault != 'TRUE')
-- ----
UNION select inst_id,name,value || case isdefault when 'FALSE' then ' (SPFILE)' else null end,'TRUE (Def)' from gv$parameter where name = 'db_unrecoverable_scn_tracking' and inst_id=2 and (nvl(value,'$$@@$$') != nvl('TRUE','$$@@$$') or isdefault != 'TRUE')
-- ----
UNION select inst_id,name,value || case isdefault when 'FALSE' then ' (SPFILE)' else null end,'TRUE (Def)' from gv$parameter where name = 'deferred_segment_creation' and inst_id=1 and (nvl(value,'$$@@$$') != nvl('TRUE','$$@@$$') or isdefault != 'TRUE')
-- ----
UNION select inst_id,name,value || case isdefault when 'FALSE' then ' (SPFILE)' else null end,'TRUE (Def)' from gv$parameter where name = 'deferred_segment_creation' and inst_id=2 and (nvl(value,'$$@@$$') != nvl('TRUE','$$@@$$') or isdefault != 'TRUE')
-- ----
UNION select inst_id,name,value || case isdefault when 'FALSE' then ' (SPFILE)' else null end,'TRUE (Def)' from gv$parameter where name = 'disk_asynch_io' and inst_id=1 and (nvl(value,'$$@@$$') != nvl('TRUE','$$@@$$') or isdefault != 'TRUE')
-- ----
UNION select inst_id,name,value || case isdefault when 'FALSE' then ' (SPFILE)' else null end,'TRUE (Def)' from gv$parameter where name = 'disk_asynch_io' and inst_id=2 and (nvl(value,'$$@@$$') != nvl('TRUE','$$@@$$') or isdefault != 'TRUE')
-- ----
UNION select inst_id,name,value || case isdefault when 'FALSE' then ' (SPFILE)' else null end,'TRUE (Def)' from gv$parameter where name = 'dst_upgrade_insert_conv' and inst_id=1 and (nvl(value,'$$@@$$') != nvl('TRUE','$$@@$$') or isdefault != 'TRUE')
-- ----
UNION select inst_id,name,value || case isdefault when 'FALSE' then ' (SPFILE)' else null end,'TRUE (Def)' from gv$parameter where name = 'dst_upgrade_insert_conv' and inst_id=2 and (nvl(value,'$$@@$$') != nvl('TRUE','$$@@$$') or isdefault != 'TRUE')
-- ----
UNION select inst_id,name,value || case isdefault when 'FALSE' then ' (SPFILE)' else null end,'TRUE (Def)' from gv$parameter where name = 'enable_automatic_maintenance_pdb' and inst_id=1 and (nvl(value,'$$@@$$') != nvl('TRUE','$$@@$$') or isdefault != 'TRUE')
-- ----
UNION select inst_id,name,value || case isdefault when 'FALSE' then ' (SPFILE)' else null end,'TRUE (Def)' from gv$parameter where name = 'enable_automatic_maintenance_pdb' and inst_id=2 and (nvl(value,'$$@@$$') != nvl('TRUE','$$@@$$') or isdefault != 'TRUE')
-- ----
UNION select inst_id,name,value || case isdefault when 'FALSE' then ' (SPFILE)' else null end,'TRUE (Def)' from gv$parameter where name = 'hs_autoregister' and inst_id=1 and (nvl(value,'$$@@$$') != nvl('TRUE','$$@@$$') or isdefault != 'TRUE')
-- ----
UNION select inst_id,name,value || case isdefault when 'FALSE' then ' (SPFILE)' else null end,'TRUE (Def)' from gv$parameter where name = 'hs_autoregister' and inst_id=2 and (nvl(value,'$$@@$$') != nvl('TRUE','$$@@$$') or isdefault != 'TRUE')
-- ----
UNION select inst_id,name,value || case isdefault when 'FALSE' then ' (SPFILE)' else null end,'TRUE (Def)' from gv$parameter where name = 'inmemory_adg_enabled' and inst_id=1 and (nvl(value,'$$@@$$') != nvl('TRUE','$$@@$$') or isdefault != 'TRUE')
-- ----
UNION select inst_id,name,value || case isdefault when 'FALSE' then ' (SPFILE)' else null end,'TRUE (Def)' from gv$parameter where name = 'inmemory_adg_enabled' and inst_id=2 and (nvl(value,'$$@@$$') != nvl('TRUE','$$@@$$') or isdefault != 'TRUE')
-- ----
UNION select inst_id,name,value || case isdefault when 'FALSE' then ' (SPFILE)' else null end,'TRUE (Def)' from gv$parameter where name = 'java_jit_enabled' and inst_id=1 and (nvl(value,'$$@@$$') != nvl('TRUE','$$@@$$') or isdefault != 'TRUE')
-- ----
UNION select inst_id,name,value || case isdefault when 'FALSE' then ' (SPFILE)' else null end,'TRUE (Def)' from gv$parameter where name = 'java_jit_enabled' and inst_id=2 and (nvl(value,'$$@@$$') != nvl('TRUE','$$@@$$') or isdefault != 'TRUE')
-- ----
UNION select inst_id,name,value || case isdefault when 'FALSE' then ' (SPFILE)' else null end,'TRUE (Def)' from gv$parameter where name = 'long_module_action' and inst_id=1 and (nvl(value,'$$@@$$') != nvl('TRUE','$$@@$$') or isdefault != 'TRUE')
-- ----
UNION select inst_id,name,value || case isdefault when 'FALSE' then ' (SPFILE)' else null end,'TRUE (Def)' from gv$parameter where name = 'long_module_action' and inst_id=2 and (nvl(value,'$$@@$$') != nvl('TRUE','$$@@$$') or isdefault != 'TRUE')
-- ----
UNION select inst_id,name,value || case isdefault when 'FALSE' then ' (SPFILE)' else null end,'TRUE (Def)' from gv$parameter where name = 'optimizer_adaptive_plans' and inst_id=1 and (nvl(value,'$$@@$$') != nvl('TRUE','$$@@$$') or isdefault != 'TRUE')
-- ----
UNION select inst_id,name,value || case isdefault when 'FALSE' then ' (SPFILE)' else null end,'TRUE (Def)' from gv$parameter where name = 'optimizer_adaptive_plans' and inst_id=2 and (nvl(value,'$$@@$$') != nvl('TRUE','$$@@$$') or isdefault != 'TRUE')
-- ----
UNION select inst_id,name,value || case isdefault when 'FALSE' then ' (SPFILE)' else null end,'TRUE (Def)' from gv$parameter where name = 'optimizer_inmemory_aware' and inst_id=1 and (nvl(value,'$$@@$$') != nvl('TRUE','$$@@$$') or isdefault != 'TRUE')
-- ----
UNION select inst_id,name,value || case isdefault when 'FALSE' then ' (SPFILE)' else null end,'TRUE (Def)' from gv$parameter where name = 'optimizer_inmemory_aware' and inst_id=2 and (nvl(value,'$$@@$$') != nvl('TRUE','$$@@$$') or isdefault != 'TRUE')
-- ----
UNION select inst_id,name,value || case isdefault when 'FALSE' then ' (SPFILE)' else null end,'TRUE (Def)' from gv$parameter where name = 'optimizer_secure_view_merging' and inst_id=1 and (nvl(value,'$$@@$$') != nvl('TRUE','$$@@$$') or isdefault != 'TRUE')
-- ----
UNION select inst_id,name,value || case isdefault when 'FALSE' then ' (SPFILE)' else null end,'TRUE (Def)' from gv$parameter where name = 'optimizer_secure_view_merging' and inst_id=2 and (nvl(value,'$$@@$$') != nvl('TRUE','$$@@$$') or isdefault != 'TRUE')
-- ----
UNION select inst_id,name,value || case isdefault when 'FALSE' then ' (SPFILE)' else null end,'TRUE (Def)' from gv$parameter where name = 'optimizer_use_sql_plan_baselines' and inst_id=1 and (nvl(value,'$$@@$$') != nvl('TRUE','$$@@$$') or isdefault != 'TRUE')
-- ----
UNION select inst_id,name,value || case isdefault when 'FALSE' then ' (SPFILE)' else null end,'TRUE (Def)' from gv$parameter where name = 'optimizer_use_sql_plan_baselines' and inst_id=2 and (nvl(value,'$$@@$$') != nvl('TRUE','$$@@$$') or isdefault != 'TRUE')
-- ----
UNION select inst_id,name,value || case isdefault when 'FALSE' then ' (SPFILE)' else null end,'TRUE (Def)' from gv$parameter where name = 'permit_92_wrap_format' and inst_id=1 and (nvl(value,'$$@@$$') != nvl('TRUE','$$@@$$') or isdefault != 'TRUE')
-- ----
UNION select inst_id,name,value || case isdefault when 'FALSE' then ' (SPFILE)' else null end,'TRUE (Def)' from gv$parameter where name = 'permit_92_wrap_format' and inst_id=2 and (nvl(value,'$$@@$$') != nvl('TRUE','$$@@$$') or isdefault != 'TRUE')
-- ----
UNION select inst_id,name,value || case isdefault when 'FALSE' then ' (SPFILE)' else null end,'TRUE (Def)' from gv$parameter where name = 'query_rewrite_enabled' and inst_id=1 and (nvl(value,'$$@@$$') != nvl('TRUE','$$@@$$') or isdefault != 'TRUE')
-- ----
UNION select inst_id,name,value || case isdefault when 'FALSE' then ' (SPFILE)' else null end,'TRUE (Def)' from gv$parameter where name = 'query_rewrite_enabled' and inst_id=2 and (nvl(value,'$$@@$$') != nvl('TRUE','$$@@$$') or isdefault != 'TRUE')
-- ----
UNION select inst_id,name,value || case isdefault when 'FALSE' then ' (SPFILE)' else null end,'TRUE (Def)' from gv$parameter where name = 'replication_dependency_tracking' and inst_id=1 and (nvl(value,'$$@@$$') != nvl('TRUE','$$@@$$') or isdefault != 'TRUE')
-- ----
UNION select inst_id,name,value || case isdefault when 'FALSE' then ' (SPFILE)' else null end,'TRUE (Def)' from gv$parameter where name = 'replication_dependency_tracking' and inst_id=2 and (nvl(value,'$$@@$$') != nvl('TRUE','$$@@$$') or isdefault != 'TRUE')
-- ----
UNION select inst_id,name,value || case isdefault when 'FALSE' then ' (SPFILE)' else null end,'TRUE (Def)' from gv$parameter where name = 'resource_limit' and inst_id=1 and (nvl(value,'$$@@$$') != nvl('TRUE','$$@@$$') or isdefault != 'TRUE')
-- ----
UNION select inst_id,name,value || case isdefault when 'FALSE' then ' (SPFILE)' else null end,'TRUE (Def)' from gv$parameter where name = 'resource_limit' and inst_id=2 and (nvl(value,'$$@@$$') != nvl('TRUE','$$@@$$') or isdefault != 'TRUE')
-- ----
UNION select inst_id,name,value || case isdefault when 'FALSE' then ' (SPFILE)' else null end,'TRUE (Def)' from gv$parameter where name = 'sec_case_sensitive_logon' and inst_id=1 and (nvl(value,'$$@@$$') != nvl('TRUE','$$@@$$') or isdefault != 'TRUE')
-- ----
UNION select inst_id,name,value || case isdefault when 'FALSE' then ' (SPFILE)' else null end,'TRUE (Def)' from gv$parameter where name = 'sec_case_sensitive_logon' and inst_id=2 and (nvl(value,'$$@@$$') != nvl('TRUE','$$@@$$') or isdefault != 'TRUE')
-- ----
UNION select inst_id,name,value || case isdefault when 'FALSE' then ' (SPFILE)' else null end,'TRUE (Def)' from gv$parameter where name = 'skip_unusable_indexes' and inst_id=1 and (nvl(value,'$$@@$$') != nvl('TRUE','$$@@$$') or isdefault != 'TRUE')
-- ----
UNION select inst_id,name,value || case isdefault when 'FALSE' then ' (SPFILE)' else null end,'TRUE (Def)' from gv$parameter where name = 'skip_unusable_indexes' and inst_id=2 and (nvl(value,'$$@@$$') != nvl('TRUE','$$@@$$') or isdefault != 'TRUE')
-- ----
UNION select inst_id,name,value || case isdefault when 'FALSE' then ' (SPFILE)' else null end,'TRUE (Def)' from gv$parameter where name = 'sql92_security' and inst_id=1 and (nvl(value,'$$@@$$') != nvl('TRUE','$$@@$$') or isdefault != 'TRUE')
-- ----
UNION select inst_id,name,value || case isdefault when 'FALSE' then ' (SPFILE)' else null end,'TRUE (Def)' from gv$parameter where name = 'sql92_security' and inst_id=2 and (nvl(value,'$$@@$$') != nvl('TRUE','$$@@$$') or isdefault != 'TRUE')
-- ----
UNION select inst_id,name,value || case isdefault when 'FALSE' then ' (SPFILE)' else null end,'TRUE (Def)' from gv$parameter where name = 'tape_asynch_io' and inst_id=1 and (nvl(value,'$$@@$$') != nvl('TRUE','$$@@$$') or isdefault != 'TRUE')
-- ----
UNION select inst_id,name,value || case isdefault when 'FALSE' then ' (SPFILE)' else null end,'TRUE (Def)' from gv$parameter where name = 'tape_asynch_io' and inst_id=2 and (nvl(value,'$$@@$$') != nvl('TRUE','$$@@$$') or isdefault != 'TRUE')
-- ----
UNION select inst_id,name,value || case isdefault when 'FALSE' then ' (SPFILE)' else null end,'TRUE (Def)' from gv$parameter where name = 'timed_statistics' and inst_id=1 and (nvl(value,'$$@@$$') != nvl('TRUE','$$@@$$') or isdefault != 'TRUE')
-- ----
UNION select inst_id,name,value || case isdefault when 'FALSE' then ' (SPFILE)' else null end,'TRUE (Def)' from gv$parameter where name = 'timed_statistics' and inst_id=2 and (nvl(value,'$$@@$$') != nvl('TRUE','$$@@$$') or isdefault != 'TRUE')
-- ----
UNION select inst_id,name,value || case isdefault when 'FALSE' then ' (SPFILE)' else null end,'TRUE (Def)' from gv$parameter where name = 'trace_enabled' and inst_id=1 and (nvl(value,'$$@@$$') != nvl('TRUE','$$@@$$') or isdefault != 'TRUE')
-- ----
UNION select inst_id,name,value || case isdefault when 'FALSE' then ' (SPFILE)' else null end,'TRUE (Def)' from gv$parameter where name = 'trace_enabled' and inst_id=2 and (nvl(value,'$$@@$$') != nvl('TRUE','$$@@$$') or isdefault != 'TRUE')
-- ----
UNION select inst_id,name,value || case isdefault when 'FALSE' then ' (SPFILE)' else null end,'TRUE (Def)' from gv$parameter where name = 'uniform_log_timestamp_format' and inst_id=1 and (nvl(value,'$$@@$$') != nvl('TRUE','$$@@$$') or isdefault != 'TRUE')
-- ----
UNION select inst_id,name,value || case isdefault when 'FALSE' then ' (SPFILE)' else null end,'TRUE (Def)' from gv$parameter where name = 'uniform_log_timestamp_format' and inst_id=2 and (nvl(value,'$$@@$$') != nvl('TRUE','$$@@$$') or isdefault != 'TRUE')
-- ----
UNION select inst_id,name,value || case isdefault when 'FALSE' then ' (SPFILE)' else null end,'TRUE' from gv$parameter where name = 'audit_sys_operations' and inst_id=1 and (nvl(value,'$$@@$$') != nvl('TRUE','$$@@$$') or isdefault != 'FALSE')
-- ----
UNION select inst_id,name,value || case isdefault when 'FALSE' then ' (SPFILE)' else null end,'TRUE' from gv$parameter where name = 'audit_sys_operations' and inst_id=2 and (nvl(value,'$$@@$$') != nvl('TRUE','$$@@$$') or isdefault != 'FALSE')
-- ----
UNION select inst_id,name,value || case isdefault when 'FALSE' then ' (SPFILE)' else null end,'TRUE' from gv$parameter where name = 'awr_pdb_autoflush_enabled' and inst_id=1 and (nvl(value,'$$@@$$') != nvl('TRUE','$$@@$$') or isdefault != 'FALSE')
-- ----
UNION select inst_id,name,value || case isdefault when 'FALSE' then ' (SPFILE)' else null end,'TRUE' from gv$parameter where name = 'awr_pdb_autoflush_enabled' and inst_id=2 and (nvl(value,'$$@@$$') != nvl('TRUE','$$@@$$') or isdefault != 'FALSE')
-- ----
UNION select inst_id,name,value || case isdefault when 'FALSE' then ' (SPFILE)' else null end,'TRUE' from gv$parameter where name = 'cluster_database' and inst_id=1 and (nvl(value,'$$@@$$') != nvl('TRUE','$$@@$$') or isdefault != 'FALSE')
-- ----
UNION select inst_id,name,value || case isdefault when 'FALSE' then ' (SPFILE)' else null end,'TRUE' from gv$parameter where name = 'cluster_database' and inst_id=2 and (nvl(value,'$$@@$$') != nvl('TRUE','$$@@$$') or isdefault != 'FALSE')
-- ----
UNION select inst_id,name,value || case isdefault when 'FALSE' then ' (SPFILE)' else null end,'TRUE' from gv$parameter where name = 'dg_broker_start' and inst_id=1 and (nvl(value,'$$@@$$') != nvl('TRUE','$$@@$$') or isdefault != 'FALSE')
-- ----
UNION select inst_id,name,value || case isdefault when 'FALSE' then ' (SPFILE)' else null end,'TRUE' from gv$parameter where name = 'dg_broker_start' and inst_id=2 and (nvl(value,'$$@@$$') != nvl('TRUE','$$@@$$') or isdefault != 'FALSE')
-- ----
UNION select inst_id,name,value || case isdefault when 'FALSE' then ' (SPFILE)' else null end,'TRUE' from gv$parameter where name = 'enable_ddl_logging' and inst_id=1 and (nvl(value,'$$@@$$') != nvl('TRUE','$$@@$$') or isdefault != 'FALSE')
-- ----
UNION select inst_id,name,value || case isdefault when 'FALSE' then ' (SPFILE)' else null end,'TRUE' from gv$parameter where name = 'enable_ddl_logging' and inst_id=2 and (nvl(value,'$$@@$$') != nvl('TRUE','$$@@$$') or isdefault != 'FALSE')
-- ----
UNION select inst_id,name,value || case isdefault when 'FALSE' then ' (SPFILE)' else null end,'TRUE' from gv$parameter where name = 'enable_pluggable_database' and inst_id=1 and (nvl(value,'$$@@$$') != nvl('TRUE','$$@@$$') or isdefault != 'FALSE')
-- ----
UNION select inst_id,name,value || case isdefault when 'FALSE' then ' (SPFILE)' else null end,'TRUE' from gv$parameter where name = 'enable_pluggable_database' and inst_id=2 and (nvl(value,'$$@@$$') != nvl('TRUE','$$@@$$') or isdefault != 'FALSE')
-- ----
UNION select inst_id,name,value || case isdefault when 'FALSE' then ' (SPFILE)' else null end,'TRUE' from gv$parameter where name = 'parallel_force_local' and inst_id=1 and (nvl(value,'$$@@$$') != nvl('TRUE','$$@@$$') or isdefault != 'FALSE')
-- ----
UNION select inst_id,name,value || case isdefault when 'FALSE' then ' (SPFILE)' else null end,'TRUE' from gv$parameter where name = 'parallel_force_local' and inst_id=2 and (nvl(value,'$$@@$$') != nvl('TRUE','$$@@$$') or isdefault != 'FALSE')
-- ----
UNION select inst_id,name,value || case isdefault when 'FALSE' then ' (SPFILE)' else null end,'TYPICAL (Def)' from gv$parameter where name = 'statistics_level' and inst_id=1 and (nvl(value,'$$@@$$') != nvl('TYPICAL','$$@@$$') or isdefault != 'TRUE')
-- ----
UNION select inst_id,name,value || case isdefault when 'FALSE' then ' (SPFILE)' else null end,'TYPICAL (Def)' from gv$parameter where name = 'statistics_level' and inst_id=2 and (nvl(value,'$$@@$$') != nvl('TYPICAL','$$@@$$') or isdefault != 'TRUE')
-- ----
UNION select inst_id,name,value || case isdefault when 'FALSE' then ' (SPFILE)' else null end,'TYPICAL' from gv$parameter where name = 'db_block_checksum' and inst_id=1 and (nvl(value,'$$@@$$') != nvl('TYPICAL','$$@@$$') or isdefault != 'FALSE')
-- ----
UNION select inst_id,name,value || case isdefault when 'FALSE' then ' (SPFILE)' else null end,'TYPICAL' from gv$parameter where name = 'db_block_checksum' and inst_id=2 and (nvl(value,'$$@@$$') != nvl('TYPICAL','$$@@$$') or isdefault != 'FALSE')
-- ----
UNION select inst_id,name,value || case isdefault when 'FALSE' then ' (SPFILE)' else null end,'TYPICAL' from gv$parameter where name = 'db_lost_write_protect' and inst_id=1 and (nvl(value,'$$@@$$') != nvl('TYPICAL','$$@@$$') or isdefault != 'FALSE')
-- ----
UNION select inst_id,name,value || case isdefault when 'FALSE' then ' (SPFILE)' else null end,'TYPICAL' from gv$parameter where name = 'db_lost_write_protect' and inst_id=2 and (nvl(value,'$$@@$$') != nvl('TYPICAL','$$@@$$') or isdefault != 'FALSE')
-- ----
UNION select inst_id,name,value || case isdefault when 'FALSE' then ' (SPFILE)' else null end,'UNDOTBS1' from gv$parameter where name = 'undo_tablespace' and inst_id=1 and (nvl(value,'$$@@$$') != nvl('UNDOTBS1','$$@@$$') or isdefault != 'FALSE')
-- ----
UNION select inst_id,name,value || case isdefault when 'FALSE' then ' (SPFILE)' else null end,'UNDOTBS2' from gv$parameter where name = 'undo_tablespace' and inst_id=2 and (nvl(value,'$$@@$$') != nvl('UNDOTBS2','$$@@$$') or isdefault != 'FALSE')
-- ----
UNION select inst_id,name,value || case isdefault when 'FALSE' then ' (SPFILE)' else null end,'dbarg.prd.oraclevcn.com' from gv$parameter where name = 'db_domain' and inst_id=1 and (nvl(value,'$$@@$$') != nvl('dbarg.prd.oraclevcn.com','$$@@$$') or isdefault != 'FALSE')
-- ----
UNION select inst_id,name,value || case isdefault when 'FALSE' then ' (SPFILE)' else null end,'dbarg.prd.oraclevcn.com' from gv$parameter where name = 'db_domain' and inst_id=2 and (nvl(value,'$$@@$$') != nvl('dbarg.prd.oraclevcn.com','$$@@$$') or isdefault != 'FALSE')
-- ----
UNION select inst_id,name,value || case isdefault when 'FALSE' then ' (SPFILE)' else null end,'disable (Def)' from gv$parameter where name = 'serial_reuse' and inst_id=1 and (nvl(value,'$$@@$$') != nvl('disable','$$@@$$') or isdefault != 'TRUE')
-- ----
UNION select inst_id,name,value || case isdefault when 'FALSE' then ' (SPFILE)' else null end,'disable (Def)' from gv$parameter where name = 'serial_reuse' and inst_id=2 and (nvl(value,'$$@@$$') != nvl('disable','$$@@$$') or isdefault != 'TRUE')
-- ----
UNION select inst_id,name,value || case isdefault when 'FALSE' then ' (SPFILE)' else null end,'enable (Def)' from gv$parameter where name = 'xml_db_events' and inst_id=1 and (nvl(value,'$$@@$$') != nvl('enable','$$@@$$') or isdefault != 'TRUE')
-- ----
UNION select inst_id,name,value || case isdefault when 'FALSE' then ' (SPFILE)' else null end,'enable (Def)' from gv$parameter where name = 'xml_db_events' and inst_id=2 and (nvl(value,'$$@@$$') != nvl('enable','$$@@$$') or isdefault != 'TRUE')
-- ----
UNION select inst_id,name,value || case isdefault when 'FALSE' then ' (SPFILE)' else null end,'enforced (Def)' from gv$parameter where name = 'query_rewrite_integrity' and inst_id=1 and (nvl(value,'$$@@$$') != nvl('enforced','$$@@$$') or isdefault != 'TRUE')
-- ----
UNION select inst_id,name,value || case isdefault when 'FALSE' then ' (SPFILE)' else null end,'enforced (Def)' from gv$parameter where name = 'query_rewrite_integrity' and inst_id=2 and (nvl(value,'$$@@$$') != nvl('enforced','$$@@$$') or isdefault != 'TRUE')
-- ----
UNION select inst_id,name,value || case isdefault when 'FALSE' then ' (SPFILE)' else null end,'memory+disk (Def)' from gv$parameter where name = 'cursor_bind_capture_destination' and inst_id=1 and (nvl(value,'$$@@$$') != nvl('memory+disk','$$@@$$') or isdefault != 'TRUE')
-- ----
UNION select inst_id,name,value || case isdefault when 'FALSE' then ' (SPFILE)' else null end,'memory+disk (Def)' from gv$parameter where name = 'cursor_bind_capture_destination' and inst_id=2 and (nvl(value,'$$@@$$') != nvl('memory+disk','$$@@$$') or isdefault != 'TRUE')
-- ----
UNION select inst_id,name,value || case isdefault when 'FALSE' then ' (SPFILE)' else null end,'metadata (Def)' from gv$parameter where name = 'default_sharing' and inst_id=2 and (nvl(value,'$$@@$$') != nvl('metadata','$$@@$$') or isdefault != 'TRUE')
-- ----
UNION select inst_id,name,value || case isdefault when 'FALSE' then ' (SPFILE)' else null end,'no (Def)' from gv$parameter where name = 'ldap_directory_sysauth' and inst_id=1 and (nvl(value,'$$@@$$') != nvl('no','$$@@$$') or isdefault != 'TRUE')
-- ----
UNION select inst_id,name,value || case isdefault when 'FALSE' then ' (SPFILE)' else null end,'no (Def)' from gv$parameter where name = 'ldap_directory_sysauth' and inst_id=2 and (nvl(value,'$$@@$$') != nvl('no','$$@@$$') or isdefault != 'TRUE')
-- ----
UNION select inst_id,name,value || case isdefault when 'FALSE' then ' (SPFILE)' else null end,'none (Def)' from gv$parameter where name = 'approx_for_percentile' and inst_id=1 and (nvl(value,'$$@@$$') != nvl('none','$$@@$$') or isdefault != 'TRUE')
-- ----
UNION select inst_id,name,value || case isdefault when 'FALSE' then ' (SPFILE)' else null end,'none (Def)' from gv$parameter where name = 'approx_for_percentile' and inst_id=2 and (nvl(value,'$$@@$$') != nvl('none','$$@@$$') or isdefault != 'TRUE')
-- ----
UNION select inst_id,name,value || case isdefault when 'FALSE' then ' (SPFILE)' else null end,'none (Def)' from gv$parameter where name = 'filesystemio_options' and inst_id=1 and (nvl(value,'$$@@$$') != nvl('none','$$@@$$') or isdefault != 'TRUE')
-- ----
UNION select inst_id,name,value || case isdefault when 'FALSE' then ' (SPFILE)' else null end,'none (Def)' from gv$parameter where name = 'filesystemio_options' and inst_id=2 and (nvl(value,'$$@@$$') != nvl('none','$$@@$$') or isdefault != 'TRUE')
-- ----
UNION select inst_id,name,value || case isdefault when 'FALSE' then ' (SPFILE)' else null end,'none (Def)' from gv$parameter where name = 'java_restrict' and inst_id=1 and (nvl(value,'$$@@$$') != nvl('none','$$@@$$') or isdefault != 'TRUE')
-- ----
UNION select inst_id,name,value || case isdefault when 'FALSE' then ' (SPFILE)' else null end,'none (Def)' from gv$parameter where name = 'java_restrict' and inst_id=2 and (nvl(value,'$$@@$$') != nvl('none','$$@@$$') or isdefault != 'TRUE')
-- ----
UNION select inst_id,name,value || case isdefault when 'FALSE' then ' (SPFILE)' else null end,'not allowed (Def)' from gv$parameter where name = 'multishard_query_partial_results' and inst_id=1 and (nvl(value,'$$@@$$') != nvl('not allowed','$$@@$$') or isdefault != 'TRUE')
-- ----
UNION select inst_id,name,value || case isdefault when 'FALSE' then ' (SPFILE)' else null end,'not allowed (Def)' from gv$parameter where name = 'multishard_query_partial_results' and inst_id=2 and (nvl(value,'$$@@$$') != nvl('not allowed','$$@@$$') or isdefault != 'TRUE')
-- ----
UNION select inst_id,name,value || case isdefault when 'FALSE' then ' (SPFILE)' else null end,'ops$ (Def)' from gv$parameter where name = 'os_authent_prefix' and inst_id=1 and (nvl(value,'$$@@$$') != nvl('ops$','$$@@$$') or isdefault != 'TRUE')
-- ----
UNION select inst_id,name,value || case isdefault when 'FALSE' then ' (SPFILE)' else null end,'ops$ (Def)' from gv$parameter where name = 'os_authent_prefix' and inst_id=2 and (nvl(value,'$$@@$$') != nvl('ops$','$$@@$$') or isdefault != 'TRUE')
-- ----
UNION select inst_id,name,value || case isdefault when 'FALSE' then ' (SPFILE)' else null end,'partial (Def)' from gv$parameter where name = 'background_core_dump' and inst_id=1 and (nvl(value,'$$@@$$') != nvl('partial','$$@@$$') or isdefault != 'TRUE')
-- ----
UNION select inst_id,name,value || case isdefault when 'FALSE' then ' (SPFILE)' else null end,'partial (Def)' from gv$parameter where name = 'background_core_dump' and inst_id=2 and (nvl(value,'$$@@$$') != nvl('partial','$$@@$$') or isdefault != 'TRUE')
-- ----
UNION select inst_id,name,value || case isdefault when 'FALSE' then ' (SPFILE)' else null end,'partial (Def)' from gv$parameter where name = 'shadow_core_dump' and inst_id=1 and (nvl(value,'$$@@$$') != nvl('partial','$$@@$$') or isdefault != 'TRUE')
-- ----
UNION select inst_id,name,value || case isdefault when 'FALSE' then ' (SPFILE)' else null end,'partial (Def)' from gv$parameter where name = 'shadow_core_dump' and inst_id=2 and (nvl(value,'$$@@$$') != nvl('partial','$$@@$$') or isdefault != 'TRUE')
-- ----
UNION select inst_id,name,value || case isdefault when 'FALSE' then ' (SPFILE)' else null end,'strong (Def)' from gv$parameter where name = 'multishard_query_data_consistency' and inst_id=1 and (nvl(value,'$$@@$$') != nvl('strong','$$@@$$') or isdefault != 'TRUE')
-- ----
UNION select inst_id,name,value || case isdefault when 'FALSE' then ' (SPFILE)' else null end,'strong (Def)' from gv$parameter where name = 'multishard_query_data_consistency' and inst_id=2 and (nvl(value,'$$@@$$') != nvl('strong','$$@@$$') or isdefault != 'TRUE')
-- ----
UNION select inst_id,name,value || case isdefault when 'FALSE' then ' (SPFILE)' else null end,'unlimited (Def)' from gv$parameter where name = 'max_dump_file_size' and inst_id=1 and (nvl(value,'$$@@$$') != nvl('unlimited','$$@@$$') or isdefault != 'TRUE')
-- ----
UNION select inst_id,name,value || case isdefault when 'FALSE' then ' (SPFILE)' else null end,'unlimited (Def)' from gv$parameter where name = 'max_dump_file_size' and inst_id=2 and (nvl(value,'$$@@$$') != nvl('unlimited','$$@@$$') or isdefault != 'TRUE')
-- ----
UNION select inst_id,name,value || case isdefault when 'FALSE' then ' (SPFILE)' else null end,'0' from gv$parameter where name = '_gc_policy_time' and inst_id=1 and nvl(value,'$$@@$$') != nvl('0','$$@@$$')
UNION select 1,'_gc_policy_time','  *** Not Set ***','0' from dual where not exists (select 1 from gv$parameter  where name = '_gc_policy_time' and inst_id=1)
UNION select inst_id,name,value || case isdefault when 'FALSE' then ' (SPFILE)' else null end,'0' from gv$parameter where name = '_gc_policy_time' and inst_id=2 and nvl(value,'$$@@$$') != nvl('0','$$@@$$')
UNION select 2,'_gc_policy_time','  *** Not Set ***','0' from dual where not exists (select 1 from gv$parameter  where name = '_gc_policy_time' and inst_id=2)
UNION select inst_id,name,value || case isdefault when 'FALSE' then ' (SPFILE)' else null end,'100' from gv$parameter where name = '_redo_transport_min_kbytes_sec' and inst_id=1 and nvl(value,'$$@@$$') != nvl('100','$$@@$$')
UNION select 1,'_redo_transport_min_kbytes_sec','  *** Not Set ***','100' from dual where not exists (select 1 from gv$parameter  where name = '_redo_transport_min_kbytes_sec' and inst_id=1)
UNION select inst_id,name,value || case isdefault when 'FALSE' then ' (SPFILE)' else null end,'100' from gv$parameter where name = '_redo_transport_min_kbytes_sec' and inst_id=2 and nvl(value,'$$@@$$') != nvl('100','$$@@$$')
UNION select 2,'_redo_transport_min_kbytes_sec','  *** Not Set ***','100' from dual where not exists (select 1 from gv$parameter  where name = '_redo_transport_min_kbytes_sec' and inst_id=2)
UNION select inst_id,name,value || case isdefault when 'FALSE' then ' (SPFILE)' else null end,'2' from gv$parameter where name = '_parallel_adaptive_max_users' and inst_id=1 and nvl(value,'$$@@$$') != nvl('2','$$@@$$')
UNION select 1,'_parallel_adaptive_max_users','  *** Not Set ***','2' from dual where not exists (select 1 from gv$parameter  where name = '_parallel_adaptive_max_users' and inst_id=1)
UNION select inst_id,name,value || case isdefault when 'FALSE' then ' (SPFILE)' else null end,'2' from gv$parameter where name = '_parallel_adaptive_max_users' and inst_id=2 and nvl(value,'$$@@$$') != nvl('2','$$@@$$')
UNION select 2,'_parallel_adaptive_max_users','  *** Not Set ***','2' from dual where not exists (select 1 from gv$parameter  where name = '_parallel_adaptive_max_users' and inst_id=2)
UNION select inst_id,name,value || case isdefault when 'FALSE' then ' (SPFILE)' else null end,'268430592' from gv$parameter where name = '_bct_public_dba_buffer_size' and inst_id=2 and nvl(value,'$$@@$$') != nvl('268430592','$$@@$$')
UNION select 2,'_bct_public_dba_buffer_size','  *** Not Set ***','268430592' from dual where not exists (select 1 from gv$parameter  where name = '_bct_public_dba_buffer_size' and inst_id=2)
UNION select inst_id,name,value || case isdefault when 'FALSE' then ' (SPFILE)' else null end,'268434432' from gv$parameter where name = '_bct_public_dba_buffer_size' and inst_id=1 and nvl(value,'$$@@$$') != nvl('268434432','$$@@$$')
UNION select 1,'_bct_public_dba_buffer_size','  *** Not Set ***','268434432' from dual where not exists (select 1 from gv$parameter  where name = '_bct_public_dba_buffer_size' and inst_id=1)
UNION select inst_id,name,value || case isdefault when 'FALSE' then ' (SPFILE)' else null end,'32768' from gv$parameter where name = '_lm_res_hash_bucket' and inst_id=1 and nvl(value,'$$@@$$') != nvl('32768','$$@@$$')
UNION select 1,'_lm_res_hash_bucket','  *** Not Set ***','32768' from dual where not exists (select 1 from gv$parameter  where name = '_lm_res_hash_bucket' and inst_id=1)
UNION select inst_id,name,value || case isdefault when 'FALSE' then ' (SPFILE)' else null end,'32768' from gv$parameter where name = '_lm_res_hash_bucket' and inst_id=2 and nvl(value,'$$@@$$') != nvl('32768','$$@@$$')
UNION select 2,'_lm_res_hash_bucket','  *** Not Set ***','32768' from dual where not exists (select 1 from gv$parameter  where name = '_lm_res_hash_bucket' and inst_id=2)
UNION select inst_id,name,value || case isdefault when 'FALSE' then ' (SPFILE)' else null end,'5909305:OFF' from gv$parameter where name = '_fix_control' and inst_id=1 and nvl(value,'$$@@$$') != nvl('5909305:OFF','$$@@$$')
UNION select 1,'_fix_control','  *** Not Set ***','5909305:OFF' from dual where not exists (select 1 from gv$parameter  where name = '_fix_control' and inst_id=1)
UNION select inst_id,name,value || case isdefault when 'FALSE' then ' (SPFILE)' else null end,'5909305:OFF' from gv$parameter where name = '_fix_control' and inst_id=2 and nvl(value,'$$@@$$') != nvl('5909305:OFF','$$@@$$')
UNION select 2,'_fix_control','  *** Not Set ***','5909305:OFF' from dual where not exists (select 1 from gv$parameter  where name = '_fix_control' and inst_id=2)
UNION select inst_id,name,value || case isdefault when 'FALSE' then ' (SPFILE)' else null end,'7' from gv$parameter where name = '_lm_drm_disable' and inst_id=1 and nvl(value,'$$@@$$') != nvl('7','$$@@$$')
UNION select 1,'_lm_drm_disable','  *** Not Set ***','7' from dual where not exists (select 1 from gv$parameter  where name = '_lm_drm_disable' and inst_id=1)
UNION select inst_id,name,value || case isdefault when 'FALSE' then ' (SPFILE)' else null end,'7' from gv$parameter where name = '_lm_drm_disable' and inst_id=2 and nvl(value,'$$@@$$') != nvl('7','$$@@$$')
UNION select 2,'_lm_drm_disable','  *** Not Set ***','7' from dual where not exists (select 1 from gv$parameter  where name = '_lm_drm_disable' and inst_id=2)
UNION select inst_id,name,value || case isdefault when 'FALSE' then ' (SPFILE)' else null end,'FALSE (Def)' from gv$parameter where name = '_rac_dbtype_reset' and inst_id=1 and nvl(value,'$$@@$$') != nvl('FALSE','$$@@$$')
UNION select 1,'_rac_dbtype_reset','  *** Not Set ***','FALSE' from dual where not exists (select 1 from gv$parameter  where name = '_rac_dbtype_reset' and inst_id=1)
UNION select inst_id,name,value || case isdefault when 'FALSE' then ' (SPFILE)' else null end,'FALSE (Def)' from gv$parameter where name = '_rac_dbtype_reset' and inst_id=2 and nvl(value,'$$@@$$') != nvl('FALSE','$$@@$$')
UNION select 2,'_rac_dbtype_reset','  *** Not Set ***','FALSE' from dual where not exists (select 1 from gv$parameter  where name = '_rac_dbtype_reset' and inst_id=2)
UNION select inst_id,name,value || case isdefault when 'FALSE' then ' (SPFILE)' else null end,'FALSE' from gv$parameter where name = '_adaptive_window_consolidator_enabled' and inst_id=1 and nvl(value,'$$@@$$') != nvl('FALSE','$$@@$$')
UNION select 1,'_adaptive_window_consolidator_enabled','  *** Not Set ***','FALSE' from dual where not exists (select 1 from gv$parameter  where name = '_adaptive_window_consolidator_enabled' and inst_id=1)
UNION select inst_id,name,value || case isdefault when 'FALSE' then ' (SPFILE)' else null end,'FALSE' from gv$parameter where name = '_adaptive_window_consolidator_enabled' and inst_id=2 and nvl(value,'$$@@$$') != nvl('FALSE','$$@@$$')
UNION select 2,'_adaptive_window_consolidator_enabled','  *** Not Set ***','FALSE' from dual where not exists (select 1 from gv$parameter  where name = '_adaptive_window_consolidator_enabled' and inst_id=2)
UNION select inst_id,name,value || case isdefault when 'FALSE' then ' (SPFILE)' else null end,'FALSE' from gv$parameter where name = '_assm_segment_repair_bg' and inst_id=1 and nvl(value,'$$@@$$') != nvl('FALSE','$$@@$$')
UNION select 1,'_assm_segment_repair_bg','  *** Not Set ***','FALSE' from dual where not exists (select 1 from gv$parameter  where name = '_assm_segment_repair_bg' and inst_id=1)
UNION select inst_id,name,value || case isdefault when 'FALSE' then ' (SPFILE)' else null end,'FALSE' from gv$parameter where name = '_assm_segment_repair_bg' and inst_id=2 and nvl(value,'$$@@$$') != nvl('FALSE','$$@@$$')
UNION select 2,'_assm_segment_repair_bg','  *** Not Set ***','FALSE' from dual where not exists (select 1 from gv$parameter  where name = '_assm_segment_repair_bg' and inst_id=2)
UNION select inst_id,name,value || case isdefault when 'FALSE' then ' (SPFILE)' else null end,'FALSE' from gv$parameter where name = '_unused_block_compression' and inst_id=1 and nvl(value,'$$@@$$') != nvl('FALSE','$$@@$$')
UNION select 1,'_unused_block_compression','  *** Not Set ***','FALSE' from dual where not exists (select 1 from gv$parameter  where name = '_unused_block_compression' and inst_id=1)
UNION select inst_id,name,value || case isdefault when 'FALSE' then ' (SPFILE)' else null end,'FALSE' from gv$parameter where name = '_unused_block_compression' and inst_id=2 and nvl(value,'$$@@$$') != nvl('FALSE','$$@@$$')
UNION select 2,'_unused_block_compression','  *** Not Set ***','FALSE' from dual where not exists (select 1 from gv$parameter  where name = '_unused_block_compression' and inst_id=2)
order by 2,1;


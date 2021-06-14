set pages 2000
set lines 4000
column machine           format a40
column inst_id           format 99
column username          format a10
column num_sess          format a10
column logon_time        format a20
column prev_exec_time    format a20
column seconds_in_wait   format 999G999G999
column since_logon       format 999G999G999
column used              format 999G999G999
column prev_sql_id       format a15
column sql_id            format a15
column sql_text          format a400
select
   se.machine
  ,se.inst_id
  ,se.username
  ,row_number() over (partition by se.machine, se.inst_id, se.username order by se.logon_time) ||
     '/'|| count (*) over (partition by se.machine, se.inst_id, se.username)                       num_sess
  ,to_char(se.logon_time,'dd/mm/yyyy hh24:mi:ss')                                                  logon_time
  ,se.seconds_in_wait   
  ,round((sysdate-se.logon_time)*24*3600)                                                          since_logon
  ,round(((sysdate-se.logon_time)*24*3600)) - se.seconds_in_wait                                   used
  ,to_char(se.prev_exec_start,'dd/mm/yyyy hh24:mi:ss')                                             prev_exec_time
  ,se.prev_sql_id
  ,sq.sql_text
  ,se.sql_id
--  ,se.*
from 
  gv$session se
join gv$sqlarea sq on (se.inst_id=sq.inst_id and se.prev_sql_id = sq.sql_id)
where
      se.type='USER' 
  and se.machine like '%jms%'
/



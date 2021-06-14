column machine format a40
column inst_id format 99
column username format a10
column num_sess format a10
column logon_time format a20
column seconds_in_wait format 999G999G999
column since_logon format 999G999G999
column used        format 999G999G999
select
   machine
  ,inst_id
  ,username
  ,row_number() over (partition by machine, inst_id, username order by logon_time) || '/'|| count (*) over (partition by machine, inst_id, username) num_sess
  ,to_char(logon_time,'dd/mm/yyyy hh24:mi:ss')
  ,seconds_in_wait
  ,round((sysdate-logon_time)*24*3600) since_logon
  ,round(((sysdate-logon_time)*24*3600)) - seconds_in_wait used
from 
  gv$session se
where
      type='USER' 
  and machine like '%jms%'
/

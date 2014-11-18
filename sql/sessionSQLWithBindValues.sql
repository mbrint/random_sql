select sesion.sid,
       sesion.username,
       sqlarea.optimizer_mode,
       sqlarea.hash_value,
       sqlarea.address,
       sqlarea.cpu_time,
       sqlarea.elapsed_time,
       sqlarea.sql_text,
       sqlarea.sql_fulltext,
       bind.name,
       bind.value_string
  from v$sqlarea sqlarea, v$session sesion, v$sql_bind_capture bind
 where sesion.sql_hash_value = sqlarea.hash_value
   and bind.hash_value = sqlarea.hash_value
   AND SESION.SQL_ADDRESS    = SQLAREA.ADDRESS
   and sesion.username is not null;
   
   select * from v$sql_bind_capture;
   select * from v$sqlarea;

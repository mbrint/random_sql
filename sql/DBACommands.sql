alter user KCSB30 identified by odb80kcsb30 account unlock; 

select s1.username || '@' || s1.machine
  || ' ( SID=' || s1.sid || ' )  is blocking '
  || s2.username || '@' || s2.machine || ' ( SID=' || s2.sid || ' ) ' AS blocking_status
from v$lock l1, v$session s1, v$lock l2, v$session s2
where s1.sid=l1.sid and s2.sid=l2.sid
and l1.BLOCK=1 and l2.request > 0
and l1.id1 = l2.id1
and l2.id2 = l2.id2 ;

select * from v$lock where block=1 ;

select row_wait_obj#, row_wait_file#, row_wait_block#, row_wait_row# from v$session where sid=18 ;

select do.object_name,
 row_wait_obj#, row_wait_file#, row_wait_block#, row_wait_row#,
 dbms_rowid.rowid_create ( 1, ROW_WAIT_OBJ#, ROW_WAIT_FILE#, ROW_WAIT_BLOCK#, ROW_WAIT_ROW# )
from v$session s, dba_objects do
where sid=18
and s.ROW_WAIT_OBJ# = do.OBJECT_ID ;



select object_name from dba_objects where object_id=25718;



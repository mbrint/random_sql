-- open cursors by userid
select user_name, status, osuser, machine, a.sql_text
from v$session b,
v$open_cursor a
where a.sid = b.sid
order by status,user_name;

-- Current open cursor's by Session ID
select sid, value 
from v$sesstat sest
where statistic# = 4
order by value desc;

--select statistic names by value (these chage based on release.  4 used above is "open cursors"
select * from V$STATNAME; 




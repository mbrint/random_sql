select unique table_name,column_name from dba_tab_columns where column_name like '%TRANS%TYPE%' and owner = 'MGPROD';

select unique table_name from dba_tab_columns where table_name like '%DL%' and owner = 'MGPROD';


select * from dba_tab_columns where owner = 'MGPROD';

select unique dba_tables.table_name 
from dba_tab_columns,
     dba_tables
where dba_tab_columns.table_name = dba_tables.table_name
and Data_type like ('%LOB')  and dba_tables.owner = 'MGPROD'
order by dba_tables.table_name;


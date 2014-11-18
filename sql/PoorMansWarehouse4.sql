-- Poor Mans Warehouse idea

-- Create Link to infored database
-- run as mgprod on odb60
create database link infdevlnk connect to dm_infoed_administrator
identified by "97ANSwk" using '(DESCRIPTION =
        (ADDRESS_LIST =
                (ADDRESS = (PROTOCOL = TCP)(HOST = odb24.pvt.hawaii.edu)(PORT = 1521))
        )
        (CONNECT_DATA =
                (SID = infdev)
                (SERVER = DEDICATED)
        ))'
;

/*
select * from all_views 
where owner = 'MGPROD'
and VIEW_NAME like 'DW_%'
order by 1;

select * from all_views@infdevlnk
where owner = 'DM_INFOED_ADMINISTRATOR'
and view_name like 'DW_%_V'
order by 1;

select * from all_views@infdevlnk
where owner = 'DM_INFOED_ADMINISTRATOR'
and view_name like 'DW_%'
and view_name not like 'DW_%_V';
*/

SELECT 'create table mg_dwh.RPT_' || replace(replace(view_name,'DW_'),'_V') || ' as ( select ''mygrant'' as source, ' || cols.cols || ' from mgprod.' || view_name || ');' cmd
from all_views,
(SELECT table_name,
       LTRIM(MAX(SYS_CONNECT_BY_PATH(column_name,','))
       KEEP (DENSE_RANK LAST ORDER BY curr),',') AS cols
FROM   (SELECT table_name,
               column_name,
               ROW_NUMBER() OVER (PARTITION BY table_name ORDER BY column_name) AS curr,
               ROW_NUMBER() OVER (PARTITION BY table_name ORDER BY column_name) -1 AS prev
        FROM   all_tab_columns
        where table_name like 'DW_%_V')
GROUP BY table_name
CONNECT BY prev = PRIOR curr AND table_name = PRIOR table_name
START WITH curr = 1) cols
where view_name like 'DW_%_V'
  and view_name = cols.table_name
order by 1;

-- Create tables from infoed views which have no myGRANT view
SELECT 'create table mg_dwh.RPT_' || replace(replace(view_name,'DW_'),'_V') || '  as ( select cast(''infoed'' as varchar2(7)) as source,' || cols.cols || ' from ' || view_name || '@infdevlnk);' cmd
from all_views@infdevlnk,
(SELECT table_name,
       LTRIM(MAX(SYS_CONNECT_BY_PATH(column_name,','))
       KEEP (DENSE_RANK LAST ORDER BY curr),',') AS cols
FROM   (SELECT table_name,
               column_name,
               ROW_NUMBER() OVER (PARTITION BY table_name ORDER BY column_name) AS curr,
               ROW_NUMBER() OVER (PARTITION BY table_name ORDER BY column_name) -1 AS prev
        FROM   all_tab_columns@infdevlnk
        where table_name like 'DW_%'
          and table_name not like 'DW_%_V')
GROUP BY table_name
CONNECT BY prev = PRIOR curr AND table_name = PRIOR table_name
START WITH curr = 1) cols
where view_name like 'DW_%'
and view_name not like 'DW_%_V'
and view_name = table_name;

-- create insert from infoed side for view which have a mygrant equiv
select 'insert into mg_dwh.RPT_' || replace(replace(view_name,'DW_'),'_V') || ' (source,' || cols.cols || ') select ''infoed'' as source, ' || cols.cols || ' from ' || view_name || '@infdevlnk;' cmd
from all_views@infdevlnk,
(SELECT table_name,
       LTRIM(MAX(SYS_CONNECT_BY_PATH(column_name,','))
       KEEP (DENSE_RANK LAST ORDER BY curr),',') AS cols
FROM   (SELECT table_name,
               column_name,
               ROW_NUMBER() OVER (PARTITION BY table_name ORDER BY column_name) AS curr,
               ROW_NUMBER() OVER (PARTITION BY table_name ORDER BY column_name) -1 AS prev
        FROM   all_tab_columns@infdevlnk
        where owner = 'DM_INFOED_ADMINISTRATOR'
          and TABLE_NAME like 'DW_%_V')
GROUP BY table_name
CONNECT BY prev = PRIOR curr AND table_name = PRIOR table_name
START WITH curr = 1) cols
where owner = 'DM_INFOED_ADMINISTRATOR'
and view_name = table_name
and view_name like 'DW_%_V';

-- create insert from mygrant side for tables with infoed equiv views.
-- Create insert into RPT tables from inf side for views which mirror KC tables
-- CREATE TABLES from INF views which mirror KC tables
-- NOTE: inner select taken from http://stackoverflow.com/questions/11631796/insert-result-of-select-statement-to-another-table-in-oracle-stored-procedure
-- Create insert into RPT tables from inf side for views which mirror KC tables
-- CREATE TABLES from INF views which mirror KC tables
-- NOTE: inner select taken from http://stackoverflow.com/questions/11631796/insert-result-of-select-statement-to-another-table-in-oracle-stored-procedure
select 'insert into mg_dwh.RPT_' || replace(replace(view_name,'DW_'),'_V') || '(source,' || cols.cols || ')  select ''mygrant'' as source,' || cols.cols || ' from  mgprod.' || replace(view_name,'KC_') || ';'  cmd
from all_views@infdevlnk views,
(SELECT table_name,
       LTRIM(MAX(SYS_CONNECT_BY_PATH(column_name,','))
       KEEP (DENSE_RANK LAST ORDER BY curr),',') AS cols
FROM   (SELECT table_name,
               column_name,
               ROW_NUMBER() OVER (PARTITION BY table_name ORDER BY column_name) AS curr,
               ROW_NUMBER() OVER (PARTITION BY table_name ORDER BY column_name) -1 AS prev
        FROM   all_tab_columns@infdevlnk
        where table_name like 'DW_%'
          and table_name not like 'DW_%_V')
GROUP BY table_name
CONNECT BY prev = PRIOR curr AND table_name = PRIOR table_name
START WITH curr = 1) cols
where view_name like 'DW_%'
and view_name not like 'DW_%_V'
and view_name = cols.table_name;
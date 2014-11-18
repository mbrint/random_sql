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

-- create commands which will CREATE rpt TABLES from MG views 
SELECT 'create table mg_dwh.RPT_' || replace(view_name,'_VIEW') || ' as ( select ''mygrant'' as source, ' || cols.cols || ' from mgprod.' || view_name || ');' cmd
from all_views,
(SELECT table_name,
       LTRIM(MAX(SYS_CONNECT_BY_PATH(column_name,','))
       KEEP (DENSE_RANK LAST ORDER BY curr),',') AS cols
FROM   (SELECT table_name,
               column_name,
               ROW_NUMBER() OVER (PARTITION BY table_name ORDER BY column_name) AS curr,
               ROW_NUMBER() OVER (PARTITION BY table_name ORDER BY column_name) -1 AS prev
        FROM   all_tab_columns
        where owner = 'MGPROD'
          and TABLE_NAME not like 'KR%'
          and TABLE_NAME not like 'OSP%')
GROUP BY table_name
CONNECT BY prev = PRIOR curr AND table_name = PRIOR table_name
START WITH curr = 1) cols
where owner = 'MGPROD'
and VIEW_NAME not like 'KR%'
and VIEW_NAME not like 'OSP%'
and view_name = table_name
order by 1;

-- create commands which will INSERT data into CREATED RPT warehouse tables
select 'insert into mg_dwh.RPT_' || replace(replace(view_name,'KC_'),'_VIEW') || ' (source,' || cols.cols || ') select ''infoed'' as source, ' || cols.cols || ' from ' || view_name || '@infdevlnk;'  
from all_views@infdevlnk,
(SELECT table_name,
       LTRIM(MAX(SYS_CONNECT_BY_PATH(column_name,','))
       KEEP (DENSE_RANK LAST ORDER BY curr),',') AS cols
FROM   (SELECT table_name,
               column_name,
               ROW_NUMBER() OVER (PARTITION BY table_name ORDER BY column_name) AS curr,
               ROW_NUMBER() OVER (PARTITION BY table_name ORDER BY column_name) -1 AS prev
        FROM   all_tab_columns@infdevlnk
        where table_name like 'KC_%_VIEW')
GROUP BY table_name
CONNECT BY prev = PRIOR curr AND table_name = PRIOR table_name
START WITH curr = 1) cols
where view_name like 'KC_%_VIEW'
  and view_name = cols.table_name
  and view_name != 'KC_AWARD_CONTACT_STATUS_VIEW' -- view named incorrectly and not used in model anyway, also has clob so will not allow select via link
order by 1;

-- CREATE TABLES from INF views which mirror KC tables
SELECT 'create table mg_dwh.RPT_' || replace(replace(view_name,'KC_'),'_VIEW') || '  as ( select ''infoed'' as source,' || cols.cols || ' from ' || view_name || '@infdevlnk);' cmd
from all_views@infdevlnk,
(SELECT table_name,
       LTRIM(MAX(SYS_CONNECT_BY_PATH(column_name,','))
       KEEP (DENSE_RANK LAST ORDER BY curr),',') AS cols
FROM   (SELECT table_name,
               column_name,
               ROW_NUMBER() OVER (PARTITION BY table_name ORDER BY column_name) AS curr,
               ROW_NUMBER() OVER (PARTITION BY table_name ORDER BY column_name) -1 AS prev
        FROM   all_tab_columns@infdevlnk
        where table_name like 'KC_%'
          and table_name not like 'KC_%_VIEW')
GROUP BY table_name
CONNECT BY prev = PRIOR curr AND table_name = PRIOR table_name
START WITH curr = 1) cols
where view_name like 'KC_%'
and view_name not like 'KC_%_VIEW'
and view_name = table_name;

-- Create insert into RPT tables from inf side for views which mirror KC tables
-- CREATE TABLES from INF views which mirror KC tables
-- NOTE: inner select taken from http://stackoverflow.com/questions/11631796/insert-result-of-select-statement-to-another-table-in-oracle-stored-procedure
select 'insert into mg_dwh.RPT_' || replace(replace(view_name,'KC_'),'_VIEW') || '(source,' || cols.cols || ')  select ''mygrant'' as source,' || cols.cols || ' from  mgprod.' || replace(view_name,'KC_') || ';' 
from all_views@infdevlnk views,
(SELECT table_name,
       LTRIM(MAX(SYS_CONNECT_BY_PATH(column_name,','))
       KEEP (DENSE_RANK LAST ORDER BY curr),',') AS cols
FROM   (SELECT table_name,
               column_name,
               ROW_NUMBER() OVER (PARTITION BY table_name ORDER BY column_name) AS curr,
               ROW_NUMBER() OVER (PARTITION BY table_name ORDER BY column_name) -1 AS prev
        FROM   all_tab_columns@infdevlnk
        where table_name like 'KC_%'
          and table_name not like 'KC_%_VIEW'
          and table_name not like 'KC_PROPOSAL_TOTAL')
GROUP BY table_name
CONNECT BY prev = PRIOR curr AND table_name = PRIOR table_name
START WITH curr = 1) cols
where view_name like 'KC_%'
and view_name not like 'KC_%_VIEW'
and view_name != 'KC_PROPOSAL_TOTAL'
and view_name = cols.table_name;

-- One special case because proposal in in model on one side and KC_PROPOSAL_TOTAL on the other
select 'insert into mg_dwh.RPT_' || replace(replace(view_name,'KC_'),'_VIEW') || '(source,' || cols.cols || ')  select ''mygrant'' as source,' || cols.cols || ' from  mgprod.proposal;' 
from all_views@infdevlnk views,
(SELECT table_name,
       LTRIM(MAX(SYS_CONNECT_BY_PATH(column_name,','))
       KEEP (DENSE_RANK LAST ORDER BY curr),',') AS cols
FROM   (SELECT table_name,
               column_name,
               ROW_NUMBER() OVER (PARTITION BY table_name ORDER BY column_name) AS curr,
               ROW_NUMBER() OVER (PARTITION BY table_name ORDER BY column_name) -1 AS prev
        FROM   all_tab_columns@infdevlnk
        where table_name = 'KC_PROPOSAL_TOTAL')
GROUP BY table_name
CONNECT BY prev = PRIOR curr AND table_name = PRIOR table_name
START WITH curr = 1) cols
where view_name = 'KC_PROPOSAL_TOTAL';

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

select * from all_views 
where owner = 'MGPROD'
and VIEW_NAME not like 'KR%'
and VIEW_NAME not like 'OSP%';

select length('RPT_' || replace(view_name,'_VIEW')), 'RPT_' || replace(view_name,'_VIEW')
from all_views 
where owner = 'MGPROD'
and VIEW_NAME not like 'KR%'
and VIEW_NAME not like 'OSP%'
order by 2 ;

-- create commands which will CREATE rpt TABLES from MG views 
SELECT 'create table RPT_' || replace(view_name,'_VIEW') || ' from select * from mgprod.' || view_name || ';' cmd
from all_views 
where owner = 'MGPROD'
and VIEW_NAME not like 'KR%'
and VIEW_NAME not like 'OSP%'
order by 1;

select view_name from all_views@infdevlnk
where view_name like 'KC_%'
order by 1; 

select length('RPT_' || replace(replace(view_name,'KC_'),'_VIEW')), 'RPT_' || replace(replace(view_name,'KC_'),'_VIEW')
from all_views@infdevlnk
where view_name like 'KC_%_VIEW'
order by 1 desc;

-- create commands which will INSERT data into CREATED RPT warehouse tables
select 'insert into table RPT_' || replace(replace(view_name,'KC_'),'_VIEW') || ' from select * from ' || view_name || '@infdevlnk;'  
--select 'select * from ' || view_name || '@infdevlnk;'  
from all_views@infdevlnk
where view_name like 'KC_%_VIEW'
order by 1;

-- Test select work
-- create commands which will INSERT data into CREATED RPT warehouse tables
select 'select * from ' || view_name || '@infdevlnk;'  
--select 'select * from ' || view_name || '@infdevlnk;'  
from all_views@infdevlnk
where view_name like 'KC_%_VIEW'
order by 1;

select * from KC_AWARD_CONTACT_STATUS_VIEW@infdevlnk;

select * from all_views@infdevlnk
where view_name like 'KC_%'
and view_name not like 'KC_%_VIEW'
and view_name != 'KC_PROPOSAL_TOTAL';

-- CREATE TABLES from INF views which mirror KC tables
SELECT 'create table RPT_' || replace(replace(view_name,'KC_'),'_VIEW') || ' from select * from ' || view_name || '@infdevlnk;' cmd
from all_views@infdevlnk
where view_name like 'KC_%'
and view_name not like 'KC_%_VIEW'
and view_name != 'KC_PROPOSAL_TOTAL';

SELECT table_name,
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
START WITH curr = 1;

-- Create insert into RPT tables from inf side for views which mirror KC tables
-- CREATE TABLES from INF views which mirror KC tables
-- NOTE: inner select taken from http://stackoverflow.com/questions/11631796/insert-result-of-select-statement-to-another-table-in-oracle-stored-procedure
select 'insert into table RPT_' || replace(replace(view_name,'KC_'),'_VIEW') || '(' || cols.cols || ')  select ' || cols.cols || ' from  mgtest.' || replace(view_name,'KC_') || ';' 
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

-- Create RPT table from KC_PROPOAL_TOTAL (only on INF side)
-- CREATE TABLES from INF views which mirror KC tables
SELECT 'create table RPT_' || replace(replace(view_name,'KC_'),'_VIEW') || ' from select * from ' || view_name || '@infdevlnk;' cmd
from all_views@infdevlnk
where view_name = 'KC_PROPOSAL_TOTAL';

-- Test select work
SELECT 'select * from ' || view_name || '@infdevlnk;' cmd
from all_views@infdevlnk
where view_name like 'KC_%'
and view_name not like 'KC_%_VIEW';


describe all_tab_columns;

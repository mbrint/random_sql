-- Build Tables from union of myGRANT/infoed for views which are mirrored.
BEGIN
    FOR i IN (  SELECT 'create table mg_dwh.RPT_' || replace(replace(view_name,'DW_'),'_V') || ' as ( select ''mygrant'' as source, ' || cols.cols || ' from mgprod.' || view_name || ' union all ' ||
 '      select ''infoed'' as source, ' || cols.cols || ' from ' || view_name || '@infdevlnk )' cmd
from all_views,
(SELECT table_name,
       LTRIM(MAX(SYS_CONNECT_BY_PATH(column_name,','))
       KEEP (DENSE_RANK LAST ORDER BY curr),',') AS cols
FROM   (SELECT table_name,
               column_name,
               ROW_NUMBER() OVER (PARTITION BY table_name ORDER BY column_name) AS curr,
               ROW_NUMBER() OVER (PARTITION BY table_name ORDER BY column_name) -1 AS prev
        FROM   all_tab_columns
        where table_name like 'DW_%\_V' escape '\')
GROUP BY table_name
CONNECT BY prev = PRIOR curr AND table_name = PRIOR table_name
START WITH curr = 1) cols
where view_name like 'DW_%\_V' escape '\'
  and view_name = cols.table_name
union all
SELECT 'create table mg_dwh.RPT_' || replace(replace(view_name,'DW_'),'_V') || 
       '  as ( select cast(''infoed'' as varchar2(7)) as source,' || cols.cols || ' from ' || view_name || '@infdevlnk union all ' ||
       '       select ''mygrant'' as source,' || cols.cols || ' from mgprod.' || replace(replace(view_name,'DW_'),'_V') || ') ' cmd
from all_views@infdevlnk,
(SELECT table_name,
       LTRIM(MAX(SYS_CONNECT_BY_PATH(column_name,','))
       KEEP (DENSE_RANK LAST ORDER BY curr),',') AS cols
FROM   (SELECT table_name,
               column_name,
               ROW_NUMBER() (PARTITION BY table_name ORDER BY column_name) AS curr,
               ROW_NUMBER() OVER (PARTITION BY table_name ORDER BY column_name) -1 AS prev
        FROM   all_tab_columns@infdevlnk
        where table_name like 'DW_%'
          and table_name not like 'DW_%_V')
GROUP BY table_name
CONNECT BY prev = PRIOR curr AND table_name = PRIOR table_name
START WITH curr = 1) cols
where view_name like 'DW_%'
and view_name not like 'DW_%_V'
and view_name = table_name
union all
SELECT 'create table mg_dwh.RPT_' || replace(repkkkklace(view_name,'DW_'),'_MV') || ' as ( select ''mygrant'' as source, ' || cols.cols || ' from mgprod.' || view_name || ') ' cmd
from all_views,
(SELECT table_name,
       LTRIM(MAX(SYS_CONNECT_BY_PATH(column_name,','))
       KEEP (DENSE_RANK LAST ORDER BY curr),',') AS cols
FROM   (SELECT table_name,
               column_name,
               ROW_NUMBER() OVER (PARTITION BY table_name ORDER BY column_name) AS curr,
               ROW_NUMBER() OVER (PARTITION BY table_name ORDER BY column_name) -1 AS prev
        FROM   all_tab_columns
        where table_name like 'DW_%_MV')
GROUP BY table_name
CONNECT BY prev = PRIOR curr AND table_name = PRIOR table_name
START WITH curr = 1) cols
where view_name like 'DW_%_MV'
  and view_name = cols.table_name
) 
    LOOP 
      EXECUTE IMMEDIATE(i.cmd); 
    END LOOP; 
END;
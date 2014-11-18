select VIEW_name,replace(replace(replace(view_name,'DW_'),'_V'),'_MV') orderbyme from all_views 
where owner = 'MGPROD'
and VIEW_NAME like 'DW_%'
union
select view_name,replace(replace(view_name,'DW_'),'_SUBV') from all_views 
where owner = 'MGPROD'
and VIEW_NAME like '%_SUBV'
order by 2;


select view_name, replace(replace(view_name,'DW_'),'_V') orderbyme  from all_views@infdevlnk
where owner = 'DM_INFOED_ADMINISTRATOR'
and view_name like 'DW_%_V'
union
select view_name, replace(view_name,'DW_') orderbyme from all_views@infdevlnk
where owner = 'DM_INFOED_ADMINISTRATOR'
and view_name like 'DW_%'
and view_name not like 'DW_%_V'
order by 2;

select * from all_tables
where owner = 'MG_DWH'
and table_name like 'RPT_%'
order by table_name;
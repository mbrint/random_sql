
select unique level1,level2,level1_sortid,level2_sortid from sponsor_hierarchy where hierarchy_name = 'REPORTING' order by 1,2;

update sponsor_hierarchy set level1_sortid = null, level2_sortid = null
where hierarchy_name = 'REPORTING';


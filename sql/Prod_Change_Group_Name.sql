select * from krim_grp_t where grp_nm like '%GDO%';

update krim_grp_t set grp_nm = replace(grp_nm,'JABSOM GDO','GDO'),
                      grp_desc= replace(grp_desc,'JABSOM GDO','GDO')
                      where grp_nm like '%GDO%';
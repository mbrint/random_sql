select r.role_id,r.role_nm,d.attr_val decends, count(*) 
from krim_role_mbr_t m,
     krim_role_t r,
     krim_role_mbr_attr_data_t d
where r.role_id = m.role_id
  and d.kim_attr_defn_id = 10001
  and d.role_mbr_id = m.role_mbr_id
  and role_nm like 'UHL%'
group by r.role_id,r.role_nm,d.attr_val order by role_nm;

select * from krim_role_t where role_id in ('10013','10029','10026','10021','10014','11055');

select * from krim_role_mbr_attr_data_t;
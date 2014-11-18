select * from unit where unit_name like '%Cancer%';

select p.prncpl_id, p.prncpl_nm, n.first_nm, n.last_nm, a.attr_val CREATOR_UNIT, c.unit_name CREATOR_UNIT_NAME, i.PRMRY_DEPT_CD, u.unit_name PRIMARY_UNIT_NAME
from krim_role_t r,
     krim_role_mbr_t m,
     krim_role_mbr_attr_data_t a,
     krim_entity_nm_t n,
     krim_entity_emp_info_t i,
     krim_prncpl_t p,
     unit c,
     unit u
where r.role_nm = 'Proposal Creator'
  and r.role_id = m.role_id
  and m.role_mbr_id = a.role_mbr_id
  and m.mbr_id = n.entity_id
  and n.entity_id = i.entity_id
  and p.prncpl_id = n.entity_id
  and i.prmry_ind = 'Y'
  and n.dflt_ind = 'Y'
  and c.unit_number = a.attr_val
  and u.unit_number(+) = i.PRMRY_DEPT_CD
  and a.attr_val in ( select unit_number from 
                      (
                      select unit_number,unit_name, sys_connect_by_path(unit_number,'/') unit_path,sys_connect_by_path(unit_name,'->')  org_cart
                      from unit 
                      start with unit_number = '000001'
                      connect by prior unit_number = parent_unit_number
                      order by unit_path
                    )
                   where unit_path like '%MA1423%'
                   and unit_number not like 'DUNS%')
order by 2,3,4,5;



select p.prncpl_id, i.entity_id, n.first_nm, n.last_nm, i.PRMRY_DEPT_CD, u.unit_name PRIMARY_UNIT_NAME
from  krim_entity_emp_info_t i,
      krim_entity_nm_t n,
      krim_prncpl_t p,
      unit u
where  u.unit_number(+) = i.PRMRY_DEPT_CD
  and n.entity_id = i.entity_id
  and p.prncpl_id = n.entity_id
  and i.PRMRY_DEPT_CD in ( select unit_number from 
                      (
                      select unit_number,unit_name, sys_connect_by_path(unit_number,'/') unit_path,sys_connect_by_path(unit_name,'->')  org_cart
                      from unit 
                      start with unit_number = '000001'
                      connect by prior unit_number = parent_unit_number
                      order by unit_path
                    )
                   where unit_path like '%MA1423%'
                   and unit_number not like 'DUNS%')                  
    and n.entity_id not in ( 
select prncpl_id from 
(
select p.prncpl_id, p.prncpl_nm, n.first_nm, n.last_nm, a.attr_val CREATOR_UNIT, c.unit_name CREATOR_UNIT_NAME, i.PRMRY_DEPT_CD, u.unit_name PRIMARY_UNIT_NAME
from krim_role_t r,
     krim_role_mbr_t m,
     krim_role_mbr_attr_data_t a,
     krim_entity_nm_t n,
     krim_entity_emp_info_t i,
     krim_prncpl_t p,
     unit c,
     unit u
where r.role_nm = 'Proposal Creator'
  and r.role_id = m.role_id
  and m.role_mbr_id = a.role_mbr_id
  and m.mbr_id = n.entity_id
  and n.entity_id = i.entity_id
  and p.prncpl_id = n.entity_id
  and i.prmry_ind = 'Y'
  and n.dflt_ind = 'Y'
  and c.unit_number = a.attr_val
  and u.unit_number(+) = i.PRMRY_DEPT_CD
  and a.attr_val in ( select unit_number from 
                      (
                      select unit_number,unit_name, sys_connect_by_path(unit_number,'/') unit_path,sys_connect_by_path(unit_name,'->')  org_cart
                      from unit 
                      start with unit_number = '000001'
                      connect by prior unit_number = parent_unit_number
                      order by unit_path
                    )
                   where unit_path like '%MA1423%'
                   and unit_number not like 'DUNS%')
order by 2,3,4,5
));
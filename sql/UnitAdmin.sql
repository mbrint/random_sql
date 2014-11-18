select a.UNIT_ADMINISTRATOR_TYPE_CODE, 
       u.unit_number,
       u.unit_name, 
       a.person_id,
       p.first_nm || ' ' || p.last_nm as perosn_name,
       u.unit_path,
       u.org_cart
from ( select '' as UNIT_ADMINISTRATOR_TYPE_CODE, unit_number,unit_name, '' as person_id, sys_connect_by_path(unit_number,'/') unit_path,sys_connect_by_path(unit_name,'->')  org_cart
       from unit 
       start with unit_number = '000001'
       connect by prior unit_number = parent_unit_number
       order by unit_path ) u,
       unit_administrator a,
       krim_entity_nm_t p
where a.unit_number = u.unit_number
and   a.person_id = p.entity_id
and   a.unit_administrator_type_code = '6';

select * from unit 
where unit_number not in (
select 
       u.unit_number
from ( select '' as UNIT_ADMINISTRATOR_TYPE_CODE, unit_number,unit_name, '' as person_id, sys_connect_by_path(unit_number,'/') unit_path,sys_connect_by_path(unit_name,'->')  org_cart
       from unit 
       start with unit_number = '000001'
       connect by prior unit_number = parent_unit_number
       order by unit_path ) u,
       unit_administrator a,
       krim_entity_nm_t p
where a.unit_number = u.unit_number
and   a.person_id = p.entity_id
and   a.unit_administrator_type_code = '6');
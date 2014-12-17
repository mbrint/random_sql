select t.description,
       a.UNIT_ADMINISTRATOR_TYPE_CODE, 
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
       unit_administrator_type t,
       krim_entity_nm_t p
where a.unit_number = u.unit_number
and   a.unit_administrator_type_code = t.unit_administrator_type_code
and   a.person_id = p.entity_id
and   p.dflt_ind = 'Y'
and   a.unit_administrator_type_code > 900
and   (u.unit_number like 'HI%' or u.unit_number = 'DUNS0004')
and   unit_path like '/000001/SW1002/HI1618%'
;

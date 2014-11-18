select '' as UNIT_ADMINISTRATOR_TYPE_CODE, unit_number,unit_name, '' as person_id, sys_connect_by_path(unit_number,'/') unit_path,sys_connect_by_path(unit_name,'->')  org_cart
from unit 
start with unit_number = '000001'
connect by prior unit_number = parent_unit_number
order by unit_path;
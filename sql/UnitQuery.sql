select unit_number, sys_connect_by_path(unit_name,' -> ')  org_cart
from unit 
start with unit_number = '000001'
connect by prior unit_number = parent_unit_number;
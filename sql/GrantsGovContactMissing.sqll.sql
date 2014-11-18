select *
from unit where unit_number not in (select unit_number from unit_administrator where unit_administrator_type_code = '6' );
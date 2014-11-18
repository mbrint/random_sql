select unique unit.ORGANIZATION_ID , unit.unit_name , duns_number
from unit, 
     organization
where unit.organization_id = organization.organization_id
order by unit.organization_id;

select unique unit_number, unit.ORGANIZATION_ID , unit.parent_unit_number, unit.unit_name , duns_number
from unit, 
     organization
where unit.organization_id = organization.organization_id
and unit.organization_id = 000001
order by duns_number;

update unit set organization_id = null
where organization_id = '000001'
and unit_number != '000001';
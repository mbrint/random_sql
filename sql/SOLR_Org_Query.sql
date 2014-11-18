select organization_name, organization_id, address, r.sponsor_code, o.update_user, o.update_timestamp, r.rolodex_id, r.actv_ind
from organization o
join rolodex r on r.rolodex_id = o.contact_address_id
and r.sponsor_address_flag = 'N'
and r.actv_ind = 'Y'
and organization_id in ( '11172','011072');

select * from organization where organization_id = '011072';

select contact_address_id from organization where organization_id = '011009';

select * from rolodex where rolodex_id = '22163';

update organization set contact_address_id = '22142'
where organization_id = '011021';


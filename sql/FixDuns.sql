select substr(r.postal_code,1,5) zip, o.duns_number, count(*)
from organization o,
     rolodex r
where o.contact_address_id = r.rolodex_id
group by substr(r.postal_code,1,5),o.duns_number
order by  zip;

select count(*)
from organization o,
     rolodex r
where o.contact_address_id = r.rolodex_id;

select count(*) from organization;

select o.*,r.*
from organization o,
     rolodex r
where o.contact_address_id = r.rolodex_id
  and r.postal_code is null;
  
update organization
set duns_number = '195738039', duns_plus_four_number = '1957380390000'
where contact_address_id in (select rolodex_id from rolodex where substr(postal_code,1,5) = '96720');

select distinct duns_number,duns_plus_four_number 
from organization
where contact_address_id in (select rolodex_id from rolodex where substr(postal_code,1,5) = '96720');

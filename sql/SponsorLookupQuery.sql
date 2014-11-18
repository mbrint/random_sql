select * from organization;
select * from rolodex;

select o.address 
      ,r.organization
      ,r.address_line_1
      ,r.address_line_2
      ,r.address_line_3
      ,r.city
      ,r.county 
      ,r.state
      ,r.postal_code
from organization o
           ,rolodex r
where o.contact_address_id = r.rolodex_id
  and r.sponsor_address_flag = 'N'
  and r.actv_ind = 'Y';


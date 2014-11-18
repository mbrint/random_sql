select * from negotiation_activity where activity_type_id  in (
select  activity_type_id
from negotiation_activity_type n,
     krcr_parm_t p
where p.parm_nm = 'uh_restricted_negotiation_activity_types'
  and p.val like '%[' || n.description || ']%'
  );
  
  select * from negotiation_activity ;
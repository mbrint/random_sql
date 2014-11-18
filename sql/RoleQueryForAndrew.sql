select * from kim_info;

select uhuuid from kim_info where lastname = 'gouldner';

select r.role_nm,r.role_id,rm.mbr_id,p.prncpl_nm,n.first_nm,n.last_nm,n.middle_nm,at.nm,ra.attr_val,rm.actv_to_dt,rm.actv_to_dt,
       rm.role_mbr_id
--select unique(      rm.mbr_id  ), r.role_nm
from krim_role_t r,
     krim_role_mbr_t rm,
     krim_role_mbr_attr_data_t ra,
     krim_attr_defn_t at,
     krim_prncpl_t p,
     krim_entity_nm_t n
where r.role_id = rm.role_id
  and p.entity_id = rm.mbr_id
  and p.entity_id = n.entity_id
  and rm.role_mbr_id = ra.role_mbr_id
  and ra.kim_attr_defn_id = at.kim_attr_defn_id
  --and firstname is null and lastname is null -- search for missing from kim_info (profiler)
  --and rm.actv_to_dt is not null
  --and p.PRNCPL_NM = 'rebekah7'   -- search for user by userid
  --and rm.role_id = '10010'   
  -- and uhuuid = '11483987'    -- search for user by uhid
  and r.role_nm like 'UHL%' -- search for level 7 example
  and ra.attr_val in ('SW1002') -- search for unit
  order by 1
  ;
  
select * 
from krim_role_t r,
     krim_role_mbr_t rm,
     krim_role_mbr_attr_data_t ra
where r.role_id = rm.role_id
and rm.role_mbr_id = ra.role_mbr_id
and r.role_nm like 'UHL%'
and ra.attr_val = 'MU1293' ;
  
select * from krim_role_mbr_t where role_mbr_id in (48818,48819,48820,48817);
select * from krim_role_mbr_attr_data_t where role_mbr_id in (48818,48819,48820,48817);
delete from krim_role_mbr_t where role_mbr_id in (48818,48819,48820,48817);
delete from krim_role_mbr_attr_data_t where role_mbr_id in (48818,48819,48820,48817);
  

  
select r.role_nm,r.role_id,rm.mbr_id,ki.uhusername,ki.firstname,ki.lastname,ki.middlename
from krim_role_t r,
     krim_role_mbr_t rm,
     kim_info ki
where r.role_id = rm.role_id
  and rm.mbr_id = ki.uhuuid
  and uhusername = 'gouldner';
 -- and uhuuid = '16297093';
  
  
  select * from krim_role_mbr_attr_data_t;
  select * from krim_attr_defn_t;
  select * from krim_role_mbr_t;
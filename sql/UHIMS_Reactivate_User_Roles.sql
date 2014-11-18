-- Inspect current roles
select r.role_nm,r.role_id,rm.mbr_id,p.prncpl_nm,n.first_nm,n.last_nm,n.middle_nm,at.nm,ra.attr_val,rm.actv_to_dt,rm.actv_to_dt,
       rm.role_mbr_id
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
  and p.PRNCPL_NM = 'ifo'   -- search for user by userid
  order by 1
;

--restore all roles to an individual
update krim_role_mbr_t set actv_to_dt = null,actv_frm_dt = null 
where mbr_id =  '16238672';


select * from krim_grp_mbr_t where mbr_id = '16238672';

update krim_grp_mbr_t set actv_to_dt = null,actv_frm_dt = null 
where mbr_id =  '16238672';

--  NEED TO ADD PERSON ACTIVE....not sure if krim_prncpl_t or krim_entity_t
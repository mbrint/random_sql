select u.unit_number,u.unit_name,u.unit_path,r.*
from 
(select unit_number,unit_name, sys_connect_by_path(unit_number,'/') unit_path
      from unit 
      start with unit_number = '000001'
      connect by prior unit_number = parent_unit_number
) u,
(
select r.role_nm,r.role_id,rm.mbr_id,p.prncpl_nm,n.first_nm,n.last_nm,n.middle_nm,ra.attr_val UNIT_number,ra2.attr_val DESCENDS,rm.actv_to_dt,
       rm.role_mbr_id
from krim_role_t r,
     krim_role_mbr_t rm,
     krim_role_mbr_attr_data_t ra,
     krim_role_mbr_attr_data_t ra2,
     krim_attr_defn_t at,
     krim_attr_defn_t at2,
     krim_prncpl_t p,
     krim_entity_nm_t n
where r.role_id = rm.role_id
  and p.entity_id = rm.mbr_id
  and p.entity_id = n.entity_id
  and rm.role_mbr_id = ra.role_mbr_id
  and rm.role_mbr_id = ra2.role_mbr_id
  and ra.kim_attr_defn_id = at.kim_attr_defn_id
  and ra2.kim_attr_defn_id = at2.kim_attr_defn_id
  and n.dflt_ind = 'Y' -- only want one name per person or we get duplicate rows.
  and at.nm = 'unitNumber'
  and at2.nm = 'subunits'
  --and firstname is null and lastname is null -- search for missing from kim_info (profiler)
  --and rm.actv_to_dt is not null
  --and p.PRNCPL_NM = 'rebekah7'   -- search for user by userid
  --and rm.role_id = '10010'   
  -- and uhuuid = '11483987'    -- search for user by uhid
  and r.role_nm like 'UHL7%' 
  and (rm.actv_to_dt > sysdate or actv_to_dt is null)
  and (rm.actv_frm_dt < (sysdate + 1) or actv_to_dt is null)
  --and ra.attr_val = 'MA1551' -- search for unit
) R
where r.unit_number = u.unit_number (+)
order by u.unit_path,mbr_id 
  ;
  

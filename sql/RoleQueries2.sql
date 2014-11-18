select role_nm,mt.mbr_id,mt.mbr_typ_cd
from krim_role_t rt,
     krim_role_mbr_t mt,
     krim_role_mbr_attr_data_t attr
where rt.role_nm like 'Create Proposal Log'
  and rt.role_id = mt.role_id
  and attr.role_mbr_id = mt.role_mbr_id
  --and attr.attr_val = 'MA1538'
  --and mt.mbr_id = '16818582'  --jtj  16818582
  ;
  --and kim_attr_defn_id = '10000'
  --and attr.attr_val like 'WO%'
  --and (attr_val like 'DUN%' or role_nm like 'UHL2%Approver' or role_nm like 'UH%Final%Approver');
  
delete from KRIM_GRP_MBR_T;  
  
select role_nm,mt.mbr_id,mt.mbr_typ_cd,krim_grp_t.grp_nm
from krim_role_t rt,
     krim_role_mbr_t mt,
     krim_grp_t,
     krim_role_mbr_attr_data_t attr
where rt.role_nm like 'Create%'
  and rt.role_id = mt.role_id
  and attr.role_mbr_id = mt.role_mbr_id 
  and mt.mbr_id = krim_grp_t.grp_id
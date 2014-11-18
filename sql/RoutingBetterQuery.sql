--
-- NOTE:  Select produces a commit/rollback request because of the issue with kim_info view.
--

select role_nm,attr.attr_val,mt.mbr_id,kinf.uhusername,kinf.firstname,kinf.lastname,attr.kim_attr_defn_id,attr.role_mbr_id,mt.actv_frm_dt,mt.actv_to_dt
from krim_role_t rt,
     krim_role_mbr_t mt,
     krim_role_mbr_attr_data_t attr,
     kim_info kinf
where rt.role_nm like 'UHL%Approver'
  and rt.role_id = mt.role_id
  and attr.role_mbr_id = mt.role_mbr_id
  --and kim_attr_defn_id = '10000'
  and mt.mbr_id in ( '17205930','10294592','21108078')
  and kinf.uhuuid = mt.mbr_id
  --and attr.kim_attr_defn_id = '10000'
  and actv_to_dt is null
  order by role_nm,attr.role_mbr_id,attr_val,mbr_id;
  
select role_nm,attr.attr_val,mt.mbr_id,kinf.uhusername,kinf.firstname,kinf.lastname,attr.kim_attr_defn_id,attr.role_mbr_id,mt.actv_frm_dt,mt.actv_to_dt
from krim_role_t rt,
     krim_role_mbr_t mt,
     krim_role_mbr_attr_data_t attr,
     kim_info kinf
where rt.role_nm like 'UHL%Approver'
  and rt.role_id = mt.role_id
  and attr.role_mbr_id = mt.role_mbr_id
  --and kim_attr_defn_id = '10000'
  and attr_val in ('MA1423','MA1424','MA1425','MA1426','MA1427')
  and kinf.uhuuid = mt.mbr_id
  and role_nm in ('UHL4-UH-Chair-Approver','UHL5-UH-Dean-Director-Approver')
  --and attr.kim_attr_defn_id = '10000'
  and (mt.actv_to_dt is null or (mt.actv_to_dt > sysdate and mt.actv_frm_dt < sysdate))
  order by role_nm,attr_val,attr.role_mbr_id,attr_val,mbr_id;
  
  select sysdate from dual;
  
  
 - 21108078 =  skanodia  Shreya Kanodia
 - 10294592 =  bissell Brian Issell
 - 17205930 =  mcarbone Michele Carbone
 
  
  --and attr.attr_val in ('MA1423','MA1425');
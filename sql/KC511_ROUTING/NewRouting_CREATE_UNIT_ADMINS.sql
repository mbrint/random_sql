set define off
set sqlblanklines on
spool CREATE_UNIT_ADMINS.log

delete from unit_administrator where update_user = 'ROUTING';

insert into unit_administrator (obj_id, ver_nbr, update_user, update_timestamp, unit_number, person_id,unit_administrator_type_code,actv_to_dt,actv_frm_dt)
select sys_guid(),'1','ROUTING',sysdate,a.unit_number, a.prncpl_id,a.unit_admin_type_code,actv_frm_dt,actv_to_dt
from ( 
select unique unit_number,prncpl_id,unit_admin_type_code,actv_frm_dt,actv_to_dt from 
(
select unit_number,prncpl_id,unit_admin_type_code,actv_frm_dt,actv_to_dt from temp_uh_routing_chair
union all
select unit_number,prncpl_id,unit_admin_type_code,actv_frm_dt,actv_to_dt from temp_uh_routing_chair_desc
union all
select unit_number,prncpl_id,unit_admin_type_code,actv_frm_dt,actv_to_dt from temp_uh_routing_chancellor
union all
select unit_number,prncpl_id,unit_admin_type_code,actv_frm_dt,actv_to_dt from temp_uh_routing_chanclr_desc
union all
select unit_number,prncpl_id,unit_admin_type_code,actv_frm_dt,actv_to_dt from temp_uh_routing_dean
union all
select unit_number,prncpl_id,unit_admin_type_code,actv_frm_dt,actv_to_dt from temp_uh_routing_dean_desc
union all
select unit_number,prncpl_id,unit_admin_type_code,actv_frm_dt,actv_to_dt  from temp_uh_routing_fa
union all
select unit_number,prncpl_id,unit_admin_type_code,actv_frm_dt,actv_to_dt from temp_uh_routing_fa_descends
union all
select unit_number,prncpl_id,unit_admin_type_code,actv_frm_dt,actv_to_dt from temp_uh_routing_p_a_desc
union all
select unit_number,prncpl_id,unit_admin_type_code,actv_frm_dt,actv_to_dt from temp_uh_routing_vc
union all
select unit_number,prncpl_id,unit_admin_type_code,actv_frm_dt,actv_to_dt from temp_uh_routing_vc_desc
union all
select unit_number,prncpl_id,unit_admin_type_code,actv_frm_dt,actv_to_dt from temp_uh_routing_gdo
union all
select unit_number,prncpl_id,unit_admin_type_code,actv_frm_dt,actv_to_dt from temp_uh_routing_rapd
) all_admins) a where actv_to_dt > '1-Jan-2000' or actv_frm_dt is null;
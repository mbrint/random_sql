drop table temp_uh_routing_chair;
drop table temp_uh_routing_chair_desc;
drop table temp_uh_routing_chancellor;
drop table temp_uh_routing_chanclr_desc;
drop table temp_uh_routing_dean;
drop table temp_uh_routing_dean_desc;
drop table temp_uh_routing_fa;
drop table temp_uh_routing_fa_descends;
drop table temp_uh_routing_fa_fo_jabsom;
drop table temp_uh_routing_p_a_desc;
drop table temp_uh_routing_vc;
drop table temp_uh_routing_vc_desc;
drop table temp_uh_routing_gdo;
drop table temp_uh_routing_rapd;

select * from unit_administrator where 1=0;

delete from unit_administrator where update_user = 'ROUTING';

--insert into unit_administrator (obj_id, ver_nbr, update_user, update_timestamp, unit_number, person_id,unit_administrator_type_code,actv_to_dt,actv_frm_dt)
select unit_number,prncpl_id,unit_admin_type_code,count(*)
from
(
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
) all_admins) a ) x
group by unit_number,prncpl_id,unit_admin_type_code
having count(*) > 1;

select * from 
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
) r
where actv_to_dt > '1-Jan-2000' or actv_frm_dt is null;

select distinct all_routing.* from 
(
select unit_number,prncpl_id,unit_admin_type_code,actv_to_dt from temp_uh_routing_chair
union all
select unit_number,prncpl_id,unit_admin_type_code,actv_to_dt from temp_uh_routing_chair_desc
union all
select unit_number,prncpl_id,unit_admin_type_code,actv_to_dt from temp_uh_routing_chancellor
union all
select unit_number,prncpl_id,unit_admin_type_code,actv_to_dt from temp_uh_routing_chanclr_desc
union all
select unit_number,prncpl_id,unit_admin_type_code,actv_to_dt from temp_uh_routing_dean
union all
select unit_number,prncpl_id,unit_admin_type_code,actv_to_dt from temp_uh_routing_dean_desc
union all
select unit_number,prncpl_id,unit_admin_type_code,actv_to_dt  from temp_uh_routing_fa
union all
select unit_number,prncpl_id,unit_admin_type_code,actv_to_dt from temp_uh_routing_fa_descends
union all
select unit_number,prncpl_id,unit_admin_type_code,actv_to_dt from temp_uh_routing_p_a_desc
union all
select unit_number,prncpl_id,unit_admin_type_code,actv_to_dt from temp_uh_routing_vc
union all
select unit_number,prncpl_id,unit_admin_type_code,actv_to_dt from temp_uh_routing_vc_desc
union all
select unit_number,prncpl_id,unit_admin_type_code,actv_to_dt from temp_uh_routing_gdo
union all
select unit_number,prncpl_id,unit_admin_type_code,actv_to_dt from temp_uh_routing_rapd
) all_routing
where actv_to_dt is not null;


select * from temp_uh_routing_chair
where actv_to_dt is not null;
select * from temp_uh_routing_chair_desc
where actv_to_dt is not null;
select * from temp_uh_routing_chancellor
where actv_to_dt is not null;
select * from temp_uh_routing_chanclr_desc
where actv_to_dt is not null;
select * from temp_uh_routing_dean
where actv_to_dt is not null;
select * from temp_uh_routing_dean_desc
where actv_to_dt is not null;
select * from temp_uh_routing_fa
where actv_to_dt is not null;
select * from temp_uh_routing_fa_descends
where actv_to_dt is not null;
select * from temp_uh_routing_p_a_desc
where actv_to_dt is not null;
select * from temp_uh_routing_vc
where actv_to_dt is not null;
select * from temp_uh_routing_vc_desc
where actv_to_dt is not null;
select * from temp_uh_routing_gdo
where actv_to_dt is not null;
select * from temp_uh_routing_rapd
where actv_to_dt is not null;


select distinct all_routing.* from 
(
select unit_number,prncpl_id,unit_admin_type_code,actv_to_dt from temp_uh_routing_chair
union all
select unit_number,prncpl_id,unit_admin_type_code,actv_to_dt from temp_uh_routing_chair_desc
union all
select unit_number,prncpl_id,unit_admin_type_code,actv_to_dt from temp_uh_routing_chancellor
union all
select unit_number,prncpl_id,unit_admin_type_code,actv_to_dt from temp_uh_routing_chanclr_desc
union all
select unit_number,prncpl_id,unit_admin_type_code,actv_to_dt from temp_uh_routing_dean
union all
select unit_number,prncpl_id,unit_admin_type_code,actv_to_dt from temp_uh_routing_dean_desc
union all
select unit_number,prncpl_id,unit_admin_type_code,actv_to_dt  from temp_uh_routing_fa
union all
select unit_number,prncpl_id,unit_admin_type_code,actv_to_dt from temp_uh_routing_fa_descends
union all
select unit_number,prncpl_id,unit_admin_type_code,actv_to_dt from temp_uh_routing_p_a_desc
union all
select unit_number,prncpl_id,unit_admin_type_code,actv_to_dt from temp_uh_routing_vc
union all
select unit_number,prncpl_id,unit_admin_type_code,actv_to_dt from temp_uh_routing_vc_desc
union all
select unit_number,prncpl_id,unit_admin_type_code,actv_to_dt from temp_uh_routing_gdo
union all
select unit_number,prncpl_id,unit_admin_type_code,actv_to_dt from temp_uh_routing_rapd
) all_routing
where actv_to_dt is not null;


select count(unique unit_admin_type_code || unit_number || prncpl_id),count(unit_admin_type_code || unit_number || prncpl_id) from temp_uh_routing_chair
union all
--select count(unique unit_admin_type_code || unit_number || prncpl_id),count(unit_admin_type_code || unit_number || prncpl_id) from temp_uh_routing_chair_desc
--union all
--select count(unique unit_admin_type_code || unit_number || prncpl_id),count(unit_admin_type_code || unit_number || prncpl_id) from temp_uh_routing_chancellor
--union all
--select count(unique unit_admin_type_code || unit_number || prncpl_id),count(unit_admin_type_code || unit_number || prncpl_id) from temp_uh_routing_chanclr_desc
--union all
--select count(unique unit_admin_type_code || unit_number || prncpl_id),count(unit_admin_type_code || unit_number || prncpl_id) from temp_uh_routing_dean
--union all
--select count(unique unit_admin_type_code || unit_number || prncpl_id),count(unit_admin_type_code || unit_number || prncpl_id) from temp_uh_routing_dean_desc
--union all
select count(unique unit_admin_type_code || unit_number || prncpl_id),count(unit_admin_type_code || unit_number || prncpl_id) from temp_uh_routing_fa
union all
select count(unique unit_admin_type_code || unit_number || prncpl_id),count(unit_admin_type_code || unit_number || prncpl_id) from temp_uh_routing_fa_descends
--union all
--select count(unique unit_admin_type_code || unit_number || prncpl_id),count(unit_admin_type_code || unit_number || prncpl_id) from temp_uh_routing_fa_fo_jabsom
--union all
--select count(unique unit_admin_type_code || unit_number || prncpl_id),count(unit_admin_type_code || unit_number || prncpl_id) from temp_uh_routing_p_a_desc
--union all
--select count(unique unit_admin_type_code || unit_number || prncpl_id),count(unit_admin_type_code || unit_number || prncpl_id) from temp_uh_routing_vc
--union all
--select count(unique unit_admin_type_code || unit_number || prncpl_id),count(unit_admin_type_code || unit_number || prncpl_id) from temp_uh_routing_vc_desc
--union all
--select count(unique unit_admin_type_code || unit_number || prncpl_id),count(unit_admin_type_code || unit_number || prncpl_id) from temp_uh_routing_gdo
--union all
--select count(unique unit_admin_type_code || unit_number || prncpl_id),count(unit_admin_type_code || unit_number || prncpl_id) from temp_uh_routing_rapd;
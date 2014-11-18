select * from kim_info;

select uhuuid from kim_info where lastname = 'gouldner';

select r.role_nm,r.role_id,
       rm.mbr_id,
       ki.uhusername,ki.firstname,ki.lastname,ki.middlename,
       at.nm,
       ra.attr_val,rm.actv_to_dt,
       rm.role_mbr_id,
       rm.last_updt_dt
from krim_role_t r,
     krim_role_mbr_t rm,
     mgprod.kim_info ki,
     krim_role_mbr_attr_data_t ra,
     krim_attr_defn_t at
where r.role_id = rm.role_id
  and rm.mbr_id = ki.uhuuid(+)
  and rm.role_mbr_id = ra.role_mbr_id
  and ra.kim_attr_defn_id = at.kim_attr_defn_id
  --and rm.actv_to_dt is not null
    and ATTR_VAL = 'MA1424'
  --and uhusername = 'rubys'
  --and rm.role_id = '10010'
  --and uhuuid = '16297093'
  and role_nm like 'UHL7%'
    order by 1,4

  ;
  
  select * from krim_role_mbr_t
  where mbr_id = '13648926';
  
  
  select * from krim_role_mbr_t_bk;
  select * from krim_role_mbr_attr_data_t_bk;

update krim_role_mbr_t 
set mbr_id = '11561486'
where mbr_id = '13648926';

select * from krim_role_mbr_t where mbr_id = '11561486';

update krim_role_mbr_t
set actv_to_dt = null
where role_mbr_id in ('18375','18376','18377','18378','18379','33621','18381','18382','33596','33843','18380');
  
create table krim_role_mbr_attr_data_t_bk 
as select *
   from krim_role_mbr_attr_data_t
   where role_mbr_id in ('18375','18376','18377','18378','18379','33621','18381','18382','33596','33843','18380');

delete from krim_role_mbr_attr_data_t
where role_mbr_id in ('18375','18376','18377','18378','18379','33621','18381','18382','33596','33843','18380');
delete from krim_role_mbr_t
where role_mbr_id in ('18375','18376','18377','18378','18379','33621','18381','18382','33596','33843','18380');


delete from krim_role_mbr_attr_data_t
where role_mbr_id in ('18378'); -- ,'18376','18377','18378','18379');
delete from krim_role_mbr_t
where role_mbr_id in ('18378'); -- ,'18376','18377','18378','18379');

insert into krim_role_mbr_attr_data_t select * from krim_role_mbr_attr_data_t_bk;
insert into krim_role_mbr_t select * from krim_role_mbr_t_bk;





  
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
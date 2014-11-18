-- Add dummy account
insert into krim_entity_t (entity_id, obj_id, ver_nbr, actv_ind, last_updt_dt) values ('unassigned',sys_guid(),'1','Y',sysdate);
insert into krim_prncpl_t (prncpl_id,obj_id,ver_nbr,prncpl_nm,entity_id, prncpl_pswd,actv_ind,last_updt_dt) values ('unassigned',sys_guid(),'1','unassigned','unassigned',null,'Y',sysdate);
insert into krim_entity_ent_typ_t (ent_typ_cd,entity_id,obj_id,ver_nbr,actv_ind,last_updt_dt) values ('PERSON','unassigned',sys_guid(),'1','Y',sysdate);


select * from krim_entity_t;
select * from krim_prncpl_t;
select * from krim_entity_ent_typ_t;
select * from krim_ent_typ_t;

-- Add New User not in system yet (Then add person details like name etc using edit maintenance doc)
insert into krim_entity_t (entity_id, obj_id, ver_nbr, actv_ind, last_updt_dt) values ('23611214',sys_guid(),'1','Y',sysdate);
insert into krim_prncpl_t (prncpl_id,obj_id,ver_nbr,prncpl_nm,entity_id, prncpl_pswd,actv_ind,last_updt_dt) values ('wsung',sys_guid(),'1','wsung','23611214',null,'Y',sysdate);
insert into krim_entity_ent_typ_t (ent_typ_cd,entity_id,obj_id,ver_nbr,actv_ind,last_updt_dt) values ('PERSON','23611214',sys_guid(),'1','Y',sysdate);
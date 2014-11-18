-- Create Permission with name Back Door Authorized
INSERT INTO KRIM_PERM_T (PERM_ID, OBJ_ID, VER_NBR, PERM_TMPL_ID, NMSPC_CD, NM, DESC_TXT, ACTV_IND)
    VALUES (KRIM_PERM_ID_S.NEXTVAL, SYS_GUID(), 1,
            (SELECT PERM_TMPL_ID FROM KRIM_PERM_TMPL_T WHERE NM = 'Backdoor Restriction'),
            'KR-SYS', 'Back Door Authorized', 'Authorize user to use the backdoor login', 'Y');
            

-- Add appCode attribute with value 'kc' which rice uses to determine if the backdoor has a permission.
-- NOTE: When rice doesn't find a permission with this attribute correctly configured it assumes back door is allowed for everyone
INSERT INTO KRIM_PERM_ATTR_DATA_T (ATTR_DATA_ID, OBJ_ID, VER_NBR, PERM_ID, KIM_TYP_ID, KIM_ATTR_DEFN_ID, ATTR_VAL)
  VALUES (KRIM_ATTR_DATA_ID_S.NEXTVAL, SYS_GUID(), 1,
         (SELECT PERM_ID FROM KRIM_PERM_T WHERE NM = 'Back Door Authorized'),
         (SELECT KIM_TYP_ID FROM KRIM_TYP_T WHERE NM = 'Default'),
         (SELECT KIM_ATTR_DEFN_ID FROM KRIM_ATTR_DEFN_T WHERE NM = 'appCode'),
         'kc');
         

-- Create new role to assign to users who should have back door access                  
insert into krim_role_t
(role_id, role_nm, nmspc_cd, desc_txt, kim_typ_id, actv_ind, last_updt_dt, obj_id)
values (KRIM_ROLE_ID_S.nextval,
        'Back Door Authorized User',
        'KR-SYS',
        'This role allows the members to use the backdoor login feature for non production system.',
        (select kim_typ_id from krim_typ_t where nm = 'Default' and nmspc_cd = 'KUALI'),
        'Y', current_date, sys_guid());

     
-- Add new permission to the role   
insert into krim_role_perm_t
(role_perm_id, role_id, perm_id, actv_ind, ver_nbr, obj_id)
values (krim_role_perm_id_s.nextval,
        (select role_id from krim_role_t where role_nm = 'Back Door Authorized User' and nmspc_cd = 'KR-SYS'),
        (select perm_id from krim_perm_t where nm = 'Back Door Authorized' and nmspc_cd = 'KR-SYS'),
        'Y', 1, sys_guid());
        
        
-- Add princple to the role.
-- Note: You may want to skip this one and just add users in role or person maintenance
-- Add gouldner
insert into krim_role_mbr_t (role_mbr_id, role_id, mbr_id,MBR_TYP_CD, ver_nbr, obj_id)
values (krim_role_mbr_id_s.nextval,(select role_id from krim_role_t where nmspc_cd = 'KR-SYS' and role_nm = 'Back Door Authorized User'),
'20781608','P',1,sys_guid());


-- Add myGRANT Help Desk
insert into krim_role_mbr_t (role_mbr_id, role_id, mbr_id,MBR_TYP_CD, ver_nbr, obj_id)
values (krim_role_mbr_id_s.nextval,(select role_id from krim_role_t where nmspc_cd = 'KR-SYS' and role_nm = 'Back Door Authorized User'),
'12015','G',1,sys_guid());

-- enable parameter
update krcr_parm_t set val = 'Y' where parm_nm = 'SHOW_BACK_DOOR_LOGIN_IND';

--
--select * from KRIM_PERM_T where nm like 'Back Door %';
--select * from KRIM_PERM_ATTR_DATA_T where perm_id = (select perm_id from KRIM_PERM_T where nm like 'Back Door %');
--select * from krim_role_t where role_nm = 'Back Door Authorized User';
--select * from krim_role_perm_t where role_id = (select role_id from krim_role_t where role_nm = 'Back Door Authorized User') and perm_id = (select perm_id from KRIM_PERM_T where nm like 'Back Door %') ;
--select * from krim_role_mbr_t where role_id = (select role_id from krim_role_t where role_nm = 'Back Door Authorized User');
select * from KRIM_ENTITY_ADDR_T where ver_nbr = 3 ;
select * from KRIM_ENTITY_AFLTN_T where ver_nbr = 3;
select * from KRIM_ENTITY_EMAIL_T where ver_nbr = 3 ;
select * from KRIM_ENTITY_EMP_INFO_T where ver_nbr = 3 ;
select * from KRIM_ENTITY_ENT_TYP_T where ver_nbr = 3 ;
select * from KRIM_ENTITY_NM_T where ver_nbr = 3; 
select * from KRIM_ENTITY_PHONE_T where ver_nbr = 3 ;
select * from KRIM_ENTITY_T where ver_nbr = 3;
select * from KRIM_PRNCPL_T where ver_nbr = 3 ;
select * from KRIM_ROLE_MBR_T where ver_nbr = 3 ;
select * from KRIM_ROLE_MBR_ATTR_DATA_T where ver_nbr = 3 ;

select * from KRIM_ENTITY_T;
select * from KRIM_ENTITY_ENT_TYP_T; 
select * from KRIM_ENTITY_ADDR_T;
select * from KRIM_ENTITY_NM_T; 
select * from KRIM_PRNCPL_T;

select * from  all_constraints where constraint_type ='R' and delete_rule = 'CASCADE' and TABLE_NAME = 'KRIM_ENTITY_ENT_TYP_T';

select * from KRIM_ENTITY_ADDR_T;

select * from KRIM_PRNCPL_T where prncpl_nm = 'pcall';

delete from KRIM_ENTITY_T where ver_nbr = 3;
delete from KRIM_ENTITY_ADDR_T where ver_nbr = 3 ;
delete from KRIM_ENTITY_AFLTN_T where ver_nbr = 3;
delete from KRIM_ENTITY_EMAIL_T where ver_nbr = 3 ;
delete from KRIM_ENTITY_EMP_INFO_T where ver_nbr = 3 ;
delete from KRIM_ENTITY_ENT_TYP_T where ver_nbr = 3 ;
delete from KRIM_ENTITY_NM_T where ver_nbr = 3; 
delete from KRIM_ENTITY_PHONE_T where ver_nbr = 3 ;
delete from KRIM_PRNCPL_T where ver_nbr = 3 ;
delete from KRIM_ROLE_MBR_T where ver_nbr = 3 ;
delete from KRIM_ROLE_MBR_ATTR_DATA_T where ver_nbr = 3 ;


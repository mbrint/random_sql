insert into rolodex (rolodex_id,organization,owned_by_unit,
sponsor_address_flag,
create_user,update_timestamp,update_user,ver_nbr,obj_id,actv_ind)
values (999999,'Place Holder',000001,
        'Y',
        'RRG',sysdate,'RRG',1,sys_guid(),'Y');


insert into organization (organization_id,organization_name,contact_address_id,
update_timestamp,update_user,ver_nbr,obj_id)
values (99999999,'Place Holder',999999,sysdate,'RRG',1,sys_guid());

delete from rolodex where rolodex_id = '999999';
delete from organization where organization_id = '99999999';


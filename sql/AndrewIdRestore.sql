
select * from krim_role_mbr_t where mbr_id = '20210107';
select * from krim_role_mbr_attr_data_t where role_mbr_id in ( select role_mbr_id from krim_role_mbr_t where mbr_id = '20210107' );

select * from krim_grp_mbr_t where  mbr_id = '20210107';

select * from krim_entity_t where entity_id = '20210107';
select * from krim_prncpl_t where entity_id = '20210107';

update krim_grp_mbr_t set actv_to_dt = null where mbr_id = '20210107';
update krim_role_mbr_t set actv_to_dt = null where mbr_id = '20210107';
update krim_prncpl_t set actv_ind = 'Y' where entity_id = '20210107';


select grp_id from krim_grp_mbr_t where mbr_id = '15340606';
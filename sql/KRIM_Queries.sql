select * from krim_role_t where role_nm = 'Proposal Submission';
select * from krim_grp_t where grp_id = '10002';
select * from krim_grp_mbr_t where grp_id = '10002' and mbr_id = '12088';

select * from krim_role_mbr_t where ver_nbr = 9;
select * from krim_role_mbr_attr_data_t where ver_nbr =9;

select * from krim_role_mbr_t where mbr_id = '12087' ;
select * from krim_role_mbr_attr_data_t where role_mbr_id in (select role_mbr_id from krim_role_mbr_t where mbr_id = '12087');

select * from krim_role_mbr_t where role_id = '10033';

select * from krim_role_mbr_attr_data_t where role_mbr_id in (select role_mbr_id from krim_role_mbr_t where role_id = '10033');

select * from krim_prncpl_t where prncpl_nm = 'quickstart';

update krim_role_mbr_t set mbr_id = '12014' where role_id = '10033' and mbr_id = '12015' and mbr_typ_cd = 'G';
delete from krim_role_mbr_t where role_id = '10033' and role_mbr_id in ('1374','1375','1396','1397') ;
delete from  krim_role_mbr_attr_data_t where role_mbr_id in
( select role_mbr_id from krim_role_mbr_t where role_id = '10033' and mbr_id = '10000000001' ) and role_mbr_id in ('1374','1375','1396','1397');
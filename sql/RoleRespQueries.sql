select * from KRIM_ROLE_RSP_ACTN_T 
where role_rsp_id in (select role_rsp_id 
                      from KRIM_ROLE_RSP_T 
                      where role_id in (select role_id 
                                        from krim_role_t 
                                        where role_nm like 'UHL_%Approver'));
select * from KRIM_ROLE_RSP_T where ver_nbr = '8'; 
select * from KRIM_RSP_ATTR_DATA_T where ver_nbr = '8';
select * from KRIM_RSP_T where ver_nbr = '8';
select * from krim_role_t where ver_nbr = '8';


update krim_role_t set actv_ind = 'N' where role_nm like 'UH%Approver';
update KRIM_RSP_T set actv_ind = 'N' where nm like 'UH%';

delete from KRIM_ROLE_RSP_ACTN_T 
where role_rsp_id in (select role_rsp_id 
                      from KRIM_ROLE_RSP_T 
                      where role_id in (select role_id 
                                        from krim_role_t 
                                        where role_nm like 'UHL_%Approver'));

delete from KRIM_ROLE_RSP_T where role_id in (select role_id from krim_role_t where role_nm like 'UHL%Approver'); 
delete from KRIM_RSP_ATTR_DATA_T where rsp_id in (select rsp_id from KRIM_RSP_T where nm like 'UH_L%');
delete from KRIM_RSP_T where nm like 'UH_L%';
delete from krim_role_t where role_nm like 'UHL%Approver';

select * from krim_role_t where role_id in ('11057','11058','11059','11060','11061','11062');



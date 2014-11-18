select * from krim_dlgn_t;

select * from krim_dlgn_mbr_t;

select * from krim_dlgn_mbr_attr_data_t;

select * from KREW_DLGN_RSP_T;

select * from krim_role_mbr_t where role_mbr_id = '19194';

select * from krim_role_t where role_id = '11070';


select * 
from krim_dlgn_mbr_t d
    ,krim_role_mbr_t r
where d.dlgn_mbr_id = r.role_mbr_id;

delete from krim_dlgn_t;
delete from krim_dlgn_mbr_t;
delete from krim_dlgn_mbr_attr_data_t;

select * from krim_pnd_dlgn_t;
select * from krim_pnd_dlgn_mbr_t;
select * from krim_pnd_dlgn_mbr_attr_data_t;

delete from krim_pnd_dlgn_t;
delete from krim_pnd_dlgn_mbr_t;
delete from krim_pnd_dlgn_mbr_attr_data_t;

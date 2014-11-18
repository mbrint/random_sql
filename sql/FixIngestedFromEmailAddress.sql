select * from KRNS_PARM_T
where nmspc_cd = 'KR-WKFLW'
and parm_dtl_typ_cd = 'Mailer';

update KRNS_PARM_T
set txt = 'kc-noreply@ors.hawaii.edu'
where nmspc_cd = 'KR-WKFLW'
and parm_dtl_typ_cd = 'Mailer';
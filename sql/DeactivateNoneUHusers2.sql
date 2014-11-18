update KRIM_PRNCPL_T
set ACTV_IND = 'N'
where actv_ind = 'Y'
and prncpl_nm not in ( 'quickstart' , 'admin' , 'jtester' );

select * from KRIM_PRNCPL_T where ACTV_IND = 'Y';

update KRIM_PRNCPL_T
set ACTV_IND = 'Y';
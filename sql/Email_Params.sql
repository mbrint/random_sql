SELECT * FROM krns_parm_t where parm_nm like '%EMAIL%';


update krns_parm_t set txt = 'Y' where parm_nm = 'REROUTE_EMAIL_NOTIFICATION_TO_TEST_ADDRESS';
update krns_parm_t set txt = 'ronald@ors.hawaii.edu' where parm_nm = 'EMAIL_NOTIFICATION_TEST_ADDRESS';
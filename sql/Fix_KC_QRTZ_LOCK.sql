select * from kc_qrtz_locks;
select * from krsb_qrtz_locks;

insert into kc_qrtz_locks (lock_name)
select lock_name from krsb_qrtz_locks;
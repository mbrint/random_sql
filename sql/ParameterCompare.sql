-- in KC50 or other database trying to compare
grant select on krcr_parm_t to mgprod ;

select old.parm_nm,old.txt,new.val ,old.parm_desc_txt
from krns_parm_t old
   ,kc50.krcr_parm_t new
where old.parm_nm = new.parm_nm
and old.txt != new.val;

select count(*) from krns_parm_t;
select count(*) from kc50.krcr_parm_t;
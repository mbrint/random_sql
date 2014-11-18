select * from sponsor_hierarchy 
where sponsor_code = '100241';

select * from sponsor where sponsor_name like 'Princ%';

select count(s.sponsor_code)
from sponsor s,
     sponsor_hierarchy sh
where sh.update_user != 'KCDEV30'
and s.sponsor_code = sh.sponsor_code;

select s.sponsor_code, s.sponsor_name,sh.level1,sh.level2,sh.update_user,sh.update_timestamp
from sponsor s,
     sponsor_hierarchy sh
where sh.update_user != 'KCDEV30'
and s.sponsor_code = sh.sponsor_code
order by sponsor_code;
select a.award_number,a.award_id
from award_persons p,
     award a
where p.award_number = '000000-00000'
  and a.award_id = p.award_id
order by p.award_number;

create table award_persons_fix_2012_08
as select * from award_persons
where award_number = '000000-00000';

select * from award_persons_fix_2012_08;
grant select on award_persons_fix_2012_08 to mg_report;

update award_persons a 
SET award_number = (SELECT award_number FROM award B WHERE A.award_id = B.award_id)
where award_number = '000000-00000';
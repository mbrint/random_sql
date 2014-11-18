-- insert into uh_unit_college (UNIT_NUMBER,COLLEGE_NUMBER) values ('','');

insert into uh_unit_college (UNIT_NUMBER,COLLEGE_NUMBER) values ('SW9977','SW1677');

select unit_number
from unit
where unit_number not in (select unit_number from uh_unit_college)
and unit_number not like 'DUNS%'
and unit_number not like 'EX%';

--select * from uh_unit_college;
select count(*),ua.unit_administrator_type_code 
from unit_administrator ua
group by unit_administrator_type_code;

create table unit_administrator_bk 
as select * from unit_administrator;

create table unit_administrator_test 
as select * from unit_administrator;
delete from unit_administrator_test;

select ua.unit_number old_unit,ua.person_id old_person ,  ut.unit_number new_unit, ut.person_id new_person
from unit_administrator ua,
     unit_administrator_test ut
where ua.unit_number =  ut.unit_number(+)
and ut.person_id is null
union
select ua.unit_number old_unit,ua.person_id old_person ,  ut.unit_number new_unit, ut.person_id new_person
from unit_administrator ua,
     unit_administrator_test ut
where ut.unit_number =  ua.unit_number(+) 
and ua.person_id is null
order by old_unit ,new_unit 
;

select ua.unit_number old_unit,ua.person_id old_person ,  ut.unit_number new_unit, ut.person_id new_person
from unit_administrator ua,
     unit_administrator_test ut
where ua.unit_number =  ut.unit_number(+) 
and ut.unit_number like 'HI%';

select * from unit_administrator where unit_number like 'HI1618';
select
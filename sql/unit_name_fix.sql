create table unit_fix_names as
select u.unit_number, n.unit_name,n.new_name
from unit u,
(select unit_number,unit_name,unit_name 
       || ' (' || 
       case substr(unit_number,0,2) 
       when 'KA' then 'KCC'
       when 'HO' then 'Honolulu CC'
       when 'KU' then 'Kauai CC'
       when 'HA' then 'Hawaii CC'
       when 'HI' then 'UH Hilo'
       when 'MA' then 'UH Manoa'
       when 'LE' then 'Leeward CC'
       when 'MU' then 'UH Maui College'
       when 'WI' then 'Windward CC'
       when 'WO' then 'UH WO'
       else substr(unit_number,0,2)
       END
       || ')' new_name
from unit
where unit_name in (
select unit_name
from unit
where unit_name not like '%(%)%'
group by unit_name
having count(*) > 1)) N
where U.unit_number = N.unit_number;

select u.unit_number,u.unit_name,n.new_name 
from unit u,
     unit_fix_names n
where u.unit_number = n.unit_number;

update unit u
set u.unit_name = (select n.new_name from unit_fix_names n where u.unit_number = n.unit_number)
where u.unit_number in (select n.unit_number from unit_fix_names n where u.unit_number = n.unit_number);

select count(*) from  unit_fix_names;

select unit_number,unit_name from unit where unit_number in (select unit_number from unit_fix_names);

select * from unit_fix_names where unit_number = 'LE1237';

drop table unit_fix_names;

select unit_number,unit_name, length(unit_name) from unit where length(unit_name) > 58;


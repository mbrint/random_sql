select lead_unit_number,award_number,update_user
from award
where lead_unit_number like 'DUNS0009';

select lead_unit_number,award_number,update_user
from award
where award_number like '001184-%';

select unit_number,award_person_id
from award_person_units
where unit_number like 'DUNS0009';

select unit_number,award_person_id
from award_person_units
where award_person_id in ('5306','5259','75991');

update award
set lead_unit_number = 'LE1008'
where lead_unit_number = 'DUNS0009';

update award_person_units
set unit_number = 'LE1008'
where unit_number = 'DUNS0009';

select *
from eps_prop_person
where proposal_number = '10037'
and prop_person_number = 1;

select * 
from eps_prop_person_ext
where proposal_number = '10037'
and prop_person_number = 1;


select *
from eps_prop_person_units
where proposal_number = '10037'
and prop_person_number = 1;

select *
from eps_prop_per_credit_split
where proposal_number = '10037'
and prop_person_number = 1;

delete from eps_prop_person where proposal_number = '10037' and prop_person_number = 1;
delete from eps_prop_person_ext where proposal_number = '10037' and prop_person_number = 1;
delete from eps_prop_person_units where proposal_number = '10037' and prop_person_number = 1;
delete from eps_prop_per_credit_split where proposal_number = '10037' and prop_person_number = 1;








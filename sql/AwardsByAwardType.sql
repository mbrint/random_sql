select award_type.award_type_code,award_type.description,count(award.award_type_code)
from award_type,
     award
where award.award_type_code(+) = award_type.award_type_code
  and award_type.award_type_code not in (3,14,1,9,5,15)
group by award_type.award_type_code,award_type.description;

select award_type.award_type_code,award_type.description,document_number
from award_type,
     award
where award.award_type_code(+) = award_type.award_type_code
  and award_type.award_type_code not in (3,14,1,9,5,15)
order by description,document_number desc;

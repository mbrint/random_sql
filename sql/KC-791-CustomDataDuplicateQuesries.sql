select * from proposal_custom_data
where proposal_number = '00006574'
and custom_attribute_id = 180
order by custom_attribute_id,sequence_number,proposal_custom_data_id;

select * from proposal_comments where proposal_number = '00006574';
select * from proposal_unit_contacts where proposal_number = '00006574';
select * from proposal_persons  where proposal_number = '00006574'
order by sequence_number;

-- OK
select * from proposal_custom_data
where proposal_number = '00006576'
and custom_attribute_id = 4
order by custom_attribute_id,sequence_number,proposal_custom_data_id;

-- Bad
select * from proposal_custom_data
where proposal_number = '00006574'
and custom_attribute_id = 4
order by custom_attribute_id,sequence_number,proposal_custom_data_id;

select * from custom_attribute_document where document_type_code = 'INPR';

select proposal_number,sequence_number,custom_attribute_id,count(value)
from proposal_custom_data
where proposal_number = '00006574'
and custom_attribute_id = 4
group by proposal_number, sequence_number, custom_attribute_id
order by proposal_number, sequence_number, custom_attribute_id;


select proposal_number,sequence_number,custom_attribute_id,count(value)
from proposal_custom_data
where custom_attribute_id = 4
  AND proposal_number in (select unique(proposal_number)
from proposal_custom_data
where custom_attribute_id = 4
group by proposal_number, sequence_number, custom_attribute_id
having count(value) > 1  ) 
group by proposal_number, sequence_number, custom_attribute_id
order by proposal_number desc,sequence_number,custom_attribute_id;


select unique(proposal_number)
from proposal_custom_data
where custom_attribute_id = 4
group by proposal_number, sequence_number, custom_attribute_id
having count(value) > 1
order by proposal_number;

select count(unique(proposal_number))
from proposal_custom_data;

select *
from custom_attribute;
where label like '%Aug%';

select * from custom_attribute_document;
where custom_attribute_id = '170';

-- SFI Disclose question id = 160

select * 
from custom_attribute_doc_value;
where custom_attribute_id = 170;

select * from custom_attribute_doc_value
where document_number = 36173;

select * from custom_attribute_doc_value
where document_number = 36138;


select * 
from custom_attribute_doc_value
     ,award
where custom_attribute_id = 170
  and award.document_number = custom_attribute_doc_value.document_number ;
  
select * 
from custom_attribute_doc_value
     ,proposal
where custom_attribute_id = 170
  and custom_attribute_doc_value.document_number = proposal.document_number ;
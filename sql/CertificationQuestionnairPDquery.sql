select *
from questionnaire_answer_header 
where module_item_key like '10698%' -- Proposal number
  and questionnaire_ref_id_fk in (select questionnaire.questionnaire_ref_id from questionnaire 
                                  where name = 'Certification Questionnaire')
;

select * from questionnaire_answer  
where questionnaire_ah_id_fk in ( select questionnaire_answer_header.questionnaire_answer_header_id 
                                  from questionnaire_answer_header 
                                  where module_item_key like '10698%' -- Proposal number
                                  and questionnaire_ref_id_fk in 
                                  (select questionnaire.questionnaire_ref_id from questionnaire 
                                  where name = 'Certification Questionnaire')
                                  )
order by questionnaire_ah_id_fk
;
delete from questionnaire_answer where questionnaire_ah_id_fk = '313693';
delete from questionnaire_answer_header where questionnaire_answer_header_id = '313693';

                                  
                                  
select * from questionnaire where questionnaire_ref_id = '299995'; 

select * from questionnaire_answer_header where module_item_key like '5015%';
      
select * from questionnaire_answer  
where questionnaire_ah_id_fk = '313552';
-- Check if old questionnaire answers are present.
select * from questionnaire_answer  
where questionnaire_ah_id_fk in ( select questionnaire_answer_header.questionnaire_answer_header_id 
                                  from questionnaire_answer_header 
                                  where module_item_key like '9967%' -- Proposal number
                                  and questionnaire_ref_id_fk in (select questionnaire.questionnaire_ref_id from questionnaire where name = 'UH Proposal Person Certification'));
                                  
-- If so delete them
delete from questionnaire_answer where questionnaire_ah_id_fk in ( select questionnaire_answer_header.questionnaire_answer_header_id 
                                  from questionnaire_answer_header 
                                  where module_item_key like '9967%' -- Proposal number
                                  and questionnaire_ref_id_fk in (select questionnaire.questionnaire_ref_id from questionnaire where name = 'UH Proposal Person Certification'));

select * from questionnaire_answer  
where questionnaire_ah_id_fk in ( select questionnaire_answer_header.questionnaire_answer_header_id 
                                  from questionnaire_answer_header 
                                  where module_item_key like '10192%' -- Proposal number
                                  and questionnaire_ref_id_fk in (select questionnaire.questionnaire_ref_id from questionnaire where name = 'UH Proposal Person Certification'));
         
delete from questionnaire_answer where questionnaire_ah_id_fk in ( select questionnaire_answer_header.questionnaire_answer_header_id 
                                  from questionnaire_answer_header 
                                  where module_item_key like '10192%' -- Proposal number
                                  and questionnaire_ref_id_fk in (select questionnaire.questionnaire_ref_id from questionnaire where name = 'UH Proposal Person Certification'));         
                                  
select * from questionnaire_answer  
where questionnaire_ah_id_fk in ( select questionnaire_answer_header.questionnaire_answer_header_id 
                                  from questionnaire_answer_header 
                                  where module_item_key like '8947%' -- Proposal number
                                  and questionnaire_ref_id_fk in (select questionnaire.questionnaire_ref_id from questionnaire where name = 'UH Proposal Person Certification'));
         
delete from questionnaire_answer where questionnaire_ah_id_fk in ( select questionnaire_answer_header.questionnaire_answer_header_id 
                                  from questionnaire_answer_header 
                                  where module_item_key like '8947%' -- Proposal number
                                  and questionnaire_ref_id_fk in (select questionnaire.questionnaire_ref_id from questionnaire where name = 'UH Proposal Person Certification'));                                     
                                    
-- 2014-11-12
-- Doc# 106911
-- prop #10355
select * from questionnaire_answer  
where questionnaire_ah_id_fk in ( select questionnaire_answer_header.questionnaire_answer_header_id 
                                  from questionnaire_answer_header 
                                  where module_item_key like '10355%' -- Proposal number
                                  and questionnaire_ref_id_fk in (select questionnaire.questionnaire_ref_id from questionnaire where name = 'UH Proposal Person Certification'));
         
delete from questionnaire_answer where questionnaire_ah_id_fk in ( select questionnaire_answer_header.questionnaire_answer_header_id 
                                  from questionnaire_answer_header 
                                  where module_item_key like '10355%' -- Proposal number
                                  and questionnaire_ref_id_fk in (select questionnaire.questionnaire_ref_id from questionnaire where name = 'UH Proposal Person Certification'));                                     
 -- 2014-11-26
-- Doc# 101440
-- prop #9777
select * from questionnaire_answer  
where questionnaire_ah_id_fk in ( select questionnaire_answer_header.questionnaire_answer_header_id 
                                  from questionnaire_answer_header 
                                  where module_item_key like '9777%' -- Proposal number
                                  and questionnaire_ref_id_fk in (select questionnaire.questionnaire_ref_id from questionnaire where name = 'UH Proposal Person Certification'));
         
delete from questionnaire_answer where questionnaire_ah_id_fk in ( select questionnaire_answer_header.questionnaire_answer_header_id 
                                  from questionnaire_answer_header 
                                  where module_item_key like '9777%' -- Proposal number
                                  and questionnaire_ref_id_fk in (select questionnaire.questionnaire_ref_id from questionnaire where name = 'UH Proposal Person Certification'));                                     
  
--- Get Proposal Person Number
select *
from eps_prop_person
where proposal_number = '10960';

--- Get Questionnaire header for proposal using module_item_key like '{prop_number}%'
select *
from questionnaire_answer_header 
where module_item_key like '10960%' -- Proposal number
and questionnaire_ref_id_fk in (select questionnaire.questionnaire_ref_id from questionnaire where name like '%Cert%');

--- Get All certification answers for a given proposal
select * from questionnaire_answer  
where questionnaire_ah_id_fk in ( select questionnaire_answer_header.questionnaire_answer_header_id 
                                  from questionnaire_answer_header 
                                  where module_item_key like '10960|%' -- Proposal number  NOTE: you can add prop_person_number after the | to get one persons answers
                                  and questionnaire_ref_id_fk in (select questionnaire.questionnaire_ref_id from questionnaire where name like '%Cert%'));
                                  
                                  
-- Pretty Query of Cert questions and answers for user
select people.proposal_number, name.first_nm || ' ' || name.last_nm as key_person, q.name, substr(question.question,1,50) || '...' as Question,answer.answer
from eps_prop_person people
    ,krim_entity_nm_t name
    ,questionnaire_answer_header ans_head
    ,questionnaire q
    ,questionnaire_questions q_quest
    ,question 
    ,questionnaire_answer answer
where proposal_number = '10960'
  and people.person_id = name.entity_id
  and ans_head.module_item_key = people.proposal_number || '|' || people.prop_person_number
  and q.questionnaire_ref_id = ans_head.questionnaire_ref_id_fk
  and q.name like '%Cert%'
  and q_quest.questionnaire_ref_id_fk = q.questionnaire_ref_id
  and q_quest.question_ref_id_fk = question.question_ref_id
  and answer.questionnaire_ah_id_fk = ans_head.questionnaire_answer_header_id
  and answer.question_ref_id_fk = question.question_ref_id
  --and answer.question_ref_id_fk = q_quest.question_ref_id_fk
  order by key_person,q_quest.questionnaire_questions_id
  ;
  
  

                                  
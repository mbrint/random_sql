select * from questionnaire where name = 'Certification Questionnaire' and sequence_number = 6;
select * from questionnaire where name = 'Proposal Questionnaire';


select * from questionnaire_answer_header where module_item_key like '9967%' and questionnaire_ref_id_fk in (select questionnaire.questionnaire_ref_id from questionnaire where name = 'Certification Questionnaire');

select * from questionnaire_answer
where questionnaire_ah_id_fk in ( select questionnaire_answer_header.questionnaire_answer_header_id from questionnaire_answer_header where module_item_key like '9967%' and questionnaire_ref_id_fk in (select questionnaire.questionnaire_ref_id from questionnaire where name = 'Certification Questionnaire'))
order by question_number;

select * from questionnaire_answer;

select * from questionnaire_questions where questionnaire_ref_id_fk in (select questionnaire_ref_id  from questionnaire where name = 'Certification Questionnaire' and sequence_number = 6) order by question_number;


select * from questionnaire_answer
where questionnaire_ah_id_fk in ( select questionnaire_answer_header.questionnaire_answer_header_id from questionnaire_answer_header where module_item_key like '10696%' and questionnaire_ref_id_fk in (select questionnaire.questionnaire_ref_id from questionnaire where name = 'Certification Questionnaire'))
order by question_number;

select * from questionnaire where questionnaire_id = '1000';

update questionnaire set is_final = 'Y'  where questionnaire_id = '1000' and sequence_number < 8;

select * from questionnaire_answer  
where questionnaire_ah_id_fk in ( select questionnaire_answer_header.questionnaire_answer_header_id 
                                  from questionnaire_answer_header 
                                  where module_item_key like '9967%' and 
                                  questionnaire_ref_id_fk in (select questionnaire.questionnaire_ref_id from questionnaire where name = 'UH Proposal Person Certification'))
order by question_number;
select * from questionnaire 
where update_user in ('mcmorimo','gouldner')
  and is_final = 'Y';

select u.*, q.name, q.sequence_number as questionnair_sequence_real 
from questionnaire_usage u, 
     questionnaire q
where q.questionnaire_ref_id = u.questionnaire_ref_id_fk
  and q.update_user in ('mcmorimo','gouldner')
  and is_final = 'Y';
  
--what did renee change
select * from question 
where question_ref_id in (select questionnaire_questions.question_ref_id_fk  
                          from questionnaire_questions 
                          where questionnaire_questions.questionnaire_ref_id_fk in (select questionnaire.questionnaire_ref_id 
                                                                                    from questionnaire
                                                                                    where update_user in ('mcmorimo','gouldner')
                                                                                    and is_final = 'Y'));

select * from question_explanation 
where question_ref_id_fk in (select questionnaire_questions.question_ref_id_fk 
                             from questionnaire_questions 
                             where questionnaire_questions.questionnaire_ref_id_fk in (select questionnaire.questionnaire_ref_id 
                                                                                       from questionnaire
                                                                                       where update_user in ('mcmorimo','gouldner')
                                                                                       and is_final = 'Y'));

select * from questionnaire_questions 
where questionnaire_questions.questionnaire_ref_id_fk in (select questionnaire_ref_id 
                                                          from questionnaire
                                                          where update_user in ('mcmorimo','gouldner')
                                                          and is_final = 'Y');

select * from questionnaire where update_user = 'MG511UPG';
update questionnaire set document_number = null where update_user = 'MG511UPG';
select * from questionnaire_usage where update_user = 'MG511UPG';
select * from question where update_user = 'MG511UPG';
select * from question_explanation where update_user = 'MG511UPG';
select * from questionnaire_questions where update_user = 'MG511UPG';

delete from questionnaire_usage where update_user = 'MG511UPG';
delete from question where update_user = 'MG511UPG';
delete from question_explanation where update_user = 'MG511UPG';
delete from questionnaire_questions where update_user = 'MG511UPG';
delete from questionnaire where update_user = 'MG511UPG';





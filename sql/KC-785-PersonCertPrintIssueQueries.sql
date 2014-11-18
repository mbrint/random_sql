select * from questionnaire where name like '%Cert%' and is_final = 'Y' ;

select * from questionnaire_questions where questionnaire_ref_id_fk = 224652;
select * from questionnaire_questions where questionnaire_ref_id_fk = 224598;

select * from question where question_ref_id in (select question_ref_id_fk from questionnaire_questions where questionnaire_ref_id_fk = 224598)
order by sequence_number;

select question_id,question,questionnaire_questions.*
from question q,
     questionnaire_questions
where question_ref_id = question_ref_id_fk
and questionnaire_ref_id_fk = 1235;

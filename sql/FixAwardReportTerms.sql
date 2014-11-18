create table award_report_terms_bk as
select * from award_report_terms
where award_number = '000000-00000';

select count(*) from award_report_terms_bk;

select a.award_number,t.award_number
from award_report_terms t,
     award a
where a.award_id = t.award_id
   and t.award_number = '000000-00000';
   
update award_report_terms art
set award_number = (select award_number from award where art.award_id = award.award_id)
where art.award_number = '000000-00000';

select a.award_number,t.award_number
from award_report_terms t,
     award a
where a.award_id = t.award_id
    and a.award_number != t.award_number;
    

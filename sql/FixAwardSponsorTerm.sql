
create table award_sponsor_term_bk as
select * from award_sponsor_term
where award_number = '000000-00000';

select count(*) from award_sponsor_term_bk;

--select a.award_number,t.award_number
select count(*)
from award_sponsor_term t,
     award a
where a.award_id = t.award_id
   and t.award_number = '000000-00000';
   
update award_sponsor_term art 
set award_number = (select award_number from award where art.award_id = award.award_id)
where art.award_number = '000000-00000';

--select a.award_number,t.award_number
select count(*)
from award_sponsor_term t,
     award a
where a.award_id = t.award_id
    and a.award_number != t.award_number;
    

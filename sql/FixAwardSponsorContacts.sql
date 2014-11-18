create table award_sponsor_contacts_bk as
select * from award_sponsor_contacts
where award_number = '000000-00000';

select count(*) from award_sponsor_contacts_bk;

select a.award_number,t.award_number
from award_sponsor_contacts t,
     award a
where a.award_id = t.award_id
   and t.award_number = '000000-00000';
   
update award_sponsor_contacts art 
set award_number = (select award_number from award where art.award_id = award.award_id)
where art.award_number = '000000-00000';

select a.award_number,t.award_number
from award_sponsor_contacts t,
     award a
where a.award_id = t.award_id
    and a.award_number != t.award_number;
    

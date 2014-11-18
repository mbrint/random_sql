create table award_persons_Money_bk as
select * from award_persons_Money_bk
where award_number = '000000-00000';

select count(*) from award_persons_bk;

select a.award_number,t.award_number
from award_persons t,
     award a
where a.award_id = t.award_id
    and a.award_number != t.award_number;
 
-- Needs evaluation to adjust money affect correctly  
--update award_persons art 
--set award_number = (select award_number from award where art.award_id = award.award_id)
--where art.award_number = '000000-00000';


    

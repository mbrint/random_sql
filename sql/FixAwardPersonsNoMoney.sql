--drop table  award_persons_nomoney_bk;

create table award_persons_nomoney_bk as
select * from award_persons
where award_id in 
(
Select  a.Award_ID
  From  Award  a
 Where  a.Award_id in
     ( Select  aa.Award_ID
         From  Award  aa
        Where  aa.Award_id in (Select  ap.Award_ID 
                                              from  Award_persons ap
                                          Where  ap.Award_Number like '000000-%')
      )
   and a.Award_id not in 
     ( Select  t.Award_ID
         From  Award_Transaction_Summ_View t
        Where  t.Award_id in (Select  app.Award_ID 
                                           from  Award_persons app
                                        Where  app.Award_Number like '000000-%') 
          AND  t.Obligated_Change <> 0
      ) 
);

grant select on award_persons_nomoney_bk to mg_report;


select * from award_persons_nomoney_bk;
select count(*) from award_persons_nomoney_bk;
select count(unique award_id) from award_persons_nomoney_bk;


select a.award_number,t.award_number
from award_persons t,
     award a
where a.award_id = t.award_id
    --and a.award_number != t.award_number
    and t.award_id in (select unique award_id from award_persons_nomoney_bk);
   
update award_persons art 
set award_number = (select award_number from award where art.award_id = award.award_id)
where art.award_id in (select unique award_id from award_persons_nomoney_bk);


    

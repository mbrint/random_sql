--drop table award_custom_data_nomoney_bk;

create table award_custom_data_nomoney_bk as
select * from award_custom_data
where award_id in 
(
    Select  a.Award_ID
  From  Award  a
 Where  a.Award_id in
     ( Select  aa.Award_ID
         From  Award  aa
        Where  aa.Award_id in (Select  ac.Award_ID 
                         from  Award_Custom_Data ac
                        Where  ac.Award_Number like '000000-%' 
                          and  ac.custom_attribute_id = 103 )
      )
   and a.Award_id not in 
     ( Select  t.Award_ID
         From  Award_Transaction_Summ_View t
        Where  t.Award_id in (Select  acc.Award_ID 
                         from  Award_Custom_Data acc
                        Where  acc.Award_Number like '000000-%' 
                          and  acc.custom_attribute_id = 103 )
          AND  t.Obligated_Change <> 0
      )
);

grant select on award_custom_data_nomoney_bk to mg_report;


select * from award_custom_data_nomoney_bk;
select count(*) from award_custom_data_nomoney_bk;
select count(unique award_id) from award_custom_data_nomoney_bk;

select a.award_number,t.award_number
from award_custom_data t,
     award a
where a.award_id = t.award_id
    --and a.award_number != t.award_number
    and t.award_id in (select unique award_id from award_custom_data_nomoney_bk);
   
update award_custom_data art 
set award_number = (select award_number from award where art.award_id = award.award_id)
where art.award_id in (select unique award_id from award_custom_data_nomoney_bk);


    

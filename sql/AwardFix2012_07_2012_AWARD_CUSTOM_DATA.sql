
Select  award_id,award_number, sum(obligated_change) Money,max(update_timestamp)timestamp
From  mgprod.Award_Transaction_Summ_View t 
Where  t.Award_id in (Select  ac.Award_ID 
                      from  mgprod.Award_Custom_Data ac
                      Where  ac.Award_Number like '000000-%' 
                        and  ac.custom_attribute_id = 103 )
   AND Obligated_Change <> 0
group by award_id,award_number
Order by timestamp
;

--Select  unique(award_number)
-- From Gang
select t.*
From  mgprod.Award_Transaction_Summ_View t  
Where  t.Award_id in (Select  ac.Award_ID 
                      from   mgprod.Award_Custom_Data ac
                      Where  ac.Award_Number like '000000-%' 
                       and  ac.custom_attribute_id = 103 )
  AND Obligated_Change <> 0
  order by award_number
  ;
  
Select ac.AWARD_NUMBER
from   mgprod.Award_Custom_Data ac
Where  ac.Award_Number like '000000-%' 
  and  ac.custom_attribute_id = 103;

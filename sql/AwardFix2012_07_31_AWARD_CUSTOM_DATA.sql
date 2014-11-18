
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
  
Select ac.AWARD_NUMBER,award_id
from   mgprod.Award_Custom_Data ac
Where  ac.Award_Number like '000000-%' 
  and  ac.custom_attribute_id = 103;

-- backup
create table award_custom_data_fix_2012_08
as select * from award_custom_data
where award_number = '000000-00000';

select * from award_custom_data_fix_2012_08;
select unique(award_id) from award_custom_data_fix_2012_08;


create table award_amount_transaction_bk_08
as 
SELECT *
FROM award_amount_transaction aa
WHERE aa.Transaction_ID IN (5470, 4531, 5134, 9949, 10994, 11282, 8651, 11483, 11918
                           ,12427, 11132, 7182, 11971, 11502, 9868, 9506, 13441, 14340
                           ,14269, 7735, 12278, 12338, 9737, 10025, 16055, 12203
                           ,10804, 10797, 10810, 8130, 16589, 12356, 15618, 8302, 13414,13432 )
AND Award_Number NOT LIKE '%-00000'
and Update_Timestamp < '01-MAR-12';

select * from award_amount_transaction_bk_08;

grant select on award_custom_data_fix_2012_08 to mg_report;
grant select on award_amount_transaction_bk_08 to mg_report;


-- Fix all award_custom_data  
update award_custom_data a 
SET award_number = (SELECT award_number FROM award B WHERE A.award_id = B.award_id)
where award_number = '000000-00000';

update award_amount_transaction
set Update_Timestamp = '02-Apr 2012'
WHERE Transaction_ID IN (4531,5134,5470,7182,8651,9506,9868,9949,10994,11132,11282,11483,11502,11918,11971,12427,13441,14269,14340)
AND Award_Number NOT LIKE '%-00000'
and Update_Timestamp < '01-MAR-12'
;
  
select count(*) from award_amount_transaction where award_number = '000000-00000';

-- Check results
SELECT aa.Transaction_ID,aa.Award_Number, aa.Update_Timestamp, aa.Transaction_ID, aa.Transaction_Type_Code
FROM award_amount_transaction aa
WHERE aa.Transaction_ID IN (5470, 4531, 5134, 9949, 10994, 11282, 8651, 11483, 11918
                           ,12427, 11132, 7182, 11971, 11502, 9868, 9506, 13441, 14340
                           ,14269, 7735, 12278, 12338, 9737, 10025, 16055, 12203
                           ,10804, 10797, 10810, 8130, 16589, 12356, 15618, 8302, 13414,13432 )
AND Award_Number NOT LIKE '%-00000'
ORDER BY 3,2 
;






--  OLD WAY  *********************************************
--  OLD WAY  *********************************************
--  OLD WAY  *********************************************



--Adjust timestamps on certain awards
update  award_amount_transaction
set update_timestamp = '2-Apr-2012'
where award_number in ('001154-00001','001037-00001','001111-00001');

update  award_amount_transaction
set update_timestamp = '3-Apr-2012'
where award_number in ('001703-00001','001796-00001','001820-00001','001551-00001','001834-00001',
                       '001855-00001','001249-00001','001804-00001','001974-00001','002018-00001');
update  award_amount_transaction
set update_timestamp = '4-Apr-2012'
where award_number in ('001370-00001');
update  award_amount_transaction
set update_timestamp = '5-Apr-2012'
where award_number in ('001864-00001','001840-00001','002019-00001');
update  award_amount_transaction
set update_timestamp = '6-Apr-2012'
where award_number in ('001695-00001','001656-00001');

select award_number,update_timestamp
from award_amount_transaction
where award_number in ('001154-00001','001037-00001','001111-00001','001703-00001','001796-00001','001820-00001','001551-00001','001834-00001',
                       '001855-00001','001249-00001','001804-00001','001974-00001','002018-00001','001370-00001',
                       '001864-00001','001840-00001','002019-00001','001695-00001','001656-00001')
order by update_timestamp,award_number;

select  *
from award_amount_transaction aat
where award_number like '001154-%';

'001037-00001','001111-00001','001703-00001','001796-00001','001820-00001','001551-00001','001834-00001',
                       '001855-00001','001249-00001','001804-00001','001974-00001','002018-00001','001370-00001',
                       '001864-00001','001840-00001','002019-00001','001695-00001','001656-00001')
order by update_timestamp,award_number;
  
  

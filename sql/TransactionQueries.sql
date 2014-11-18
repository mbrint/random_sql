select * from award where award_number like '001030-00001';

select * from award_amount_info
where award_number like '001030-00001';

select * from award_amount_transaction
where award_number like '001030-00001';

select transaction_id,count(*) from award_amount_transaction group by transaction_id having count(*) > 1;

select * from transaction_details
where award_number like '001030-00001';

select * from time_and_money_document
where award_number like '001030-%';

select *
from award_amount_info aa, 
     award_amount_transaction at
where  aa.tnm_document_number = at.transaction_Id
  and  aa.award_number like '001030-00001';
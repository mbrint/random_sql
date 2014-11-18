-- change transaction type from 16 to 9
update award_amount_transaction
set transaction_type_code = 9
where transaction_id = 60075 ;


select transaction_type_code
from award_amount_transaction
where transaction_id = 60075 ;
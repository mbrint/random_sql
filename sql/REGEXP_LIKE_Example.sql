-- Select target data from award_amount_transaction
select *
from award_amount_transaction
where  REGEXP_LIKE (award_number,'001037-0000[0-9]')
order by award_number,transaction_id;
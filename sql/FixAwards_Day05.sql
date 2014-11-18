-- Fix Awards Day 5
select a.award_number,
       d.award_number ,a.award_id,d.award_id
from award a,
    award_custom_data d
where a.award_id = d.award_id
  and a.award_number in (
'002029-00001','001829-00001','002271-00001','001955-00001','001216-00001','001354-00001','001920-00001','001501-00001','001706-00001','001665-00001','001919-00001','001827-00001','001736-00001','002142-00001','001797-00001'
);
update award_custom_data a 
SET award_number = (SELECT award_number FROM award B WHERE A.award_id = B.award_id)
where a.award_id in (select award_id from award a where a.award_number in (
'002029-00001','001829-00001','002271-00001','001955-00001','001216-00001','001354-00001','001920-00001','001501-00001','001706-00001','001665-00001','001919-00001','001827-00001','001736-00001','002142-00001','001797-00001'
));

select * from award_amount_transaction
where REGEXP_LIKE(award_number,
'002029-.*|001829-.*|002271-.*|001955-.*|001216-.*|001354-.*|001920-.*|001501-.*|001706-.*|001665-.*|001919-.*|001827-.*|001736-.*|002142-.*|001797-.*'
);

select award_number,update_timestamp,sum(obligated_change),'Y' AFFECTS_DAILY_CHECK
from award_transaction_summ_view
where update_timestamp < '01 Feb 2012'
and award_number in (
'002029-00001','001829-00001','002271-00001','001955-00001','001216-00001','001354-00001','001920-00001','001501-00001','001706-00001','001665-00001','001919-00001','001827-00001','001736-00001','002142-00001','001797-00001'
)
group by award_number,update_timestamp
union
select award_number,update_timestamp,sum(obligated_change),'N' AFFECTS_DAILY_CHECK
from award_transaction_summ_view
where update_timestamp >= '01 Feb 2012'
and award_number in (
'002029-00001','001829-00001','002271-00001','001955-00001','001216-00001','001354-00001','001920-00001','001501-00001','001706-00001','001665-00001','001919-00001','001827-00001','001736-00001','002142-00001','001797-00001'
)
group by award_number,update_timestamp
order by AFFECTS_DAILY_CHECK desc,award_number,update_timestamp;

update  award_amount_transaction
set update_timestamp = current_date
where REGEXP_LIKE(award_number,
'002029-.*|001829-.*|002271-.*|001955-.*|001216-.*|001354-.*|001920-.*|001501-.*|001706-.*|001665-.*|001919-.*|001827-.*|001736-.*|002142-.*|001797-.*'
);

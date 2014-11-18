-- Fix Awards Day 7
select a.award_number,
       d.award_number ,a.award_id,d.award_id
from award a,
    award_custom_data d
where a.award_id = d.award_id
  and a.award_number in (
'002033-00001','001464-00001','002015-00001','001650-00001','001742-00001','002035-00001','001728-00001','001238-00001','001460-00001','002053-00001','001781-00001','001723-00001','002008-00001','002055-00001','002020-00001'
);
update award_custom_data a 
SET award_number = (SELECT award_number FROM award B WHERE A.award_id = B.award_id)
where a.award_id in (select award_id from award a where a.award_number in (
'002033-00001','001464-00001','002015-00001','001650-00001','001742-00001','002035-00001','001728-00001','001238-00001','001460-00001','002053-00001','001781-00001','001723-00001','002008-00001','002055-00001','002020-00001'
));

select * from award_amount_transaction
where REGEXP_LIKE(award_number,
'002033-.*|001464-.*|002015-.*|001650-.*|001742-.*|002035-.*|001728-.*|001238-.*|001460-.*|002053-.*|001781-.*|001723-.*|002008-.*|002055-.*|002020-.*'
);

select award_number,update_timestamp,sum(obligated_change),'Y' AFFECTS_DAILY_CHECK
from award_transaction_summ_view
where update_timestamp < '01 Feb 2012'
and award_number in (
'002033-00001','001464-00001','002015-00001','001650-00001','001742-00001','002035-00001','001728-00001','001238-00001','001460-00001','002053-00001','001781-00001','001723-00001','002008-00001','002055-00001','002020-00001'
)
group by award_number,update_timestamp
union
select award_number,update_timestamp,sum(obligated_change),'N' AFFECTS_DAILY_CHECK
from award_transaction_summ_view
where update_timestamp >= '01 Feb 2012'
and award_number in (
'002033-00001','001464-00001','002015-00001','001650-00001','001742-00001','002035-00001','001728-00001','001238-00001','001460-00001','002053-00001','001781-00001','001723-00001','002008-00001','002055-00001','002020-00001'
)
group by award_number,update_timestamp
order by AFFECTS_DAILY_CHECK desc,award_number,update_timestamp;

update  award_amount_transaction
set update_timestamp = current_date
where REGEXP_LIKE(award_number,
'002033-.*|001464-.*|002015-.*|001650-.*|001742-.*|002035-.*|001728-.*|001238-.*|001460-.*|002053-.*|001781-.*|001723-.*|002008-.*|002055-.*|002020-.*'
);

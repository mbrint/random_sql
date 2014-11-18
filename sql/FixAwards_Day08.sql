-- Fix Awards Day 8
select a.award_number,
       d.award_number ,a.award_id,d.award_id
from award a,
    award_custom_data d
where a.award_id = d.award_id
  and a.award_number in (
'001909-00001','002266-00001','002134-00001','001962-00001','001282-00001','001802-00001','001975-00001','002186-00001','001137-00001','001435-00001','002166-00001','001911-00001','001985-00001','001732-00001','001494-00001'
);
update award_custom_data a 
SET award_number = (SELECT award_number FROM award B WHERE A.award_id = B.award_id)
where a.award_id in (select award_id from award a where a.award_number in (
'001909-00001','002266-00001','002134-00001','001962-00001','001282-00001','001802-00001','001975-00001','002186-00001','001137-00001','001435-00001','002166-00001','001911-00001','001985-00001','001732-00001','001494-00001'
));

select * from award_amount_transaction
where REGEXP_LIKE(award_number,
'001909-.*|002266-.*|002134-.*|001962-.*|001282-.*|001802-.*|001975-.*|002186-.*|001137-.*|001435-.*|002166-.*|001911-.*|001985-.*|001732-.*|001494-.*'
);

select award_number,update_timestamp,sum(obligated_change),'Y' AFFECTS_DAILY_CHECK
from award_transaction_summ_view
where update_timestamp < '01 Feb 2012'
and award_number in (
'001909-00001','002266-00001','002134-00001','001962-00001','001282-00001','001802-00001','001975-00001','002186-00001','001137-00001','001435-00001','002166-00001','001911-00001','001985-00001','001732-00001','001494-00001'
)
group by award_number,update_timestamp
union
select award_number,update_timestamp,sum(obligated_change),'N' AFFECTS_DAILY_CHECK
from award_transaction_summ_view
where update_timestamp >= '01 Feb 2012'
and award_number in (
'001909-00001','002266-00001','002134-00001','001962-00001','001282-00001','001802-00001','001975-00001','002186-00001','001137-00001','001435-00001','002166-00001','001911-00001','001985-00001','001732-00001','001494-00001'
)
group by award_number,update_timestamp
order by AFFECTS_DAILY_CHECK desc,award_number,update_timestamp;

update  award_amount_transaction
set update_timestamp = current_date
where REGEXP_LIKE(award_number,
'001909-.*|002266-.*|002134-.*|001962-.*|001282-.*|001802-.*|001975-.*|002186-.*|001137-.*|001435-.*|002166-.*|001911-.*|001985-.*|001732-.*|001494-.*'
);

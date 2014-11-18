-- Fix Awards Day 10
select a.award_number,
       d.award_number ,a.award_id,d.award_id
from award a,
    award_custom_data d
where a.award_id = d.award_id
  and a.award_number in (
'001648-00001','002190-00001','001071-00001','001903-00001','001749-00001','001567-00001','001461-00001','001271-00001','001956-00001','002049-00001','001948-00001','001689-00001','001465-00001','001809-00001','002286-00001'
);
update award_custom_data a 
SET award_number = (SELECT award_number FROM award B WHERE A.award_id = B.award_id)
where a.award_id in (select award_id from award a where a.award_number in (
'001648-00001','002190-00001','001071-00001','001903-00001','001749-00001','001567-00001','001461-00001','001271-00001','001956-00001','002049-00001','001948-00001','001689-00001','001465-00001','001809-00001','002286-00001'
));

select * from award_amount_transaction
where REGEXP_LIKE(award_number,
'001648-.*|002190-.*|001071-.*|001903-.*|001749-.*|001567-.*|001461-.*|001271-.*|001956-.*|002049-.*|001948-.*|001689-.*|001465-.*|001809-.*|002286-.*'
);

select award_number,update_timestamp,sum(obligated_change),'Y' AFFECTS_DAILY_CHECK
from award_transaction_summ_view
where update_timestamp < '01 Feb 2012'
and award_number in (
'001648-00001','002190-00001','001071-00001','001903-00001','001749-00001','001567-00001','001461-00001','001271-00001','001956-00001','002049-00001','001948-00001','001689-00001','001465-00001','001809-00001','002286-00001'
)
group by award_number,update_timestamp
union
select award_number,update_timestamp,sum(obligated_change),'N' AFFECTS_DAILY_CHECK
from award_transaction_summ_view
where update_timestamp >= '01 Feb 2012'
and award_number in (
'001648-00001','002190-00001','001071-00001','001903-00001','001749-00001','001567-00001','001461-00001','001271-00001','001956-00001','002049-00001','001948-00001','001689-00001','001465-00001','001809-00001','002286-00001'
)
group by award_number,update_timestamp
order by AFFECTS_DAILY_CHECK desc,award_number,update_timestamp;

update  award_amount_transaction
set update_timestamp = current_date
where REGEXP_LIKE(award_number,
'001648-.*|002190-.*|001071-.*|001903-.*|001749-.*|001567-.*|001461-.*|001271-.*|001956-.*|002049-.*|001948-.*|001689-.*|001465-.*|001809-.*|002286-.*'
);

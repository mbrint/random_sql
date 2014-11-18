-- Fix Awards Day 3
select a.award_number,
       d.award_number ,a.award_id,d.award_id
from award a,
    award_custom_data d
where a.award_id = d.award_id
  and a.award_number in (
'001906-00001','001784-00001','001830-00001','001821-00001','001750-00001','001522-00001','002198-00001','001221-00001','001565-00001','001644-00001','001349-00001','001856-00001','001961-00001','001445-00001','001963-00001'
);
update award_custom_data a 
SET award_number = (SELECT award_number FROM award B WHERE A.award_id = B.award_id)
where a.award_id in (select award_id from award a where a.award_number in (
'001906-00001','001784-00001','001830-00001','001821-00001','001750-00001','001522-00001','002198-00001','001221-00001','001565-00001','001644-00001','001349-00001','001856-00001','001961-00001','001445-00001','001963-00001'
));

select * from award_amount_transaction
where REGEXP_LIKE(award_number,
'001906-.*|001784-.*|001830-.*|001821-.*|001750-.*|001522-.*|002198-.*|001221-.*|001565-.*|001644-.*|001349-.*|001856-.*|001961-.*|001445-.*|001963-.*'
);

select award_number,update_timestamp,sum(obligated_change),'Y' AFFECTS_DAILY_CHECK
from award_transaction_summ_view
where update_timestamp < '01 Feb 2012'
and award_number in (
'001906-00001','001784-00001','001830-00001','001821-00001','001750-00001','001522-00001','002198-00001','001221-00001','001565-00001','001644-00001','001349-00001','001856-00001','001961-00001','001445-00001','001963-00001'
)
group by award_number,update_timestamp
union
select award_number,update_timestamp,sum(obligated_change),'N' AFFECTS_DAILY_CHECK
from award_transaction_summ_view
where update_timestamp >= '01 Feb 2012'
and award_number in (
'001906-00001','001784-00001','001830-00001','001821-00001','001750-00001','001522-00001','002198-00001','001221-00001','001565-00001','001644-00001','001349-00001','001856-00001','001961-00001','001445-00001','001963-00001'
)
group by award_number,update_timestamp
order by AFFECTS_DAILY_CHECK desc,award_number,update_timestamp;

update  award_amount_transaction
set update_timestamp = current_date
where REGEXP_LIKE(award_number,
'001906-.*|001784-.*|001830-.*|001821-.*|001750-.*|001522-.*|002198-.*|001221-.*|001565-.*|001644-.*|001349-.*|001856-.*|001961-.*|001445-.*|001963-.*'
);

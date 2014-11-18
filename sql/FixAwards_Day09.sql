-- Fix Awards Day 9
select a.award_number,
       d.award_number ,a.award_id,d.award_id
from award a,
    award_custom_data d
where a.award_id = d.award_id
  and a.award_number in (
'001467-00001','001654-00001','002158-00001','001674-00001','001839-00001','001769-00001','002026-00001','001841-00001','002253-00001','002128-00001','002059-00001','002113-00001','001731-00001','001878-00001','001126-00001'
);
update award_custom_data a 
SET award_number = (SELECT award_number FROM award B WHERE A.award_id = B.award_id)
where a.award_id in (select award_id from award a where a.award_number in (
'001467-00001','001654-00001','002158-00001','001674-00001','001839-00001','001769-00001','002026-00001','001841-00001','002253-00001','002128-00001','002059-00001','002113-00001','001731-00001','001878-00001','001126-00001'
));

select * from award_amount_transaction
where REGEXP_LIKE(award_number,
'001467-.*|001654-.*|002158-.*|001674-.*|001839-.*|001769-.*|002026-.*|001841-.*|002253-.*|002128-.*|002059-.*|002113-.*|001731-.*|001878-.*|001126-.*'
);

select award_number,update_timestamp,sum(obligated_change),'Y' AFFECTS_DAILY_CHECK
from award_transaction_summ_view
where update_timestamp < '01 Feb 2012'
and award_number in (
'001467-00001','001654-00001','002158-00001','001674-00001','001839-00001','001769-00001','002026-00001','001841-00001','002253-00001','002128-00001','002059-00001','002113-00001','001731-00001','001878-00001','001126-00001'
)
group by award_number,update_timestamp
union
select award_number,update_timestamp,sum(obligated_change),'N' AFFECTS_DAILY_CHECK
from award_transaction_summ_view
where update_timestamp >= '01 Feb 2012'
and award_number in (
'001467-00001','001654-00001','002158-00001','001674-00001','001839-00001','001769-00001','002026-00001','001841-00001','002253-00001','002128-00001','002059-00001','002113-00001','001731-00001','001878-00001','001126-00001'
)
group by award_number,update_timestamp
order by AFFECTS_DAILY_CHECK desc,award_number,update_timestamp;

update  award_amount_transaction
set update_timestamp = current_date
where REGEXP_LIKE(award_number,
'001467-.*|001654-.*|002158-.*|001674-.*|001839-.*|001769-.*|002026-.*|001841-.*|002253-.*|002128-.*|002059-.*|002113-.*|001731-.*|001878-.*|001126-.*'
);

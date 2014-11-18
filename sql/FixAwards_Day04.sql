-- Fix Awards Day 4
select a.award_number,
       d.award_number ,a.award_id,d.award_id
from award a,
    award_custom_data d
where a.award_id = d.award_id
  and a.award_number in (
'001907-00001','002174-00001','002251-00001','002280-00001','001456-00001','001944-00001','001758-00001','001403-00001','001966-00001','001850-00001','001811-00001','001705-00001','001833-00001','001916-00001','001498-00001'
);
update award_custom_data a 
SET award_number = (SELECT award_number FROM award B WHERE A.award_id = B.award_id)
where a.award_id in (select award_id from award a where a.award_number in (
'001907-00001','002174-00001','002251-00001','002280-00001','001456-00001','001944-00001','001758-00001','001403-00001','001966-00001','001850-00001','001811-00001','001705-00001','001833-00001','001916-00001','001498-00001'
));

select * from award_amount_transaction
where REGEXP_LIKE(award_number,
'001907-.*|002174-.*|002251-.*|002280-.*|001456-.*|001944-.*|001758-.*|001403-.*|001966-.*|001850-.*|001811-.*|001705-.*|001833-.*|001916-.*|001498-.*'
);

select award_number,update_timestamp,sum(obligated_change),'Y' AFFECTS_DAILY_CHECK
from award_transaction_summ_view
where update_timestamp < '01 Feb 2012'
and award_number in (
'001907-00001','002174-00001','002251-00001','002280-00001','001456-00001','001944-00001','001758-00001','001403-00001','001966-00001','001850-00001','001811-00001','001705-00001','001833-00001','001916-00001','001498-00001'
)
group by award_number,update_timestamp
union
select award_number,update_timestamp,sum(obligated_change),'N' AFFECTS_DAILY_CHECK
from award_transaction_summ_view
where update_timestamp >= '01 Feb 2012'
and award_number in (
'001907-00001','002174-00001','002251-00001','002280-00001','001456-00001','001944-00001','001758-00001','001403-00001','001966-00001','001850-00001','001811-00001','001705-00001','001833-00001','001916-00001','001498-00001'
)
group by award_number,update_timestamp
order by AFFECTS_DAILY_CHECK desc,award_number,update_timestamp;

update  award_amount_transaction
set update_timestamp = current_date
where REGEXP_LIKE(award_number,
'001907-.*|002174-.*|002251-.*|002280-.*|001456-.*|001944-.*|001758-.*|001403-.*|001966-.*|001850-.*|001811-.*|001705-.*|001833-.*|001916-.*|001498-.*'
);

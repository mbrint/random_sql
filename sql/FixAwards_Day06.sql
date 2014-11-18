-- Fix Awards Day 6
select a.award_number,
       d.award_number ,a.award_id,d.award_id
from award a,
    award_custom_data d
where a.award_id = d.award_id
  and a.award_number in (
'001302-00001','002172-00001','002171-00001','001845-00001','001448-00001','002207-00001','002262-00001','002115-00001','001991-00001','001978-00001','001813-00001','002105-00001','002078-00001','001308-00001','001794-00001'
);
update award_custom_data a 
SET award_number = (SELECT award_number FROM award B WHERE A.award_id = B.award_id)
where a.award_id in (select award_id from award a where a.award_number in (
'001302-00001','002172-00001','002171-00001','001845-00001','001448-00001','002207-00001','002262-00001','002115-00001','001991-00001','001978-00001','001813-00001','002105-00001','002078-00001','001308-00001','001794-00001'
));

select * from award_amount_transaction
where REGEXP_LIKE(award_number,
'001302-.*|002172-.*|002171-.*|001845-.*|001448-.*|002207-.*|002262-.*|002115-.*|001991-.*|001978-.*|001813-.*|002105-.*|002078-.*|001308-.*|001794-.*'
);

select award_number,update_timestamp,sum(obligated_change),'Y' AFFECTS_DAILY_CHECK
from award_transaction_summ_view
where update_timestamp < '01 Feb 2012'
and award_number in (
'001302-00001','002172-00001','002171-00001','001845-00001','001448-00001','002207-00001','002262-00001','002115-00001','001991-00001','001978-00001','001813-00001','002105-00001','002078-00001','001308-00001','001794-00001'
)
group by award_number,update_timestamp
union
select award_number,update_timestamp,sum(obligated_change),'N' AFFECTS_DAILY_CHECK
from award_transaction_summ_view
where update_timestamp >= '01 Feb 2012'
and award_number in (
'001302-00001','002172-00001','002171-00001','001845-00001','001448-00001','002207-00001','002262-00001','002115-00001','001991-00001','001978-00001','001813-00001','002105-00001','002078-00001','001308-00001','001794-00001'
)
group by award_number,update_timestamp
order by AFFECTS_DAILY_CHECK desc,award_number,update_timestamp;

update  award_amount_transaction
set update_timestamp = current_date
where REGEXP_LIKE(award_number,
'001302-.*|002172-.*|002171-.*|001845-.*|001448-.*|002207-.*|002262-.*|002115-.*|001991-.*|001978-.*|001813-.*|002105-.*|002078-.*|001308-.*|001794-.*'
);

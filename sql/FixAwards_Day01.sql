-- Award Fix Day 1
--  Update award_custom_data with correct award_number
update award_custom_data a 
SET award_number = (SELECT award_number FROM award B WHERE A.award_id = B.award_id)
where award_id in (select award_id from award a where a.award_number in ('002161-00001'));

update  award_amount_transaction
set update_timestamp = current_date
where award_number like '002161-%';

select * from award_amount_transaction
where award_number like '002161-%';

select * from award_custom_data
where award_id in (select award_id from award a where a.award_number in ('002161-00001'));

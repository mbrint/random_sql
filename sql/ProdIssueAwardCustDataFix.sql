-- Strings for update
-- Day    Query
-- 2   '001566-00001','001536-00001','001657-00001','001552-00001','001740-00001','001905-00001','001561-00001','001823-00001','001340-00001','002151-00001','001890-00001','001041-00001','001967-00001','001828-00001','001990-00001'
-- 3   '001906-00001','001784-00001','001830-00001','001821-00001','001750-00001','001522-00001','002198-00001','001221-00001','001565-00001','001644-00001','001349-00001','001856-00001','001961-00001','001445-00001','001963-00001'
-- 4   '001907-00001','002174-00001','002251-00001','002280-00001','001456-00001','001944-00001','001758-00001','001403-00001','001966-00001','001850-00001','001811-00001','001705-00001','001833-00001','001916-00001','001498-00001'
-- 5   '002029-00001','001829-00001','002271-00001','001955-00001','001216-00001','001354-00001','001920-00001','001501-00001','001706-00001','001665-00001','001919-00001','001827-00001','001736-00001','002142-00001','001797-00001'
-- 6   '001302-00001','002172-00001','002171-00001','001845-00001','001448-00001','002207-00001','002262-00001','002115-00001','001991-00001','001978-00001','001813-00001','002105-00001','002078-00001','001308-00001','001794-00001'
-- 7   '002033-00001','001464-00001','002015-00001','001650-00001','001742-00001','002035-00001','001728-00001','001238-00001','001460-00001','002053-00001','001781-00001','001723-00001','002008-00001','002055-00001','002020-00001'
-- 8   '001909-00001','002266-00001','002134-00001','001962-00001','001282-00001','001802-00001','001975-00001','002186-00001','001137-00001','001435-00001','002166-00001','001911-00001','001985-00001','001732-00001','001494-00001'
-- 9   '001467-00001','001654-00001','002158-00001','001674-00001','001839-00001','001769-00001','002026-00001','001841-00001','002253-00001','002128-00001','002059-00001','002113-00001','001731-00001','001878-00001','001126-00001'
-- 10  '001648-00001','002190-00001','001071-00001','001903-00001','001749-00001','001567-00001','001461-00001','001271-00001','001956-00001','002049-00001','001948-00001','001689-00001','001465-00001','001809-00001','002286-00001'

-- Select target award_custom_data
select a.award_number,
       d.award_number ,a.award_id,d.award_id
from award a,
     award_custom_data d
where a.award_id = d.award_id
  and a.award_number in ('002161-00001');
  
--  Update award_custom_data with correct award_number
update award_custom_data a 
SET award_number = (SELECT award_number FROM award B WHERE A.award_id = B.award_id)
where award_id in (select award_id from award a where a.award_number in ('002161-00001'));

-- Select target data from award_amount_transaction
-- Note this query returned 0 rows for '002257-00001' sample.
-- Does this mean nothing on report ?
-- Some things to test
--   1) update the timestamp...make sure award can still be opened and edited/copied
--   2) check that it shows up in the report
select ti.obligated_change,t.award_number,t.update_timestamp,t.transaction_type_code,t.transaction_id
from award_amount_transaction t,
     award_amount_info ti
where t.award_number = ti.award_number
  and t.transaction_id = ti.tnm_document_number
  and t.award_number like '002161-%';
  
   
update  award_amount_transaction
set update_timestamp = current_date
where award_number like '002161-%';

select * from award_amount_transaction
where REGEXP_LIKE(award_number, '001566-.*|001536-.*');

select unique substr(award_number,1,6) base from award_amount_transaction
where REGEXP_LIKE(award_number,
'001566-.*|001536-.*|001657-.*|001552-.*|001740-.*|001905-.*|001561-.*|001823-.*|001340-.*|002151-.*|001890-.*|001041-.*|001967-.*|001828-.*|001990-.*'
) order by base;

  
select *
from award_transaction_summ_view
where award_number like '002161-%';

select *
from award_transaction_summ_view
where award_number like '002310-%';

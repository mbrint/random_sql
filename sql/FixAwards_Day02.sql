-- Fix Awards Day 2
select a.award_number,
       d.award_number ,a.award_id,d.award_id
from award a,
    award_custom_data d
where a.award_id = d.award_id
  and a.award_number in (
'001566-00001','001536-00001','001657-00001','001552-00001','001740-00001','001905-00001','001561-00001','001823-00001','001340-00001','002151-00001','001890-00001','001041-00001','001967-00001','001828-00001','001990-00001'
);
update award_custom_data a 
SET award_number = (SELECT award_number FROM award B WHERE A.award_id = B.award_id)
where a.award_id in (select award_id from award a where a.award_number in (
'001566-00001','001536-00001','001657-00001','001552-00001','001740-00001','001905-00001','001561-00001','001823-00001','001340-00001','002151-00001','001890-00001','001041-00001','001967-00001','001828-00001','001990-00001'
));

select * from award_amount_transaction
where REGEXP_LIKE(award_number,
'001566-.*|001536-.*|001657-.*|001552-.*|001740-.*|001905-.*|001561-.*|001823-.*|001340-.*|002151-.*|001890-.*|001041-.*|001967-.*|001828-.*|001990-.*'
);

update  award_amount_transaction
set update_timestamp = current_date
where REGEXP_LIKE(award_number,
'001566-.*|001536-.*|001657-.*|001552-.*|001740-.*|001905-.*|001561-.*|001823-.*|001340-.*|002151-.*|001890-.*|001041-.*|001967-.*|001828-.*|001990-.*'
);

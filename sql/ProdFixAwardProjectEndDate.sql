
create table award_amount_info_bk as (
select * from award_amount_info where award_number like '001056-%');

select * from award_amount_info where award_number like '001056-%';

update award_amount_info 
set obligation_expiration_date = '31-JAN-14'
where award_number like '001056-%'
and obligation_expiration_date != '31-JAN-14';

update award_amount_info 
set final_expiration_date = '31-JAN-14'
where award_number like '001056-%'
and final_expiration_date != '31-JAN-14';
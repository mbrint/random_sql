select count(*)  from award_amount_transaction  where award_number <> '000000-00000';

select count(*) from time_and_money_document where award_number <>  '000000-00000' ;



select count(*)  from award_amount_info  where obligated_change <> 0 and award_number like '%-00001';


select grouping(g.description), g.description,count(*)
from award_amount_transaction t,
     award_transaction_type g
where t.transaction_type_code = g.award_transaction_type_code (+)
  and award_number <> '000000-00000'
group by rollup(description);

select count(*) from award_amount_info;

select * from award_amount_transaction;

select * from award_amount_transaction where transaction_type_code is null;
(select award_transaction_type_code is null;

from award_transaction_type);
select * from award_transaction_type_code;

select * from award_transaction_type;

select count(*) from time_and_money_document;

select max(transactions),Min(transactions),avg(transactions)
from
(
select a.award_number,count(*) transactions
from time_and_money_document t,
     award_amount_transaction a
where a.award_number = t.award_number
  and a.transaction_id = t.document_number
group by a.award_number
)x;


select grouping(g.description), g.description,count(*),  to_char(sum(i.obligated_change),'$999,999,999,999.99')
from award_amount_transaction t,
     award_transaction_type g,
     award_amount_info i
where t.transaction_type_code = g.award_transaction_type_code (+)
  and t.award_number <> '000000-00000'
  and i.tnm_document_number = t.transaction_id
group by rollup(description);

select  t.award_number , i.obligated_change, description, g.award_transaction_type_code
from award_amount_transaction t,
     award_transaction_type g,
     award_amount_info i
where t.transaction_type_code = g.award_transaction_type_code 
  and t.award_number <> '000000-00000'
  and i.tnm_document_number = t.transaction_id
  and i.award_number = t.award_number
  and g.award_transaction_type_code in (7,14)
  and i.obligated_change <> 0
  order by 1;
  
  select * from time_and_money_document where award_number = '001135-00001';
  select * from award_amount_info where award_number = '001135-00001';
  select * from award_amount_transaction where award_number = '001135-00001';


select * from award_amount_transaction where award_number = '001532-00001';

select * from time_and_money_document;

select count(*) from award_amount_transaction;

select  unique t.award_number 
from award_amount_transaction t,
     award_transaction_type g,
     award_amount_info i
where t.transaction_type_code = g.award_transaction_type_code 
  and t.award_number <> '000000-00000'
  and i.tnm_document_number = t.transaction_id
  and i.award_number = t.award_number
  and g.description = 'Award'
  order by 1;
  
  select  unique t.award_number 
from award_amount_transaction t,
     award_transaction_type g,
     award_amount_info i
where t.transaction_type_code = g.award_transaction_type_code 
  and t.award_number = '001225-00004'
  and i.tnm_document_number = t.transaction_id
  and i.award_number = t.award_number
  order by 1;
  

select  unique t.award_number, max(a.sequence_number) award_version_max, description,d.document_number tnm_doc_num
from award_amount_transaction t,
     award_transaction_type g,
     award_amount_info i,
     time_and_money_document d,
     award a
where t.transaction_type_code = g.award_transaction_type_code 
  and t.award_number <> '000000-00000'
  and i.tnm_document_number = t.transaction_id
  and i.award_number = t.award_number
  and i.tnm_document_number = d.document_number
  and g.description IN('Modification','Shell Record')
  and a.award_number = t.award_number
  group by t.award_number, description,d.document_number 
  order by 1;
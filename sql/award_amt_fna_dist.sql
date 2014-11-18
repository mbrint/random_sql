select * from krim_dlgn_mbr_t;

select * from award where document_number = '78449';

select * from time_and_money_document where award_number like  '005784-00001';

select * from award_amount_transaction where award_number like  '005784-%';

select * from award   where award_number like  '005784-%' or award_number like '005786-%' order by award_number;

select * from award_amt_fna_distribution  where award_number like  '005784-%' or award_number like '005786-%' order by award_number,end_date;

select * from award_amt_fna_distribution  where award_number like  '005790-%' order by award_number,end_date;

select * from award_amt_fna_distribution;

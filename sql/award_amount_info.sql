select unique award_amount_info.award_number,award.sponsor_code,sponsor.sponsor_name
--select *
from award_amount_info,award,sponsor
where substr(award_amount_info.award_number,0,6) in (select  substr(award_amount_info.award_number,0,6) as award_sub from award_amount_info 
                                   where anticipated_total_amount = amount_obligated_to_date
                                   and amount_obligated_to_date != 0
                                   and amount_obligated_to_date is not null
                                   and (  award_number like '%2'
                                          or award_number like '%3'
                                          or award_number like '%4'
                                          or award_number like '%5'
                                          or award_number like '%6'
                                          or award_number like '%7'
                                          or award_number like '%8'))
and amount_obligated_to_date != 0
and amount_obligated_to_date is not null
and award_amount_info.award_id = award.award_id
and sponsor.sponsor_code = award.sponsor_code
order by award_number;

select * from award_amount_info
where obligated_change != 0
and (  award_number like '%2'
    or award_number like '%3'
    or award_number like '%4'
    or award_number like '%5'
    or award_number like '%6'
    or award_number like '%7'
    or award_number like '%8');
    
select * from award_amount_info
where obligated_change != 0
and ( 
     award_number like '%5'
    or award_number like '%6'
    or award_number like '%7'
    or award_number like '%8');
    
select award_number,sequence_number,anticipated_total_amount,anticipated_change,obligated_total_direct,obligated_change_direct from award_amount_info
where obligated_change != 0 and( award_number like '001103-00%' or   award_number like '001061-00%')  
order by award_number,sequence_number;

select award_number,sequence_number,anticipated_total_amount,anticipated_change,obligated_total_direct,obligated_change_direct from award_amount_info
where award_number like '001061-00%'  
order by award_number,sequence_number;

select * from award_amount_info
where award_number like '001061-00%'  
order by award_number,sequence_number;


-- Search for and fix award with amount of 1072487 which moved in reporting
-- Update Applied to production, issues was caused by document operation performed by Luanne on Sept 6th
select aa.award_number
      ,aa.sequence_number
      ,aa.anticipated_total_amount
      ,aa.anticipated_change
      ,aa.obligated_total_direct
      ,aa.obligated_change_direct 
      ,at.update_timestamp
from award_amount_info aa
    ,award_amount_transaction at
where obligated_change = 1072487 
and   aa.award_number = at.award_number
order by award_number,sequence_number;

select * from award_amount_transaction where award_number like '002543%';  // change update_timestamp from, 06-SEP-12 to 19-JUN-12
update award_amount_transaction set update_timestamp = '19-JUN-12' where award_number like '002543%'; 

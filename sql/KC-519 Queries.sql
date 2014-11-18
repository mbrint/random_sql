select  
--*
transaction_id,tnm_document_number,award_number,sequence_number,ver_nbr, final_expiration_date,obligation_expiration_date,obligated_change,anticipated_change
from award_amount_info
--where award_number in ('001532-00001','001532-00010')
where award_number like '001532-%'
--and obligation_expiration_date > 'Jan 29 2012'
order by obligation_expiration_date,award_number,tnm_document_number,sequence_number;

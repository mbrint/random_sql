select Award_id as AWARD_ID, award_number, contract_status as CONTRACT_STATUS, count(csl_posted_date) as status_count
from uhapp_mgdw.rpt_award_contract_status
where source = 'mgneg'
and CONTRACT_STATUS in ('ORS Received','Grants Received','Contracts Received',
                                              'Assigned','Half Executed','Awarded','CG Received','No New Account Confirmed','Acct/Budget Created in KFS')
group by award_id,award_number, contract_status
having count(csl_posted_date) > 1;

select * from rpt_award_contract_status;
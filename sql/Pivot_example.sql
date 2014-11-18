select AWARD_ID
       ,"'ORS Received'" as ORS_RECEIVED
       ,"'Grants Received'" as GRANTS_RECEIVED
       ,"'Contracts Received'" as CONTRACTS_RECEIVED
       ,"'Assigned'" as ASSIGNED
       ,"'Half Executed'" as HALF_EXECUTED
       ,"'Awarded'" as AWARDED
       ,"'CG Received'" as CG_RECEIVED
       ,"'No New Account Confirmed'" as ACCOUNT_CONFIRMED
       ,"'Acct/Budget Created in KFS'" as ACCOUNT_CREATED
       ,nvl("'No New Account Confirmed'","'Acct/Budget Created in KFS'")
        as ACCOUNT_COMPLETED
from (
select * from (
select Award_id as AWARD_ID, contract_status as CONTRACT_STATUS, csl_posted_date as COMPLETED_DATE
from rpt_award_contract_status
where source = 'mgneg')
pivot
(
max(COMPLETED_DATE)
for CONTRACT_STATUS in ('ORS Received','Grants Received','Contracts Received',
                                              'Assigned','Half Executed','Awarded','CG Received','No New Account Confirmed','Acct/Budget Created in KFS')
)
order by award_id
)
;

select * from (
select Award_id as AWARD_ID, contract_status as CONTRACT_STATUS, csl_posted_date as COMPLETED_DATE, csl_sort_id as SECOND_COLUMN
from rpt_award_contract_status
where source = 'mgneg')
pivot
(
max(COMPLETED_DATE) as COMPLETED,
max(SECOND_COLUMN) as SOMETHING_ELSE
for CONTRACT_STATUS in ('ORS Received','Grants Received','Contracts Received',
                                              'Assigned','Half Executed','Awarded','CG Received','No New Account Confirmed','Acct/Budget Created in KFS')
)
order by award_id;

select * from rpt_award_contract_status;




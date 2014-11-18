create table  award_funding_propoals_bk
as
select * from award_funding_proposals
where award_id in ('106012','104880');

select * from award_funding_propoals_bk;

Update  Award_Funding_Proposals
Set  Proposal_ID = 5642
Where  Award_ID = 104880 ;

select *
from Award_Funding_Proposals
Where  Award_ID = 104880 ;

--insert into award_funding_proposals_bk
select * 
from Award_Funding_Proposals
where Proposal_ID = 5642;

Update  Award_Funding_Proposals
Set  Proposal_ID = 5642
Where  Award_ID = 104880 ;

delete from award_funding_proposals where award_id = '106012';

select lead_unit_number,award_number,award_id,update_user,sequence_number from award where award_id in ('106012','104880');



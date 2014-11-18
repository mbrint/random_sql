
select award_funding_proposal_id,ap.award_id,ap.proposal_id,a.award_number,a.sequence_number,p.proposal_number,p.proposal_id
from award_funding_proposals ap
     ,award a
     ,proposal p
where a.award_id = ap.award_id
      and ap.proposal_id = p.proposal_id
      and award_number like '001091-00009' 
      order by a.award_number,a.sequence_number;
      
select * from award_funding_proposals where award_funding_proposal_id = '238127';

insert into award_funding_proposals_bk (
select * from award_funding_proposals where award_funding_proposal_id = '238127' );

select * from award_funding_proposals_bk;

delete from award_funding_proposals  where award_funding_proposal_id = '238127' ;

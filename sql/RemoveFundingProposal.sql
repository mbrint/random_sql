-- get award_id
select award_id,award_number,sequence_number from award where award_number in ('004638-00004');

-- check award_funding_proposals for that award_id
select * from award_funding_proposals
where award_id in ('361548');

-- check proposal returned from last query
select document_number,proposal_number,proposal_id 
from proposal where proposal_id in (select proposal_id from award_funding_proposals
where award_id in ('361548'));

select * from award_funding_proposals
where proposal_id in ('283470','288423');

select * from award_funding_proposals
where award_funding_proposal_id in ('361549','361563');

-- create table award_funding_propoals_bk as
insert into award_funding_propoals_bk
select * 
from award_funding_proposals
where award_funding_proposal_id in ('361549','361563');

select * from award_funding_propoals_bk;

delete from award_funding_proposals
where award_funding_proposal_id  in ('361549','361563');

-- check if IP is still associated with the award
select current_award_number from proposal where proposal_number = ''; 


insert into award_funding_proposals
select * 
from award_funding_propoals_bk
where award_funding_proposal_id = '234348';
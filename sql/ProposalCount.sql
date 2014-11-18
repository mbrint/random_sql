select count(*) 
from proposal
where proposal_sequence_status = 'ACTIVE';

select count(unique(proposal_number))
from proposal
where proposal_sequence_status = 'ACTIVE';
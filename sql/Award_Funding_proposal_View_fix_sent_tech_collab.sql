select a.Award_id
      ,a.award_number
      ,a.sequence_number
      ,f.proposal_id
from award a,
     award_funding_proposals f
where a.award_id =  f.award_id (+)
  and award_number in ('001860-00002','001856-00001','001127-00001')
order by award_number,sequence_number
;

create view AWARD_NUM_TO_FND_PROP_ID as
select award_number,proposal_id
from award a,
     award_funding_proposals f
where a.award_id =  f.award_id;


select a.award_id,a.award_number,a.sequence_number,p.proposal_id
from award a
          ,proposal p
          ,award_num_to_fnd_prop_id x
where a.award_number = x.award_number
      and p.proposal_id = x.proposal_id
and a.award_number in ('001860-00002','001856-00001','001127-00001')
order by award_number,sequence_number;

select * from award where award_number like '001777%';

select *
from award_funding_proposals;

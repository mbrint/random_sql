select unique person_id from award_persons where rolodex_id is null;

select unique person_id from proposal_persons where rolodex_id is null;

select unique person_id from eps_prop_person where rolodex_id is null;

select * from proposal_persons where person_id not in (select prncpl_id from krim_prncpl_t);

select * from mgprod.proposal_log where  pi_id not in (select prncpl_id from mgrcuat.krim_prncpl_t); ;


select unique initr_prncpl_id from krew_doc_hdr_t;

select unique initr_prncpl_id, RTE_PRNCPL_ID, krew_doc_hdr_t.* 
from krew_doc_hdr_t
where rte_prncpl_id is not null and rte_prncpl_id != initr_prncpl_id;


select RTE_PRNCPL_ID
from krew_doc_hdr_t
where rte_prncpl_id is not null and rte_prncpl_id != initr_prncpl_id;

select unique prncpl_id from KREW_ACTN_RQST_T where prncpl_id is not null and prncpl_id != '10000000001';
select unique prncpl_id from KREW_ACTN_ITM_T where prncpl_id is not null and prncpl_id != 'admin';
select unique prncpl_id from krew_actn_tkn_t where prncpl_id is not null and prncpl_id != 'admin';




select unique person_id from budget_persons where rolodex_id is null and person_id is not null;

select * from protocol_persons;

-- IP
select person_id from proposal_persons where rolodex_id is null and person_id not in (select prncpl_id from krim_prncpl_t)
union
-- Proposal Log
select pi_id from proposal_log where  pi_id not in (select prncpl_id from krim_prncpl_t)
union
-- Award
select person_id from award_persons where rolodex_id is null and person_id not in (select prncpl_id from krim_prncpl_t)
union
-- PD
select unique person_id from eps_prop_person where rolodex_id is null and person_id not in (select prncpl_id from krim_prncpl_t)
union
-- Document Initiator
select initr_prncpl_id from krew_doc_hdr_t where initr_prncpl_id not in (select prncpl_id from krim_prncpl_t)
union
-- Routed by
select RTE_PRNCPL_ID from krew_doc_hdr_t where RTE_PRNCPL_ID not in (select prncpl_id from krim_prncpl_t)
union
-- Has pending action
select prncpl_id from KREW_ACTN_RQST_T where prncpl_id is not null and prncpl_id != '10000000001' and prncpl_id not in (select prncpl_id from krim_prncpl_t)
union
-- Has active action
select prncpl_id from KREW_ACTN_ITM_T where prncpl_id is not null and prncpl_id != 'admin' and prncpl_id not in (select prncpl_id from krim_prncpl_t)
union
-- Has taken action
select prncpl_id from krew_actn_tkn_t where prncpl_id is not null and prncpl_id != 'admin' and prncpl_id not in (select prncpl_id from krim_prncpl_t);






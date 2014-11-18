select *  from krim_role_t
where role_nm in ('Department Proposal Creator','Department Aggregator','Department Proposal Viewer');

select *  from krim_role_perm_t where role_id in (select role_id from krim_role_t
where role_nm in ('Department Proposal Creator','Department Aggregator','Department Proposal Viewer'));
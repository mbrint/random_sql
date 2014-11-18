select * from narrative where proposal_number = '1189';
select * from narrative_attachment where proposal_number = '1189';
select * from narrative_type where narrative_type_code in ('997','1');

delete from narrative where proposal_number = '1189' and module_number = 4;

create table  narrative_save  as (select * from narrative where proposal_number = '1034');

create table  narrative_user_rights_save  as (select * from narrative_user_rights where proposal_number = '1034');

drop table narrative_save;
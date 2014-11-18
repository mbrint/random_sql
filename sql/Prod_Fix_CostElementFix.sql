select * from cost_element where cost_element like ' %';


alter table valid_ce_rate_types disable constraint FK_VALID_CE_RATE_TYPES_CE_KRA;
alter table valid_ce_job_codes disable constraint VALID_CE_JOB_CODES_COST_E_FK1;
--alter table cost_element disable constraint all;

update valid_ce_rate_types set cost_element = '420610' where cost_element = ' 420610';
update cost_element set cost_element = '420610' where cost_element = ' 420610';
update valid_ce_job_codes set cost_element = '420610' where cost_element = ' 420610';

update valid_ce_rate_types set cost_element = '420630' where cost_element = ' 420630';
update cost_element set cost_element = '420630' where cost_element = ' 420630';
update valid_ce_job_codes set cost_element = '420630' where cost_element = ' 420630';

alter table valid_ce_rate_types enable constraint FK_VALID_CE_RATE_TYPES_CE_KRA;
alter table valid_ce_job_codes enable constraint VALID_CE_JOB_CODES_COST_E_FK1;


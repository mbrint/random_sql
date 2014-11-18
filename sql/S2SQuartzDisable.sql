select * from KRNS_PARM_T
where PARM_NM = 's2sschedulercronExpressionstarttime';

update KRNS_PARM_T
set TXT='01-JAN-2020 01:00 AM'
where PARM_NM = 's2sschedulercronExpressionstarttime';
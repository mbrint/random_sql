
select count(*) 
from KREW_DOC_HDR_T t
where t.ttl  like '%***PLACEHOLDER***%';

select TO_CHAR(min(t.crte_dt),'yyyy/mm/dd HH:MI:SS'),max(t.crte_dt)
from KREW_DOC_HDR_T t
where t.ttl  like '%***PLACEHOLDER***%'
and t.crte_dt > '02-NOV-11';

select TO_CHAR(t.crte_dt,'yyyy/mm/dd HH:MI:SS') as crdate,t.*
from KREW_DOC_HDR_T t
where t.ttl  like '%***PLACEHOLDER***%'
--and t.crte_dt > '02-NOV-11'
order by t.doc_hdr_id
;

select *
from KREW_DOC_HDR_T t
where t.ttl  like '%***PLACEHOLDER***%';

select *
from KREW_DOC_HDR_T t
where t.ttl  like '%***PLACEHOLDER***%'
and t.crte_dt > '31-OCT-11'
and t.crte_dt < '31-Aug-12';


select TO_CHAR(t.crte_dt,'yyyy/mm/dd') cr_date
       ,count(t.ttl)
       ,min(TO_CHAR(t.crte_dt,'yyyy/mm/dd HH:MI:SS'))
from KREW_DOC_HDR_T t
where t.ttl  like '%***PLACEHOLDER***%'
--and t.crte_dt > '31-OCT-11'
--and t.crte_dt < '31-Aug-12'
group by TO_CHAR(t.crte_dt,'yyyy/mm/dd')
order by cr_date
;
-- **************** From Mohammed ********************************
select * 
from KRNS_DOC_HDR_T 
where FDOC_DESC like '%*****PLACEHOLDER*****%';

create table KRNS_DOC_HDR_T_BK as
select * 
from KRNS_DOC_HDR_T 
where FDOC_DESC like '%*****PLACEHOLDER*****%'; 

select count(*) from KRNS_DOC_HDR_T_BK ;

select * 
from  KREW_DOC_HDR_CNTNT_T 
where DOC_HDR_ID in ( select DOC_HDR_ID 
                      from KREW_DOC_HDR_T 
                      where TTL like '%KC Award - *****PLACEHOLDER*****%')
order by DOC_HDR_ID;
                      
create table KREW_DOC_HDR_CNTNT_T_BK as
select * 
from  KREW_DOC_HDR_CNTNT_T 
where DOC_HDR_ID in ( select DOC_HDR_ID 
                      from KREW_DOC_HDR_T 
                      where TTL like '%KC Award - *****PLACEHOLDER*****%')
order by DOC_HDR_ID;



select count(*) from KREW_DOC_HDR_CNTNT_T_BK ;

select * 
from KREW_DOC_HDR_T 
where TTL like '%KC Award - *****PLACEHOLDER*****%';

create table KREW_DOC_HDR_T_BK as
select * 
from KREW_DOC_HDR_T 
where TTL like '%KC Award - *****PLACEHOLDER*****%';

select count(*) from KREW_DOC_HDR_T_BK;

select * from krew_actn_rqst_t
where doc_hdr_id in ( select doc_hdr_id from krew_actn_itm_t where doc_hdr_ttl like '%KC Award - *****PLACEHOLDER*****%' );

create table krew_actn_rqst_t_BK as
select * from krew_actn_rqst_t
where doc_hdr_id in ( select doc_hdr_id from krew_actn_itm_t where doc_hdr_ttl like '%KC Award - *****PLACEHOLDER*****%' );

select count(*) from krew_actn_rqst_t_BK;

select * from krew_actn_itm_t
where doc_hdr_ttl like '%KC Award - *****PLACEHOLDER*****%';

create table krew_actn_itm_t_BK as
select * from krew_actn_itm_t
where doc_hdr_ttl like '%KC Award - *****PLACEHOLDER*****%';

select count(*) from krew_actn_itm_t_BK ;

select * from KRNS_DOC_HDR_T where doc_hdr_id in (4372,33847);
select * from KREW_DOC_HDR_T where doc_hdr_id in (4372,33847);
update KRNS_DOC_HDR_T set FDOC_DESC = 'Child-RRG Modifed Fix' where doc_hdr_id in (4372,33847); 
update KREW_DOC_HDR_T set TTL = 'Child-RRG Modifed Fix' where doc_hdr_id in (4372,33847);

-- restore from backup if doesn't work
delete from KRNS_DOC_HDR_T where FDOC_DESC = 'Child-RRG Modifed Fix';
delete from KREW_DOC_HDR_T where TTL = 'Child-RRG Modifed Fix';
delete from KREW_DOC_HDR_CNTNT_T where doc_hdr_id in (4372,33847);
insert into KRNS_DOC_HDR_T select * from  KRNS_DOC_HDR_T_BK;
insert into KREW_DOC_HDR_CNTNT_T select * from  KREW_DOC_HDR_CNTNT_T_BK;
insert into KREW_DOC_HDR_T select * from  KREW_DOC_HDR_T_BK;

select count(*) from KRNS_DOC_HDR_T where FDOC_DESC like '%*****PLACEHOLDER*****%';
select count(*) from  KREW_DOC_HDR_CNTNT_T where DOC_HDR_ID in ( select DOC_HDR_ID from KREW_DOC_HDR_T where TTL like '%KC Award - *****PLACEHOLDER*****%');
select count(*) from KREW_DOC_HDR_T where TTL like '%KC Award - *****PLACEHOLDER*****%';

delete from 
KRNS_DOC_HDR_T 
where FDOC_DESC like '%*****PLACEHOLDER*****%';

delete from  
KREW_DOC_HDR_CNTNT_T 
where DOC_HDR_ID in ( select DOC_HDR_ID 
                      from KREW_DOC_HDR_T 
                      where TTL like '%KC Award - *****PLACEHOLDER*****%');
                      
delete from KREW_DOC_HDR_T 
where TTL like '%KC Award - *****PLACEHOLDER*****%';

update krew_actn_itm_t set doc_hdr_ttl = 'Child-RRG Modifed Fix'
where doc_hdr_id in (4372,33847);

delete from krew_actn_rqst_t
where doc_hdr_id in ( select doc_hdr_id from krew_actn_itm_t where doc_hdr_ttl like '%KC Award - *****PLACEHOLDER*****%' );

delete from krew_actn_itm_t where doc_hdr_ttl like '%KC Award - *****PLACEHOLDER*****%';

create table PLACEHOLDER_DOC_HDR_IDS as
select DOC_HDR_ID from  KREW_DOC_HDR_CNTNT_T where doc_cntnt_txt like '%*****PLACEHOLDER*****%'
and DOC_HDR_ID in ( select DOC_HDR_ID from KREW_DOC_HDR_T_BK);

select count(*) from KREW_DOC_HDR_CNTNT_T where doc_cntnt_txt like '%*****PLACEHOLDER*****%'
and DOC_HDR_ID in ( select DOC_HDR_ID from KREW_DOC_HDR_T_BK);

select DOC_HDR_ID from KREW_DOC_HDR_T_BK where DOC_HDR_ID not in (select DOC_HDR_ID from PLACEHOLDER_DOC_HDR_IDS);
select count(*) from PLACEHOLDER_DOC_HDR_IDS;
select count(*) from KREW_DOC_HDR_T_BK;
select * from PLACEHOLDER_DOC_HDR_IDS;

select DOC_HDR_ID from KREW_DOC_HDR_CNTNT_T_BK where doc_cntnt_txt not like '%*****PLACEHOLDER*****%';

-------------------------------------------------------------
--Second occurance award 003252-00002 corrupted.....
update KRNS_DOC_HDR_T set FDOC_DESC = 'Child' where doc_hdr_id in (37370); 
update KREW_DOC_HDR_T set TTL = 'Child' where doc_hdr_id in (37370);
-------------------------------------------------------------


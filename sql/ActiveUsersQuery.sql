select count(unique mbr_id),'have_roles' type
from krim_role_mbr_t
where mbr_typ_cd = 'P'
union
select count(unique prncpl_id),'actn_tkn' type
from krew_actn_tkn_t;

select to_char(actn_dt,'YYYY/MM/DD DY') "Year/Month/DD DY", count(unique prncpl_id) "Users Taking Action", count(*) "Overall Actions Taken"
from krew_actn_tkn_t
group by to_char(actn_dt,'YYYY/MM/DD DY')
order by "Year/Month/DD DY" desc ;

select t.doc_typ_nm, count(*)
from krew_actn_tkn_t a,
     krew_doc_hdr_t d,
     krew_doc_typ_t t
where a.doc_hdr_id = d.doc_hdr_id
  and d.doc_typ_id = t.doc_typ_id
  and actn_dt > '01-Sep 2013'
  group by t.doc_typ_nm
  order by t.doc_typ_nm;
  
select to_char(actn_dt,'YYYY/MM/DD DY') "Year/Month/DD DY", t.doc_typ_nm, count(*)
from krew_actn_tkn_t a,
     krew_doc_hdr_t d,
     krew_doc_typ_t t
where a.doc_hdr_id = d.doc_hdr_id
  and d.doc_typ_id = t.doc_typ_id
  and actn_dt > '01-Sep 2013'
group by to_char(actn_dt,'YYYY/MM/DD DY'), t.doc_typ_nm
order by "Year/Month/DD DY" desc,t.doc_typ_nm
;
  
select to_char(a.actn_dt,'YYYYMMDD HH:MM:SS'),a.prncpl_id, p.prncpl_nm,'action'
from krew_actn_tkn_t a ,
     krim_prncpl_t p
where a.actn_dt > '09-Sep 2013'
  and a.prncpl_id = p.prncpl_id
union
select to_char(a.gnrt_dt,'YYYYMMDD HH24:MM:SS'),a.prncpl_id, p.prncpl_nm,'lock'
from krns_pessimistic_lock_t a,krim_prncpl_t p
where a.gnrt_dt > '09-Sep 2013'
  and a.prncpl_id = p.prncpl_id
order by 1 desc; 

select * from krns_pessimistic_lock_t;

select * from krew_doc_hdr_t;

select * from krew_doc_typ_t;

--select "DOW",avg("Users Taking Action"),avg("Overall Actions Taken")
select "DOW","DAY",to_char(avg("Users Taking Action"),9999.9),to_char(avg("Overall Actions Taken"),9999.9)
from (
select to_char(actn_dt,'YYYY/MM/DD DY') "Year/Month/DD DY",to_char(actn_dt,'DY') "DOW", to_char(actn_dt,'D') "DAY", count(unique prncpl_id) "Users Taking Action", count(*) "Overall Actions Taken"
from krew_actn_tkn_t
group by to_char(actn_dt,'YYYY/MM/DD DY'),to_char(actn_dt,'DY'),  to_char(actn_dt,'D')
order by "Year/Month/DD DY" desc )
group by "DOW", "DAY"
order by "DAY";



select * from krew_actn_tkn_t;



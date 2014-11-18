Select *
from Award_Custom_data b
where award_number like '001804-%';

select * from award where award_id = '1193';


Select *
from Award_Custom_data b
where award_number like '002257-%';

select *
from award_custom_data
where award_number like '001833-00001';


Select award_number
from award a
    ,krew_doc_hdr_t doc
where a.document_number = doc.doc_hdr_id
and a.award_number not in (select award_number
                           from award_custom_data
                           where award_number like '%-00001')     
and a.award_number like '%-00001'
and doc.doc_hdr_stat_cd = 'F'
order by award_number;

Select unique award_id
from award where award_id not in (select unique(award_id) from award_custom_data where award_number like '%-00001')
and award_number like '%-00001';

select count(*) from award;


Where b.Award_Number like '002265-%' ;

Select award_number,a.update_timestamp
from award a
    ,krew_doc_hdr_t doc
where a.document_number = doc.doc_hdr_id
and a.award_number not in (select award_number
                           from award_custom_data
                           where award_number like '%-00001')     
and a.award_number like '%-00001'
and doc.doc_hdr_stat_cd = 'F'
order by update_timestamp;

select attr.name,val.value
from award a 
    ,custom_attribute_doc_value val
    ,custom_attribute attr
where a.document_number = val.document_number
  and attr.id = val.custom_attribute_id
  and award_number like '002257-%';



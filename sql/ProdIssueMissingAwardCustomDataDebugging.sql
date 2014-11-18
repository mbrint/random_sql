select * 
from award_custom_data
--where award_number = '002261-00001'; -- no funding
--where award_number = '002260-00001'; -- w/funding
where award_number = '002266-00001';

select *
from award a,
     award_custom_data d
where a.award_id = d.award_id
and a.award_number = '002266-00001';

select * 
from award_custom_data
where award_id = '50387';

select award_number 
from award_amount_transaction
where award_number = '002260-00001' ;

select aat.award_number,aai.award_number,aat.*,aai.*
from award_amount_transaction aat,
     award_amount_info aai
where aat.transaction_id = aai.tnm_document_number
 and  aat.award_number = '000000-00000';
 and aai.award_number in (Select  a.award_number
           from award a
               ,krew_doc_hdr_t   doc
               ,krew_actn_rqst_t t
               ,award_funding_proposals fp
          where a.document_number = doc.doc_hdr_id
            and a.award_number not in 
            (select award_number
               from award_custom_data
              where award_number like '%-00001') 
            and a.award_number like '%-00001'
            and doc.doc_hdr_stat_cd = 'F'
            and a.document_number = t.doc_hdr_id
            and fp.award_id (+)= a.award_id
 );

select * 
from award_custom_data
where award_id = (select unique award_id 
                  from award_custom_data 
                  where update_timestamp = (select max(update_timestamp) 
                                            from award_custom_data ));
                                            
select count(*) from award_custom_data where award_number = '000000-00000';                                            
                                            
select * from award where award_id = '50372';
                                            
select award_id 
from award_custom_data 
where update_timestamp = (select max(update_timestamp) 
                          from award_custom_data );

select *
from custom_attribute_doc_value
--where document_number = '19035'; -- no funding
where document_number = '19034'; -- w/funding


select *
from custom_attribute_doc_value
where document_number = '19008';

select count(*) 
from unit 
where length(unit_name) > 30; 
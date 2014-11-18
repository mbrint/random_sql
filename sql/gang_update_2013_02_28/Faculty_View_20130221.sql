Drop view Faculty_View ;

--Rebuild the Faculty_View by use of Krim_Entity_NM_T, Krim_Entity_Email_T and
--Krim_Prncpl_T instead of the kim_info to get rid of the UH RICE Profile. 
--Coded by G. Yuan 02/21/2013.
Create View Faculty_View as
Select f.entity_id                      as Person_ID
     , f.First_NM                       as First_Name
     , f.Middle_NM                      as Middle_Name
     , f.Last_NM                        as Last_Name
     , f.Last_NM || ', ' || f.First_NM  as PI_Name
     , f.First_NM || ' ' || f.Last_NM   as PI_Full_Name
     , p.prncpl_nm                      as UH_User_Name
     , e.Email_Addr                     as PI_Email
     , f.Actv_Ind                       as Active
     --, f.Dflt_Ind                       as Dflt_Indicator
     --, f.Last_Updt_DT                   as Last_Update
  From krim_Entity_NM_T     f
     , krim_entity_email_t  e
     , krim_prncpl_t        p
 Where f.entity_id = e.entity_id
   and f.entity_id = p.entity_id
   and f.Dflt_Ind = 'Y'
   and f.actv_ind = 'Y' 
   and e.Dflt_Ind = 'Y'
   and e.actv_ind = 'Y'
   and p.actv_ind = 'Y' ;
   
Grant select on Faculty_View to mg_report ;

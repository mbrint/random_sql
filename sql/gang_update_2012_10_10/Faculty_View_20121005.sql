Drop view Faculty_View ;

Create View Faculty_View as
SELECT f.UHUUID                                        as Person_ID
     , trim(f.firstname)                               as First_Name
     , trim(f.middlename)                              as Middle_Name
     , trim(f.lastname)                                as Last_Name
     , trim(f.lastname) || ', ' ||  trim(f.firstname)  as PI_Name
     , trim(f.firstname) || ' ' ||  trim(f.lastname)   as PI_Full_Name
     , f.UHUserName                                    as UH_User_Name
     , f.UHUserName || '@hawaii.edu'                   as PI_email
     , f.Active                                        as Active
  From  kim_info                                       f 
 Where  Active = 'Y'
 
Union All

Select k.UHUUID                                        as Person_ID
     , trim(k.firstname)                               as First_Name
     , trim(k.middlename)                              as Middle_Name
     , trim(k.lastname)                                as Last_Name
     , trim(k.lastname) || ', ' ||  trim(k.firstname)  as PI_Name
     , trim(k.firstname) || ' ' ||  trim(k.lastname)   as PI_Full_Name
     , k.UHUserName                                    as UH_User_Name
     , k.UHUserName || '@hawaii.edu'                   as PI_email
     , k.Active                                        as Active
  from kim_info                                        k
      , ( Select max(profileid) as max_prf_ID, ff.uhuuid
          -- Decide to use the profileid because it is unique, modificationdate
          -- is not sure unique value 10/05/2012.
          -- Select max(modificationdate) as max_mdate, ff.uhuuid
           from kim_info        ff
          Where uhuuid in 
               ( Select fn.uhuuid from kim_info        fn
                  Where fn.Active = 'N'
                    and fn.uhuuid not in 
                        (Select n.uhuuid 
                           from kim_info  n
                              , kim_info  y
                          Where n.uhuuid = y.uhuuid
                            --and n.profileid <> y.profileid
                            and n.active = 'N'
                            and y.active = 'Y' 
                         )
               ) 
          Group by ff.uhuuid  ) fnn 
 --Where k.modificationdate = fnn.max_mdate ;
 Where k.profileid = fnn.max_prf_ID ;
 
Grant select on Faculty_View to mg_report ;

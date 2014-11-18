Begin
  DBMS_NETWORK_ACL_ADMIN.CREATE_ACL(acl         => 'mygrant_access.xml',
                                    description => 'permission to access mygrant',
                                    principal   => 'MGPROD',
                                    is_grant    => true,
                                    privilege   => 'connect');
 
  DBMS_NETWORK_ACL_ADMIN.ADD_PRIVILEGE(acl       => 'mygrant_access.xml',
                                       principal => 'MGPROD',
                                       is_grant  => true,
                                       privilege => 'resolve');

  DBMS_NETWORK_ACL_ADMIN.ASSIGN_ACL(acl  => 'mygrant_access.xml',
                                    host => 'ovm99.pvt.hawaii.edu');
End;
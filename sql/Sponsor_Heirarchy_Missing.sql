select * from sponsor 
where sponsor_name like 'Office of Information Mgmt % Technology-HI'
or sponsor_name like 'Children%s Tumor Foundation';

select * 
from sponsor_hierarchy
where sponsor_code in (select sponsor_code from sponsor 
                       where sponsor_name like 'Office of Information Mgmt % Technology-HI'
                       or sponsor_name like 'Children%s Tumor Foundation');
                       
select * 
from sponsor
where sponsor_code not in ( select sponsor_code from sponsor_hierarchy where sponsor_hierarchy.hierarchy_name = 'REPORTING' );


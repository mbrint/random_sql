select t1.table_name,
       t1.row_count-t2.row_count as row_change
from AA_TABLE_ROW_ANALYSIS T1,
     AA_TABLE_ROW_ANALYSIS T2
where t1.table_name = t2.table_name
and t1.row_count != t2.row_count
and T1.version = &T1
and T2.version = &T2;

select max(version) from aa_table_row_analysis;
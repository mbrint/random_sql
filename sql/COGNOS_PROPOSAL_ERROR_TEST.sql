select KC_PROPOSAL.PROPOSAL_ID,budget_period,total_cost
from KC_PROP_TO_BUDGET_PERIODS_VIEW,
     KC_PROPOSAL
where KC_PROP_TO_BUDGET_PERIODS_VIEW.PROPOSAL_ID = KC_PROPOSAL.PROPOSAL_ID
      and KC_PROPOSAL.
and KC_PROPOSAL.PROPOSAL_ID = 'INF0000000399'
order by budget_period,total_cost;

select * from KC_PROPOSAL
where KC_PROPOSAL.PROPOSAL_ID = 'INF0000000399';

"SELECT 'INF' || p.prop_no             	        as Proposal_ID
 	, 'INF' || p.inst_no             	as Proposal_Number
 	, To_Char(p.unit_code,'00009')   	as Lead_Unit_Number
 	, b.awardnum                     	as Current_Award_Number
 	, 'INF' || p.spon_code           	as Sponsor_Code
 	, p.proj_title                   	as Title
 	, b.n_sp_totc                    	as Total_Direct_Cost_Total
 	, 'INF-' || cc.code              	as Proposal_Type_Code
 	,                      	as Update_Timestamp
 	, b.ap_st_dt                     	as Requested_Start_Date_Total
        , b.ap_end_dt                    	as Requested_End_Date_Total
 	, 'INF' || c.code                	as Activity_Type_Code
 From     dm_infoed_administrator.Proposal      p
 	--, dm_infoed_administrator.pd_grc_bgt  	b
 	, dm_infoed_administrator.codetab     	c
 	, dm_infoed_administrator.Prop_u      	pu
 	, dm_infoed_administrator.codetab     	cc
 Where --p.prop_no = b.prop_no
   (c.arr_name='PGM_TYPE'
   AND  c.codeid=p.pgm_type)
   AND ( b.n_sp_totc <> 0 AND b.rec_type = 1)
   AND (cc.arr_name = 'PROP_TYPE'
   And  cc.codeid = p.prop_type)
   --Exclude CTAHR Formula Proposals
   --And  p.prop_type <> 'UHAWAII_P_PROP_TYPE_2' 
   AND  p.prop_no = pu.prop_no
   --Exclude Pre-Proposal
   AND  pu.p_log_2 <> 1  "

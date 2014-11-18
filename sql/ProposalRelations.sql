select 'PROPOSAL' TABLE_NAME, DOCUMENT_NUMBER,PROPOSAL_NUMBER,PROPOSAL_SEQUENCE_STATUS,PROPOSAL_ID,SEQUENCE_NUMBER from proposal where proposal_number = '00001011';

select 'EPS_PROPOSAL' TABLE_NAME,document_number,proposal_number from eps_proposal where proposal_number = '1033';

select 'BUDGET' TABLE_NAME,document_number,budget_id from budget where total_direct_cost = 152862.80;

select 'BUDGET_PERIODS' TABLE_NAME,budget_id,budget_period, budget_period_number from budget_periods where budget_id = 1041;

select 'BUDGET_DETAILS' TABLE_NAME,budget_id,budget_period_number from budget_details where budget_id = 1041;

select 'BUDGET_DOCUMENT' TABLE_NAME,document_number,parent_document_key from budget_document where document_number = 4497;

select 'PROPOSAL_ADMIN_DETAILS' TABLE_NAME,DEV_PROPOSAL_NUMBER,INST_PROPOSAL_ID from PROPOSAL_ADMIN_DETAILS where dev_proposal_number = 1033;

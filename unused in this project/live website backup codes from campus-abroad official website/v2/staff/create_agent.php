<?php
include_once("common_include.php");

if($_REQUEST['type'] == 1)
{
	$where_con = [
				'mobile' => $_REQUEST['mobile'],
				'whatsapp' => $_REQUEST['whatsapp'],
				'email' => $_REQUEST['email'],
				'company_website' => $_REQUEST['company_website'],
			];
}
else
{
	$where_con = [
				'mobile' => $_REQUEST['mobile'],
				'whatsapp' => $_REQUEST['whatsapp'],
				'email' => $_REQUEST['email'],
			];
}	

//check agent data already exist or not
if(getRowCountMultiCol(setWhereClauseOR($where_con),'agent_list',$con) == 0)
{
	$agent_data = $_REQUEST;
		
	$current_inserted_agent_id = insertData('agent_list',$agent_data,$con);

	$login_create_data = [
							'ref_id' => 'SA'.$current_inserted_agent_id,
							'username' => $_REQUEST['email'],
							'password' => '123456',
							'login_type' => 4,
							'status' => $_REQUEST['status'],
						];

	insertData('login_detail', $login_create_data,$con);

	//wallet creation
	$wallet_data = [
					'holder_id' => $current_inserted_agent_id,
					'holder_type' => 4,
					'balance' => 0,
					];
	$current_created_wallet_id = insertdata('wallet_list',$wallet_data,$con);

	//create wallet history
	$wallet_history_data = [
							'wallet_id' => $current_created_wallet_id,
							'transaction_remark' => 'Wallet Created',
							'transaction_amount' => 0,
							'transaction_date' => strtotime('now'),
							'transaction_type' => 111,
							];
	insertData('wallet_history',$wallet_history_data,$con);

	//create email history
	signupEmailHistory('Agent Signup',$_REQUEST['email'],$_REQUEST['name'],$con);

	header("Location:add_agent.php?msg=success");
}
else {
	header("Location:add_agent.php?msg=error");
}
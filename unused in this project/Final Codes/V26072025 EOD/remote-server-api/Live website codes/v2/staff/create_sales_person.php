<?php
include_once("common_include.php");

$where_con = [
			'mobile' => $_REQUEST['mobile'],
			'whatsapp' => $_REQUEST['whatsapp'],
			'email' => $_REQUEST['email'],
		];

//check sales person data already exist or not
if(getRowCountMultiCol(setWhereClauseOR($where_con),'sales_person_list',$con) == 0)
{
	$sales_person_data = $_REQUEST;					

	$current_inserted_sales_person_id = insertData('sales_person_list',$sales_person_data,$con);

	$login_create_data = [
							'ref_id' => 'SP'.$current_inserted_sales_person_id,
							'username' => $_REQUEST['email'],
							'password' => '123456',
							'login_type' => 6,
							'status' => $_REQUEST['status'],
						];

	insertData('login_detail', $login_create_data,$con);

	//wallet creation
	$wallet_data = [
					'holder_id' => $current_inserted_sales_person_id,
					'holder_type' => 6,
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
	signupEmailHistory('Sales Person Signup',$_REQUEST['email'],$_REQUEST['name'],$con);

	header("Location:add_sales_person.php?msg=success");
}
else {
	header("Location:add_sales_person.php?msg=error");
}


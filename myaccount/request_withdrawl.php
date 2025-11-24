<?php
include_once("common_include.php");

//create withdrawl request
$withdrawl_request_data = [
							'wallet_id' => $_REQUEST['wallet_id'],
							'amount' => $_REQUEST['amount'],
							'req_datentime' => strtotime('now'),
							'status' => 0,
							];

insertData('withdrawl_request_list',$withdrawl_request_data,$con);

//create Withdrawal Request Email History
withdrawalEmailHistory('Withdrawal Request',$_REQUEST['wallet_id'],$con);

header("Location:mywallet.php");
?>
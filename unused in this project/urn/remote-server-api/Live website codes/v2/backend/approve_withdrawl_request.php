<?php
include_once("common_include.php");

$new_file_name_suffix = "";
$file_name_str = "";
$withdrawl_amount = 0;

for($j=0;$j<count($_FILES['payment_proof']['name']);$j++)
{
	if($j > 0)	
	$new_file_name_suffix .= "_".$j;

	$new_file_name = $_REQUEST['transaction_id'].$new_file_name_suffix.".".pathinfo($_FILES['payment_proof']['name'][$j], PATHINFO_EXTENSION);
	move_uploaded_file($_FILES['payment_proof']['tmp_name'][$j],"../transaction_proofs/".$new_file_name);

	if($file_name_str == '')
		$file_name_str = $new_file_name;
	else
		$file_name_str .= ",".$new_file_name;
}

$transaction_data = [
					'transaction_id' => $_REQUEST['transaction_id'],
					'transaction_datentime' => strtotime($_REQUEST['transaction_datentime']),
					'proof_file_name' => $file_name_str,
					'status' => 1,
					'approved_by' => $_SESSION['user_ref_id'],
					'approval_datentime' => strtotime('now'),
					];


for($i=0;$i<count($_REQUEST['withdrawl_request']);$i++)
{
	$where_con_array = [ 'id' => $_REQUEST['withdrawl_request'][$i] ];
	updateData('withdrawl_request_list',$transaction_data,$where_con_array,$con);
	$withdrawl_amount += getFieldValue('amount','id',$_REQUEST['withdrawl_request'][$i],'withdrawl_request_list',$con);
}

//update wallet balance
$wallet_balance = getFieldValue('balance','id',$_REQUEST['wallet_id'],'wallet_list',$con);
$wallet_balance_updated = $wallet_balance - $withdrawl_amount;

$wallet_where_con_array = [ 'id' => $_REQUEST['wallet_id'] ];
$wallet_updation_data = [ 'balance' => $wallet_balance_updated];

updateData('wallet_list',$wallet_updation_data,$wallet_where_con_array,$con);

//create wallet history record
$wallet_history_data = [
						'wallet_id' => $_REQUEST['wallet_id'],
						'transaction_remark' => 'Amount Withdrawl',
						'transaction_amount' => $withdrawl_amount,
						'transaction_id' => $_REQUEST['transaction_id'],
						'transaction_date' => strtotime($_REQUEST['transaction_datentime']),
						'transaction_type' => 0,
						];

insertData('wallet_history',$wallet_history_data,$con);

header("Location:manage_agent.php?agent_id=".$_REQUEST['agent_id']."&tab=withdrawl_request")
?>
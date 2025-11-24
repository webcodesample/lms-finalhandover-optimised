<?php
include_once("common_include.php");

$new_file_name_suffix = "";
$file_name_str = "";

for($j=0;$j<count($_FILES['transaction_proof']['name']);$j++)
{
	if($j > 0)	
	$new_file_name_suffix .= "_".$j;

	$new_file_name = $_REQUEST['transaction_id'].$new_file_name_suffix.".".pathinfo($_FILES['transaction_proof']['name'][$j], PATHINFO_EXTENSION);
	move_uploaded_file($_FILES['transaction_proof']['tmp_name'][$j],"../income_proofs/".$new_file_name);

	if($file_name_str == '')
		$file_name_str = $new_file_name;
	else
		$file_name_str .= ",".$new_file_name;
}

$transaction_data = [
					'transaction_id' => $_REQUEST['transaction_id'],
					'datentime' => strtotime($_REQUEST['transaction_date']),
					'transaction_proof_file_name' => $file_name_str,
					'comission_rcvd' => 1,
					'entry_done_by' => $_SESSION['user_ref_id'],
					'entry_datentime' => strtotime('now'),
					];

$payment_data = [
				'transaction_id' => 'WT'.strtotime('now'),
				'comission_paid' => 1,
				'datentime' => strtotime('now'),
				];

for($i=0;$i<count($_REQUEST['lead_list']);$i++)
{
	$urn = getFieldValue('urn','id',$_REQUEST['lead_list'][$i],'leads_details',$con);

	$where_con_array = [ 'lead_id' => $_REQUEST['lead_list'][$i] ];
	updateData('income_history',$transaction_data,$where_con_array,$con);
	updateData('comission_paid_history',$payment_data,$where_con_array,$con);
	
	$comission_paid_record = mysqli_fetch_assoc(getRowsDataCon('comission_paid_history',$where_con_array,$con));

	if(substr($comission_paid_record['comission_paid_to'],0,2) == 'SA')
	{
		$wallet_con_array = [
							'holder_id' => substr($comission_paid_record['comission_paid_to'],2),
							'holder_type' => 4,
							];
	}
	else if(substr($comission_paid_record['comission_paid_to'],0,2) == 'SP')
	{
		$wallet_con_array = [
							'holder_id' => substr($comission_paid_record['comission_paid_to'],2),
							'holder_type' => 6,
							];
	}

	$wallet_id = getFieldValueMultiCon('id',setWhereClause($wallet_con_array),'wallet_list',$con);
	$wallet_balance = getFieldValue('balance','id',$wallet_id,'wallet_list',$con);
	$wallet_balance_updated = $wallet_balance + $comission_paid_record['comission_amount'];
	$wallet_updation_con_array = [ 'id' => $wallet_id ];
	$wallet_updation_data = [ 'balance' => $wallet_balance_updated];
	updateData('wallet_list',$wallet_updation_data,$wallet_updation_con_array,$con);

	//create wallet history record
	$wallet_history_data = [
							'wallet_id' => $wallet_id,
							'transaction_remark' => 'Commission Credited for URN '.$urn,
							'transaction_amount' => $comission_paid_record['comission_amount'],
							'transaction_id' => $comission_paid_record['transaction_id'],
							'transaction_date' => $comission_paid_record['datentime'],
							'transaction_type' => 1,
							];

	insertData('wallet_history',$wallet_history_data,$con);
}

header("Location:commission_history.php");
?>
<?php
include_once("common_include.php");

$where_clause = " WHERE holder_id = ".$_REQUEST['walletholderId']." AND holder_type = ".$_REQUEST['walletholdertype'];
$wallet_id = getFieldValueMultiCon('id',$where_clause,'wallet_list',$con);

$wallet_where_con_array = [ 'wallet_id' => $wallet_id,];
$orderby_clause = " ORDER BY id DESC";

$wallet_transactions = getRowsDataCon('wallet_history',$wallet_where_con_array,$con,$orderby_clause);
$wallet_current_balance = getFieldValue('balance','id',$wallet_id,'wallet_list',$con);

$i = 0;
$rowdata = [];

while($row = mysqli_fetch_assoc($wallet_transactions))
{
	$i++;

	$row['balance'] = $wallet_current_balance;

	if($row['transaction_type'] > 0)
	$wallet_current_balance -= $row['transaction_amount'];
	else
	$wallet_current_balance += $row['transaction_amount'];

	$row['rowindex'] = $i;
	$row['transaction_date'] = date('Y-m-d',$row['transaction_date']);
	$rowdata[] = $row;
}

echo json_encode($rowdata);
?>

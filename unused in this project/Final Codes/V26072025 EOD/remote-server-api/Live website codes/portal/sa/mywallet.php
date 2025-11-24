<?php
include_once("common_include.php");

$where_con_array = [
					'holder_id' => $_SESSION['userid'],
					'holder_type' => $_SESSION['login_type'],
					];

$wallet_id = getFieldValueMultiCon('id',setWhereClause($where_con_array),'wallet_list',$con);
$wallet_where_con_array = [ 'wallet_id' => $wallet_id];

$orderby_cluse = " ORDER BY id DESC";
$wallet_transactions = getRowsDataCon('wallet_history',$wallet_where_con_array,$con,$orderby_cluse);
$wallet_current_balance = getFieldValue('balance','id',$wallet_id,'wallet_list',$con);

//get allready pending withdrawl amount total for current agent
$wallet_pending_con_array = [
							'wallet_id' => $wallet_id,
							'status' => 0,
							];
$wallet_pending_request_balance = getColSumMultiCon('amount',$wallet_pending_con_array,'withdrawl_request_list',$con);

$withdrwable_balance = $wallet_current_balance - $wallet_pending_request_balance;

include_once("content_layout.php");
?>
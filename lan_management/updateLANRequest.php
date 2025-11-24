<?php
include_once("common_include.php");

//print_r($_REQUEST); die();

$where_con_array = [ 'id' => $_REQUEST['request_ref_id'] ];
$request_update_data = [
						'resolved_on' => strtotime('now'),
						'status' => $_REQUEST['status'],
						'resolved_by' => $_SESSION['user_ref_id'],
						'remark' => $_REQUEST['remark'],
						];

updateData('customer_request_list',$request_update_data,$where_con_array,$con);

if($_REQUEST['returnType'] == 1)
header("Location: lan_request_list.php");
else if($_REQUEST['returnType'] == 2)
{
	$lan = getFieldValue('request_for','id',$_REQUEST['request_ref_id'],'customer_request_list',$con);
	header("Location: manage_lan.php?lan=".$lan."&tab=ledger");
}
?>
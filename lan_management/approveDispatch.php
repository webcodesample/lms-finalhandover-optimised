<?php
include_once("common_include.php");
include_once("../common/ledger-schedule-functions.php");

foreach($_REQUEST['dispatchLAN'] AS $key=>$value)
{
	$lan_data = getLatestUpdateRow('lan',$value,'lan_audit_history',$con);
	unset($lan_data['id'],$lan_data['updation_remark'],$lan_data['updated_columns']);

	mysqli_query($con,"UPDATE dispatch_list SET status = 1 WHERE lan = ".$value);

	$lan_data['updation_remark'] = 'LAN Dispatched & Amount Disbursed';
	$lan_data['datentime'] = strtotime('now');
	
	insertData('lan_audit_history',$lan_data,$con);

	//insert lan_activity_history
	$lan_activty_info_array = [
								'lan' => $value,
								'lrn' => $lan_data['lrn'],
								'comment' => 'LAN Dispatch & Amount Disbursed',
								'activity_by' => $_SESSION['user_ref_id'],
								'datentime' => strtotime('now'),
								];
	insertData('lan_activity_history',$lan_activty_info_array,$con);
	createRepaymentSchedule($lan_data,$con);
	createLedger($lan_data,$con);
}

header("Location: dispatch_list.php");
?>
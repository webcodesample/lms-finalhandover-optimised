<?php
include_once("common_include.php");

$current_status_id = getFieldValue('status_id','lrn',$_REQUEST['lrn'],'lrn_list',$con);

$lrn_activity_data = [
						'lrn' => $_REQUEST['lrn'],
						'status_id' => $current_status_id,
						'comment' => $_REQUEST['call_remark'],
						'activity_by' => $_SESSION['user_ref_id'],
						'datentime' => strtotime('now')
					];

insertData('lrn_activity_history',$lrn_activity_data,$con);

if($_REQUEST['callback_date'] && $_REQUEST['callback_time'])
{
	$callback_datentime = $_REQUEST['callback_date'].' '.$_REQUEST['callback_time'];
	$callback_data = [
						'lrn' => $_REQUEST['lrn'],
						'callback_datentime' => strtotime($callback_datentime),
						'prev_remark' => $_REQUEST['call_remark'],
					];

	insertData('callback_list',$callback_data,$con);

	//get latest updated details about requested lrn
	//$lrn_latest_info = getLatestUpdateRow('lrn',$_REQUEST['lrn'],'lrn_audit_history',$con);

	//create set_callback Email History
	lrnupdationEmailHistory('New Callback Set',$_REQUEST['lrn'],$con);
}

header("Location:manage_lrn.php?lrn=".$_REQUEST['lrn']."&tab=history");

?>
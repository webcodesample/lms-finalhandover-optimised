<?php
include_once("common_include.php");
print_r($_REQUEST);

$current_status_id = getFieldValue('status_id','id',$_REQUEST['lead_id'],'leads_details',$con);

$lead_activity_data = [
						'lead_id' => $_REQUEST['lead_id'],
						'status_id' => $current_status_id,
						'comment' => $_REQUEST['call_remark'],
						'activity_by' => $_SESSION['user_ref_id'],
						'datentime' => strtotime('now')
					];

insertData('leads_activity_history',$lead_activity_data,$con);

if($_REQUEST['callback_date'] && $_REQUEST['callback_time'])
{
	$callback_datentime = $_REQUEST['callback_date'].' '.$_REQUEST['callback_time'];
	$callback_data = [
						'lead_id' => $_REQUEST['lead_id'],
						'callback_datentime' => strtotime($callback_datentime),
						'prev_remark' => $_REQUEST['call_remark'],
					];

	insertData('callback_list',$callback_data,$con);

	//get latest updated details about requested lead_id
	$urn_latest_info = getLatestUpdateRow('lead_id',$_REQUEST['lead_id'],'urn_audit_history',$con);

	//create set_callback Email History
	urnupdationEmailHistory('New Callback Set',$urn_latest_info['lead_id'],$urn_latest_info['student_email'],$con);
}

header("Location:urn_history.php?lead_id=".$_REQUEST['lead_id']."&tab=history");

?>
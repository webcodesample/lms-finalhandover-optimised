<?php
include_once("common_include.php");
print_r($_REQUEST);

$current_status_id = getFieldValue('status_id','id',$_REQUEST['lead_id'],'leads_details',$con);

$lead_activity_data = [
						'lead_id' => $_REQUEST['lead_id'],
						'status_id' => $current_status_id,
						'comment' => $_REQUEST['call_remark'],
						'activity_by' => $_SESSION['agent_ref_id'],
						'datentime' => strtotime('now')
					];

insertData('leads_activity_history',$lead_activity_data,$con);

if($_REQUEST['callback_datentime'])
{
	$callback_datentime_array = explode('T',$_REQUEST['callback_datentime']);
	$callback_datentime = implode(' ',$callback_datentime_array);
	$callback_data = [
						'lead_id' => $_REQUEST['lead_id'],
						'callback_datentime' => strtotime($callback_datentime),
						'prev_remark' => $_REQUEST['call_remark'],
					];

	insertData('callback_list',$callback_data,$con);
}

header("Location:urn_history.php?lead_id=".$_REQUEST['lead_id']."&tab=history");

?>
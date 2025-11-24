<?php
include_once("common_include.php");
print_r($_REQUEST);

$current_status_id = getFieldValue('status_id','id',$_REQUEST['lead_id'],'leads_details',$con);

//get current assigned stafff to urn/lead
$current_assigned_staff_id = getLatestUpdate('staff_id','lead_id',$_REQUEST['lead_id'],'lead_staff_relation',$con);
$current_assigned_staff_name = getFieldValue('name','id',$current_assigned_staff_id,'staff_list',$con);

$lead_activity_data = [
						'lead_id' => $_REQUEST['lead_id'],
						'status_id' => $current_status_id,
						'comment' => $_REQUEST['call_remark'],
						'activity_by' => $current_assigned_staff_name,
						'datentime' => strtotime('now')
					];

$query_insert_leads_activity_history = "INSERT INTO leads_activity_history SET ".setCRUDData($lead_activity_data);
mysqli_query($con, $query_insert_leads_activity_history);

if($_REQUEST['callback_datentime'])
{
	$callback_datentime_array = explode('T',$_REQUEST['callback_datentime']);
	$callback_datentime = implode(' ',$callback_datentime_array);
	$callback_data = [
						'lead_id' => $_REQUEST['lead_id'],
						'callback_datentime' => strtotime($callback_datentime)
					];

	$query_insert_callback_list = "INSERT INTO callback_list SET ".setCRUDData($callback_data);
	mysqli_query($con, $query_insert_callback_list);
}

header("Location:urn_history.php?lead_id=".$_REQUEST['lead_id']."&tab=history");

?>
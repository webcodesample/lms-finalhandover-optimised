<?php
include_once("common_include.php");

$where_con_array = [ 'id' => $_REQUEST['callback_id'],];

$callback_data = [
					'status' => 1,
					'call_remark' => $_REQUEST['call_remark'],
					'updated_by' => $_SESSION['user_ref_id'],
					'updation_datentime' => strtotime('now'),
				];
updateData('callback_list',$callback_data,$where_con_array,$con);

$callback_lead_id = getFieldValue('lead_id','id',$_REQUEST['callback_id'],'callback_list',$con);

$call_history_data = [
						'lead_id' => $callback_lead_id,
						'type' => 1,
						'remark' => $_REQUEST['call_remark'],
						'remark_by' =>	$_SESSION['user_ref_id'],
						'datentime' => strtotime("now"),
						'dataentry_datentime' => strtotime("now"),
						];

insertData('call_history',$call_history_data,$con);

//get latest updated details about requested callback_lead_id
$urn_latest_info = getLatestUpdateRow('lead_id',$callback_lead_id,'urn_audit_history',$con);

//create set_callback Email History
urnupdationEmailHistory('Callback Update',$urn_latest_info['lead_id'],$urn_latest_info['student_email'],$con);

header("Location:callback_list.php?tab=today");
?>
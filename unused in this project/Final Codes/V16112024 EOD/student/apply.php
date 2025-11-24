<?php
include_once("common_include.php");

//create new lead
$urn = createUniqueURN($con);
$latest_status_bath_id = getMaxBatchId($con);
$where_con_array = [
					'batch_id' => $latest_status_bath_id,
					'step_order' => 1,
					];
$new_lead_status_id = getFieldValueMultiCon('id',setWhereClause($where_con_array),'lead_status_list',$con);

$lead_data_array = [
			'urn' => $urn,
			'status_id' => $new_lead_status_id,
			'status_batch_id' => $latest_status_bath_id,
			'student_id' => $_SESSION['userid'],
			'course_id' => $_REQUEST['course'],
			'datentime' => strtotime('now'),
			'source_id' => 5,
		];
	
$inserted_lead_id = insertData('leads_details', $lead_data_array, $con);

//insert new lead activity record
$activty_info_array = [
					'lead_id' => $inserted_lead_id,
					'status_id' => $new_lead_status_id,
					'comment' => 'created',
					'activity_by' => 'student',
					'datentime' => strtotime('now'),
					];

insertData('leads_activity_history', $activty_info_array, $con);

//insert urn_audit_history
$where_con_array = [ 'id' => $_SESSION['userid']];
$student = mysqli_fetch_assoc(getRowsDataCon('students',$where_con_array,$con));

$urn_audit_history_array = [
					'lead_id' => $inserted_lead_id,
					'course_id' => $_REQUEST['course'],
					'status_id' => $new_lead_status_id,
					'student_name' => $student['name'],
					'student_mobile' => $student['mobile'],
					'student_email' => $student['email'],
					'student_brief_note' => 'No Note',
					'updation_remark' => 'Created By Student',
					'datentime' => strtotime('now'),
					];
	
insertData('urn_audit_history', $urn_audit_history_array, $con);

header("Location:urn_details.php?lead_id=".$inserted_lead_id."&tab=documents");
?>


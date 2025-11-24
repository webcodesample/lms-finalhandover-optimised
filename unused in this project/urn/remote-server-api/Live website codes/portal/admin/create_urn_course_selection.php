<?php
include_once("common_include.php");

//step 1 :create student & student login details
$student_data = [
					'name' => $_REQUEST['name'],
					'mobile' => $_REQUEST['mobile'],
					'email' => $_REQUEST['email'],
					'brief_note' => 'No Note',
					'userid' => $_REQUEST['email'],
					'password' => 'std1234'
				];

$student_id = insertData('students', $student_data,$con);

//step 2 : create new lead
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
			'student_id' => $student_id,
			'course_id' => $_REQUEST['course_id'],
			'datentime' => strtotime('now'),
			'created_by' => $_SESSION['staff_ref_id'],
			'source_id' => $_REQUEST['lead_source_id'],
		];
	
$inserted_lead_id = insertData('leads_details', $lead_data_array, $con);

//step 3 : insert new lead activity record
$activty_info_array = [
					'lead_id' => $inserted_lead_id,
					'status_id' => $new_lead_status_id,
					'comment' => 'URN Created',
					'activity_by' => $_SESSION['staff_ref_id'],
					'datentime' => strtotime('now'),
					];

insertData('leads_activity_history', $activty_info_array, $con);

//step 4 : insert urn_audit_history
$urn_audit_history_array = [
					'lead_id' => $inserted_lead_id,
					'course_id' => $_REQUEST['course_id'],
					'status_id' => $new_lead_status_id,
					'student_name' => $_REQUEST['name'],
					'student_mobile' => $_REQUEST['mobile'],
					'student_email' => $_REQUEST['email'],
					'student_brief_note' => 'No Note',
					'updation_remark' => 'Created By Admin',
					'datentime' => strtotime('now'),
					];
	
insertData('urn_audit_history', $urn_audit_history_array, $con);

//Step 5 : delete requested temp lead from temp_leads
$where_con_array = [ 'id' => $_REQUEST['temp_lead_id'] ];
deleteData('temp_leads',$where_con_array,$con);

header("Location:urn_history.php?lead_id=".$inserted_lead_id."&tab=documents");

?>
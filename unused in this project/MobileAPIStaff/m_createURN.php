<?php
include_once("common_include.php");

$jsonData = file_get_contents('php://input'); // Read raw POST data from the incoming request body

$data = json_decode($jsonData, true); // Decode the JSON data into a PHP array

$where_con_array = [ 'id' => $data['lead_id']];
$lead_data = mysqli_fetch_assoc(getRowsDataCon('temp_leads',$where_con_array,$con));

$name = $lead_data['name'];
$email = $lead_data['email'];
$mobile = $lead_data['mobile'];
$source = $lead_data['source_id'];

//create student details
$student_data = [
					'name' => $name,
					'mobile' => $mobile,
					'email' => $email,
					'brief_note' => 'No Note',
				];

$student_id = insertData('students', $student_data,$con);

//create student login details
$login_detail_data = [
					'ref_id' => 'ST'.$student_id,
					'username' => $email,
					'password' => 'test1234',
					'login_type' => 5,
					'status' => 1,
				];

insertData('login_detail', $login_detail_data,$con);

//create new URN
$urn = createUniqueURN($con);
$latest_status_batch_id = getMaxBatchId($con);
$where_con_array = [
					'batch_id' => $latest_status_batch_id,
					'step_order' => 1,
					];
$new_lead_status_id = getFieldValueMultiCon('id',setWhereClause($where_con_array),'lead_status_list',$con);

$lead_data_array = [
			'urn' => $urn,
			'status_id' => $new_lead_status_id,
			'status_batch_id' => $latest_status_batch_id,
			'student_id' => $student_id,
			'course_id' => 0,
			'datentime' => strtotime('now'),
			'created_by' => $data['created_by'],
			'source_id' => $source,
		];
	
$inserted_lead_id = insertData('leads_details', $lead_data_array, $con);

//insert new lead activity record
$activty_info_array = [
					'lead_id' => $inserted_lead_id,
					'status_id' => $new_lead_status_id,
					'comment' => 'Created',
					'activity_by' => $data['created_by'],
					'datentime' => strtotime('now'),
					];

insertData('leads_activity_history', $activty_info_array, $con);

//insert urn_audit_history
$urn_audit_history_array = [
					'lead_id' => $inserted_lead_id,
					'course_id' => 0,
					'status_id' => $new_lead_status_id,
					'student_name' => $name,
					'student_mobile' => $mobile,
					'student_email' => $email,
					'student_brief_note' => 'No Note',
					'updation_remark' => 'Created By '.$data['created_by'],
					'datentime' => strtotime('now'),
					];
	
insertData('urn_audit_history', $urn_audit_history_array, $con);

//Step 5 : update status of requested temp lead from temp_leads
$where_con_array = [ 'id' => $data['lead_id'], ];

$temp_lead_updation_data = [
							'status' => 1,
							'remark' => 'URN Created',
							'hidden' => 1,
							];

updateData('temp_leads',$temp_lead_updation_data,$where_con_array,$con);

echo json_encode(array('apply_status' => 'URN Created Successfuly'));

?>


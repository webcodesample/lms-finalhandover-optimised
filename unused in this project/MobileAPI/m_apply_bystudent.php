<?php
include_once("common_include.php");

$jsonData = file_get_contents('php://input'); // Read raw POST data from the incoming request body

$data = json_decode($jsonData, true); // Decode the JSON data into a PHP array

$course_id = $data['course_id'];
$student_id = $data['student_id'];

$query = "select count(*) AS total from leads_details where student_id = ".$data['student_id'];
$urn_count = mysqli_fetch_assoc(mysqli_query($con,$query));

if($urn_count['total'] > 2)
{
	echo json_encode(array('apply_status' => 0));
}
else
{
	//create new lead
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
				'course_id' => $course_id,
				'datentime' => strtotime('now'),
				'created_by' => 'ST'.$student_id,
				'source_id' => 5,
			];
	
	$inserted_lead_id = insertData('leads_details', $lead_data_array, $con);

	//insert new lead activity record
	$activty_info_array = [
						'lead_id' => $inserted_lead_id,
						'status_id' => $new_lead_status_id,
						'comment' => 'created',
						'activity_by' => 'ST'.$student_id,
						'datentime' => strtotime('now'),
						];

	insertData('leads_activity_history', $activty_info_array, $con);

	//insert urn_audit_history
	$where_con_array = [ 'id' => $student_id];
	$student = mysqli_fetch_assoc(getRowsDataCon('students',$where_con_array,$con));

	$urn_audit_history_array = [
						'lead_id' => $inserted_lead_id,
						'course_id' => $course_id,
						'status_id' => $new_lead_status_id,
						'student_name' => $student['name'],
						'student_mobile' => $student['mobile'],
						'student_email' => $student['email'],
						'student_brief_note' => 'No Note',
						'updation_remark' => 'Created By Student',
						'datentime' => strtotime('now'),
						];
	
	insertData('urn_audit_history', $urn_audit_history_array, $con);
	echo json_encode(array('apply_status' => 1));
}



?>


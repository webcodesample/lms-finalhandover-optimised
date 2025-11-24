<?php
include_once("common_include.php");

$jsonData = file_get_contents('php://input'); // Read raw POST data from the incoming request body

$data = json_decode($jsonData, true); // Decode the JSON data into a PHP array

$course_id = $data['course_id'];
$name = $data['name'];
$email = $data['email'];
$mobile = $data['mobile'];

$apply_status = 0;
$email_flag = 0;
$mobile_flag = 0;

//check lead data email duplicacy
$temp_lead_email_count = getRowCount('email',$email,'temp_leads',$con);
$student_email_count = getRowCount('email',$email,'students',$con);
$login_email_count = getRowCount('username',$email,'login_detail',$con);
if(($temp_lead_email_count < 1) && ($student_email_count < 1) && ($login_email_count < 1))
{
	$email_flag = 1;
}

//check lead data mobile duplicacy
$temp_lead_mobile_count = getRowCount('mobile',$mobile,'temp_leads',$con);
$student_mobile_count = getRowCount('mobile',$mobile,'students',$con);
if(($temp_lead_mobile_count < 1) && ($student_mobile_count < 1))
{
	$mobile_flag = 1;
}

if($email_flag == 1 && $mobile_flag == 1)
{
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
						'comment' => 'Created',
						'activity_by' => 'Portal Visitor',
						'datentime' => strtotime('now'),
						];

	insertData('leads_activity_history', $activty_info_array, $con);

	//insert urn_audit_history
	$urn_audit_history_array = [
						'lead_id' => $inserted_lead_id,
						'course_id' => $course_id,
						'status_id' => $new_lead_status_id,
						'student_name' => $name,
						'student_mobile' => $mobile,
						'student_email' => $email,
						'student_brief_note' => 'No Note',
						'updation_remark' => 'Created By Portal Visitor',
						'datentime' => strtotime('now'),
						];
	
	insertData('urn_audit_history', $urn_audit_history_array, $con);

	$apply_status = 1;
}

echo json_encode(array('apply_status' => $apply_status));

?>


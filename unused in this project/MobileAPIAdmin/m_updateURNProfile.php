<?php
include_once("common_include.php");

$jsonData = file_get_contents('php://input'); // Read raw POST data from the incoming request body

$data = json_decode($jsonData, true); // Decode the JSON data into a PHP array

$updated_columns = "";
$urn_latest_info = getLatestUpdateRow('lead_id',$data['lead_id'],'urn_audit_history',$con);

if($urn_latest_info['student_name'] != $data['name'])
{
	if($updated_columns == '')
		$updated_columns .= 'student_name';
	else
		$updated_columns .= ',student_name';
}

if($urn_latest_info['student_mobile'] != $data['mobile'])
{
	if($updated_columns == '')
		$updated_columns .= 'student_mobile_primary';
	else
		$updated_columns .= ',student_mobile_primary';
}

if($urn_latest_info['student_mobile_alt'] != $data['altmobile'])
{
	if($updated_columns == '')
		$updated_columns .= 'student_mobile_alt';
	else
		$updated_columns .= ',student_mobile_alt';
}

if($urn_latest_info['student_dob'] != strtotime($data['dob']))
{
	if($updated_columns == '')
		$updated_columns .= 'student_dob';
	else
		$updated_columns .= ',student_dob';
}

if($urn_latest_info['student_brief_note'] != $data['briefnote'])
{
	if($updated_columns == '')
		$updated_columns .= 'student_brief_note';
	else
		$updated_columns .= ',student_brief_note';
}

if($urn_latest_info['student_address'] != $data['address'])
{
	if($updated_columns == '')
		$updated_columns .= 'student_address';
	else
		$updated_columns .= ',student_address';
}


unset($urn_latest_info['id']);
	
$current_course_id = getFieldValue('course_id','id',$data['lead_id'],'leads_details',$con);
$current_status_id = getFieldValue('status_id','id',$data['lead_id'],'leads_details',$con);

//insert leads_activity_history
$activty_info_array = [
				'lead_id' => $data['lead_id'],
				'status_id' => $current_status_id,
				'comment' => $data['remark'],
				'activity_by' => $data['user_ref_id'],
				'datentime' => strtotime('now'),
				];
insertData('leads_activity_history',$activty_info_array,$con);

//insert urn_audit_history
$requested_data_for_updation_array = [
					'lead_id' => $data['lead_id'],
					'course_id' => $current_course_id,
					'status_id' => $current_status_id,
					'student_name' => $data['name'],
					'student_mobile' => $data['mobile'],
					'student_mobile_alt' => $data['altmobile'],
					'student_dob' => strtotime($data['dob']),
					'student_address' => $data['address'],
					'student_brief_note' => $data['briefnote'],
					'updation_remark' => $data['remark'],
					'datentime' => strtotime('now'),
					'updated_columns' => $updated_columns,
					];

$urn_audit_history_array = array_replace($urn_latest_info, $requested_data_for_updation_array);

insertData('urn_audit_history', $urn_audit_history_array, $con);

//create email history
urnupdationEmailHistory('URN Profile Update',$urn_latest_info['lead_id'],$urn_latest_info['student_email'],$con);

echo json_encode(array('updateStatus' => 1));
die();
?>
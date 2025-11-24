<?php
include_once("common_include.php");

$jsonData = file_get_contents('php://input'); // Read raw POST data from the incoming request body

$data = json_decode($jsonData, true); // Decode the JSON data into a PHP array

$updated_columns = "";
$urn_latest_info = getLatestUpdateRow('lead_id',$data['lead_id'],'urn_audit_history',$con);

if($urn_latest_info['passport_number'] != $data['passport_number'])
{
	if($updated_columns == '')
		$updated_columns .= 'passport_number';
	else
		$updated_columns .= ',passport_number';
}

if($urn_latest_info['passport_place_of_issue'] != $data['issued_at'])
{
	if($updated_columns == '')
		$updated_columns .= 'passport_place_of_issue';
	else
		$updated_columns .= ',passport_place_of_issue';
}

if($urn_latest_info['passport_holder_name'] != $data['name'])
{
	if($updated_columns == '')
		$updated_columns .= 'passport_holder_name';
	else
		$updated_columns .= ',passport_holder_name';
}

if($urn_latest_info['passport_holder_surname'] != $data['surname'])
{
	if($updated_columns == '')
		$updated_columns .= 'passport_holder_surname';
	else
		$updated_columns .= ',passport_holder_surname';
}

$passport_issued_on = strtotime($data['issued_on']);

if($urn_latest_info['passport_issued_on'] != $passport_issued_on)
{
	if($updated_columns == '')
		$updated_columns .= 'passport_issued_on';
	else
		$updated_columns .= ',passport_issued_on';
}

$passport_valid_till = strtotime($data['valid_till']);

if($urn_latest_info['passport_valid_till'] != $passport_valid_till)
{
	if($updated_columns == '')
		$updated_columns .= 'passport_valid_till';
	else
		$updated_columns .= ',passport_valid_till';
}

//insert leads_activity_history
$current_status_id = getFieldValue('status_id','id',$data['lead_id'],'leads_details',$con);

$activty_info_array = [
						'lead_id' => $data['lead_id'],
						'status_id' => $urn_latest_info['status_id'],
						'comment' => $data['remark'],
						'activity_by' => $data['user_ref_id'],
						'datentime' => strtotime('now'),
						];
insertData('leads_activity_history',$activty_info_array,$con);

//insert urn_audit_history
$requested_data_for_updation_array = [
										'lead_id' => $data['lead_id'],
										'passport_number' => $data['passport_number'],
										'passport_place_of_issue' => $data['issued_at'],
										'passport_issued_on' => $passport_issued_on,
										'passport_valid_till' => $passport_valid_till,
										'passport_holder_name' => $data['name'],
										'passport_holder_surname' => $data['surname'],
										'updation_remark' => $data['remark'],
										'datentime' => strtotime('now'),
										'updated_columns' => $updated_columns,
									];

unset($urn_latest_info['id']);
$urn_audit_history_array = array_replace($urn_latest_info, $requested_data_for_updation_array);
	
insertData('urn_audit_history', $urn_audit_history_array, $con);

//create email history
urnupdationEmailHistory('Additional Details Update',$urn_latest_info['lead_id'],$urn_latest_info['student_email'],$con);

echo json_encode(array('updateStatus' => 1));
die();
?>
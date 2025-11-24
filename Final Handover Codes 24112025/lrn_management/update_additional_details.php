<?php
include_once("common_include.php");

$updated_columns = "";

uploadAcademicDocuments($_FILES,$_REQUEST['lead_id'],$con);

if($_REQUEST['passport_number'] != $_REQUEST['passport_number_old'])
{
	if($updated_columns == '')
		$updated_columns .= 'passport_number';
	else
		$updated_columns .= ',passport_number';
}

if($_REQUEST['passport_place_of_issue'] != $_REQUEST['passport_place_of_issue_old'])
{
	if($updated_columns == '')
		$updated_columns .= 'passport_place_of_issue';
	else
		$updated_columns .= ',passport_place_of_issue';
}

if($_REQUEST['passport_holder_name'] != $_REQUEST['passport_holder_name_old'])
{
	if($updated_columns == '')
		$updated_columns .= 'passport_holder_name';
	else
		$updated_columns .= ',passport_holder_name';
}

if($_REQUEST['passport_holder_surname'] != $_REQUEST['passport_holder_surname_old'])
{
	if($updated_columns == '')
		$updated_columns .= 'passport_holder_surname';
	else
		$updated_columns .= ',passport_holder_surname';
}

$passport_issued_on = strtotime($_REQUEST['passport_issued_on']);

if($passport_issued_on != $_REQUEST['passport_issued_on_old'])
{
	if($updated_columns == '')
		$updated_columns .= 'passport_issued_on';
	else
		$updated_columns .= ',passport_issued_on';
}

$passport_valid_till = strtotime($_REQUEST['passport_valid_till']);

if($passport_valid_till != $_REQUEST['passport_valid_till_old'])
{
	if($updated_columns == '')
		$updated_columns .= 'passport_valid_till';
	else
		$updated_columns .= ',passport_valid_till';
}

if(!isset($_REQUEST['immigration_detail']))
$_REQUEST['immigration_detail'] = "";

if(!isset($_REQUEST['past_visa_refusal_detail']))
$_REQUEST['past_visa_refusal_detail'] = "";

if(!isset($_REQUEST['medical_condition_detail']))
$_REQUEST['medical_condition_detail'] = "";

if(!isset($_REQUEST['criminal_offence_detail']))
$_REQUEST['criminal_offence_detail'] = "";

if($_REQUEST['action_perform'] == 'update_additional_details')
{
	//get latest updated details about requested lead_id
	$urn_latest_info = getLatestUpdateRow('lead_id',$_REQUEST['lead_id'],'urn_audit_history',$con);

	//insert leads_activity_history
	$current_status_id = getFieldValue('status_id','id',$_REQUEST['lead_id'],'leads_details',$con);

	$activty_info_array = [
							'lead_id' => $_REQUEST['lead_id'],
							'status_id' => $urn_latest_info['status_id'],
							'comment' => $_REQUEST['updation_remark'],
							'activity_by' => $_SESSION['user_ref_id'],
							'datentime' => strtotime('now'),
							];
	insertData('leads_activity_history',$activty_info_array,$con);

	//insert urn_audit_history
	$requested_data_for_updation_array = [
											'lead_id' => $_REQUEST['lead_id'],
											'passport_number' => $_REQUEST['passport_number'],
											'passport_place_of_issue' => $_REQUEST['passport_place_of_issue'],
											'passport_issued_on' => $passport_issued_on,
											'passport_valid_till' => $passport_valid_till,
											'passport_holder_name' => $_REQUEST['passport_holder_name'],
											'passport_holder_surname' => $_REQUEST['passport_holder_surname'],
											'immigration_applied' => $_REQUEST['immigration_applied'],
											'immigration_detail' => $_REQUEST['immigration_detail'],
											'past_visa_refusal_status' => $_REQUEST['past_visa_refusal_status'],
											'past_visa_refusal_detail' => $_REQUEST['past_visa_refusal_detail'],
											'serious_medical_status' => $_REQUEST['serious_medical_status'],
											'medical_condition_detail' => $_REQUEST['medical_condition_detail'],
											'criminal_offence_status' => $_REQUEST['criminal_offence_status'],
											'criminal_offence_detail' => $_REQUEST['criminal_offence_detail'],
											'updation_remark' => $_REQUEST['updation_remark'],
											'datentime' => strtotime('now'),
											'updated_columns' => $updated_columns,
										];

	unset($urn_latest_info['id']);
	$urn_audit_history_array = array_replace($urn_latest_info, $requested_data_for_updation_array);
	
	insertData('urn_audit_history', $urn_audit_history_array, $con);

	//create email history
	urnupdationEmailHistory('Additional Details Update',$urn_latest_info['lead_id'],$urn_latest_info['student_email'],$con);

	header("Location:urn_history.php?lead_id=".$_REQUEST['lead_id']."&tab=additional");
}

?>
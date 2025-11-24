<?php
include_once("common_include.php");

$updated_columns = "";

if($_REQUEST['student_name'] != $_REQUEST['student_name_old'])
{
	if($updated_columns == '')
		$updated_columns .= 'student_name';
	else
		$updated_columns .= ',student_name';
}

if($_REQUEST['student_dob'] != $_REQUEST['student_dob_old'])
{
	if($updated_columns == '')
		$updated_columns .= 'student_dob';
	else
		$updated_columns .= ',student_dob';
}

if($_REQUEST['student_mobile'] != $_REQUEST['student_mobile_old'])
{
	if($updated_columns == '')
		$updated_columns .= 'student_mobile_primary';
	else
		$updated_columns .= ',student_mobile_primary';
}

if($_REQUEST['student_mobile_alt'] != $_REQUEST['student_mobile_alt_old'])
{
	if($updated_columns == '')
		$updated_columns .= 'student_mobile_alt';
	else
		$updated_columns .= ',student_mobile_alt';
}

if($_REQUEST['student_email'] != $_REQUEST['student_email_old'])
{
	if($updated_columns == '')
		$updated_columns .= 'student_email';
	else
		$updated_columns .= ',student_email';
}

if($_REQUEST['student_brief_note'] != $_REQUEST['student_brief_note_old'])
{
	if($updated_columns == '')
		$updated_columns .= 'student_brief_note';
	else
		$updated_columns .= ',student_brief_note';
}

if($_REQUEST['student_address'] != $_REQUEST['student_address_old'])
{
	if($updated_columns == '')
		$updated_columns .= 'student_address';
	else
		$updated_columns .= ',student_address';
}

if($_REQUEST['action_perform'] == 'update_profile')
{
	//get latest updated details about requested lead_id
	$urn_latest_info = getLatestUpdateRow('lead_id',$_REQUEST['lead_id'],'urn_audit_history',$con);
	unset($urn_latest_info['id']);
	
	$current_course_id = getFieldValue('course_id','id',$_REQUEST['lead_id'],'leads_details',$con);
	$current_status_id = getFieldValue('status_id','id',$_REQUEST['lead_id'],'leads_details',$con);

	//insert leads_activity_history
	$activty_info_array = [
					'lead_id' => $_REQUEST['lead_id'],
					'status_id' => $current_status_id,
					'comment' => $_REQUEST['updation_remark'],
					'activity_by' => $_SESSION['user_ref_id'],
					'datentime' => strtotime('now'),
					];
	insertData('leads_activity_history',$activty_info_array,$con);

	//insert urn_audit_history
	$requested_data_for_updation_array = [
						'lead_id' => $_REQUEST['lead_id'],
						'course_id' => $current_course_id,
						'status_id' => $current_status_id,
						'student_name' => $_REQUEST['student_name'],
						'student_dob' => strtotime($_REQUEST['student_dob']),
						'student_mobile' => $_REQUEST['student_mobile'],
						'student_mobile_alt' => $_REQUEST['student_mobile_alt'],
						'student_email' => $_REQUEST['student_email'],
						'student_address' => $_REQUEST['student_address'],
						'student_brief_note' => $_REQUEST['student_brief_note'],
						'updation_remark' => $_REQUEST['updation_remark'],
						'datentime' => strtotime('now'),
						'updated_columns' => $updated_columns,
						];

	$urn_audit_history_array = array_replace($urn_latest_info, $requested_data_for_updation_array);

	insertData('urn_audit_history', $urn_audit_history_array, $con);

	//create email history
	urnupdationEmailHistory('URN Profile Update',$urn_latest_info['lead_id'],$urn_latest_info['student_email'],$con);

	header("Location:urn_history.php?lead_id=".$_REQUEST['lead_id']."&tab=profile");
}

?>
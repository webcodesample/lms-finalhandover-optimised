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
		$updated_columns .= 'student_mobile';
	else
		$updated_columns .= ',student_mobile';
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

	//update student info
	$student_data_array = [
				'name' => $_REQUEST['student_name'],
				'dob' => strtotime($_REQUEST['student_dob']),
				'mobile' => $_REQUEST['student_mobile'],
				'alternate_mobile' => $_REQUEST['student_mobile_alt'],
				'email' => $_REQUEST['student_email'],
				'brief_note' => $_REQUEST['student_brief_note'],
			];
	$student_id = getFieldValue('student_id','id',$_REQUEST['lead_id'],'leads_details',$con);
	$current_course_id = getFieldValue('course_id','id',$_REQUEST['lead_id'],'leads_details',$con);
	$where_con_array = [ 'id' => $student_id];
	updateData('students',$student_data_array,$where_con_array,$con);

	//insert leads_activity_history
	$current_status_id = getFieldValue('status_id','id',$_REQUEST['lead_id'],'leads_details',$con);

	$activty_info_array = [
					'lead_id' => $_REQUEST['lead_id'],
					'status_id' => $current_status_id,
					'comment' => $_REQUEST['updation_remark'],
					'activity_by' => $_SESSION['user_ref_id'],
					'datentime' => strtotime('now'),
					];
	insertData('leads_activity_history',$activty_info_array,$con);

	//insert urn_audit_history
	$urn_audit_history_array = [
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
						'highest_education_type' => $urn_latest_info['highest_education_type'],
						'highest_education_name' => $urn_latest_info['highest_education_name'],
						'highest_education_from_year' => $urn_latest_info['highest_education_from_year'],
						'highest_education_to_year' => $urn_latest_info['highest_education_to_year'],
						'highest_education_institution' => $urn_latest_info['highest_education_institution'],
						'highest_education_institution_city' => $urn_latest_info['highest_education_institution_city'],
						'highest_education_institution_country' => $urn_latest_info['highest_education_institution_country'],
						'test_taken_flag' => $urn_latest_info['test_taken_flag'],
						'test_name' => $urn_latest_info['test_name'],
						'other_test_name' => $urn_latest_info['other_test_name'],
						'passport_number' => $urn_latest_info['passport_number'],
						'passport_place_of_issue' => $urn_latest_info['passport_place_of_issue'],
						'passport_issued_on' => $urn_latest_info['passport_issued_on'],
						'passport_valid_till' => $urn_latest_info['passport_valid_till'],
						'passport_holder_name' => $urn_latest_info['passport_holder_name'],
						'passport_holder_surname' => $urn_latest_info['passport_holder_surname'],
						'immigration_applied' => $urn_latest_info['immigration_applied'],
						'immigration_detail' => $urn_latest_info['immigration_detail'],
						'past_visa_refusal_status' => $urn_latest_info['past_visa_refusal_status'],
						'past_visa_refusal_detail' => $urn_latest_info['past_visa_refusal_detail'],
						'serious_medical_status' => $urn_latest_info['serious_medical_status'],
						'medical_condition_detail' => $urn_latest_info['medical_condition_detail'],
						'criminal_offence_status' => $urn_latest_info['criminal_offence_status'],
						'criminal_offence_detail' => $urn_latest_info['criminal_offence_detail'],
						'updation_remark' => $_REQUEST['updation_remark'],
						'datentime' => strtotime('now'),
						'updated_columns' => $updated_columns,
						];

	insertData('urn_audit_history', $urn_audit_history_array, $con);

	//create email history
	urnupdationEmailHistory('URN Profile Update',$urn_latest_info['lead_id'],$urn_latest_info['student_email'],$con);

	header("Location:urn_details.php?lead_id=".$_REQUEST['lead_id']."&tab=profile");
}

?>
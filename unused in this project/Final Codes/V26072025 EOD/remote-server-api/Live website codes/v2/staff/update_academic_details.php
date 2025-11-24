<?php
include_once("common_include.php");

$updated_columns = "";

uploadAcademicDocuments($_FILES,$_REQUEST['lead_id'],$con);

if($_REQUEST['highest_education_type'] != $_REQUEST['highest_education_type_old'])
{
	if($updated_columns == '')
		$updated_columns .= 'highest_education_type';
	else
		$updated_columns .= ',highest_education_type';
}

if($_REQUEST['highest_education_name'] != $_REQUEST['highest_education_name_old'])
{
	if($updated_columns == '')
		$updated_columns .= 'highest_education_name';
	else
		$updated_columns .= ',highest_education_name';
}

if($_REQUEST['highest_education_from_year'] != $_REQUEST['highest_education_from_year_old'])
{
	if($updated_columns == '')
		$updated_columns .= 'highest_education_from_year';
	else
		$updated_columns .= ',highest_education_from_year';
}

if($_REQUEST['highest_education_to_year'] != $_REQUEST['highest_education_to_year_old'])
{
	if($updated_columns == '')
		$updated_columns .= 'highest_education_to_year';
	else
		$updated_columns .= ',highest_education_to_year';
}

if($_REQUEST['highest_education_institution'] != $_REQUEST['highest_education_institution_old'])
{
	if($updated_columns == '')
		$updated_columns .= 'highest_education_institution';
	else
		$updated_columns .= ',highest_education_institution';
}

if($_REQUEST['highest_education_institution_city'] != $_REQUEST['highest_education_institution_city_old'])
{
	if($updated_columns == '')
		$updated_columns .= 'highest_education_institution_city';
	else
		$updated_columns .= ',highest_education_institution_city';
}

if($_REQUEST['highest_education_institution_country'] != $_REQUEST['highest_education_institution_country_old'])
{
	if($updated_columns == '')
		$updated_columns .= 'highest_education_institution_country';
	else
		$updated_columns .= ',highest_education_institution_country';
}

if($_REQUEST['test_taken_flag'] != $_REQUEST['test_taken_flag_old'])
{
	if($updated_columns == '')
		$updated_columns .= 'test_taken_flag';
	else
		$updated_columns .= ',test_taken_flag';
}

$test_name_new = "";
if(isset($_REQUEST['test_name']) && count($_REQUEST['test_name']) > 0)
	$test_name_new .= implode(',',$_REQUEST['test_name']);

if($test_name_new != $_REQUEST['test_name_old'])
{
	if($updated_columns == '')
		$updated_columns .= 'test_name';
	else
		$updated_columns .= ',test_name';
}

$other_test_name_new = "";
if(isset($_REQUEST['other_test_name']) && count($_REQUEST['other_test_name']) > 0)
	$other_test_name_new .= implode(',',$_REQUEST['other_test_name']);

if($other_test_name_new != $_REQUEST['other_test_name_old'])
{
	if($updated_columns == '')
		$updated_columns .= 'other_test_name';
	else
		$updated_columns .= ',other_test_name';
}

if($_REQUEST['action_perform'] == 'update_academic_details')
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
	$urn_audit_history_array = [
								'lead_id' => $_REQUEST['lead_id'],
								'course_id' => $urn_latest_info['course_id'],
								'status_id' => $urn_latest_info['status_id'],
								'student_name' => $urn_latest_info['student_name'],
								'student_dob' => $urn_latest_info['student_dob'],
								'student_mobile' => $urn_latest_info['student_mobile'],
								'student_mobile_alt' => $urn_latest_info['student_mobile_alt'],
								'student_email' => $urn_latest_info['student_email'],
								'student_address' => $urn_latest_info['student_address'],
								'student_brief_note' => $urn_latest_info['student_brief_note'],
								'highest_education_type' => $_REQUEST['highest_education_type'],
								'highest_education_name' => $_REQUEST['highest_education_name'],
								'highest_education_from_year' => $_REQUEST['highest_education_from_year'],
								'highest_education_to_year' => $_REQUEST['highest_education_to_year'],
								'highest_education_institution' => $_REQUEST['highest_education_institution'],
								'highest_education_institution_city' => $_REQUEST['highest_education_institution_city'],
								'highest_education_institution_country' => $_REQUEST['highest_education_institution_country'],
								'test_taken_flag' => $_REQUEST['test_taken_flag'],
								'test_name' => $test_name_new,
								'other_test_name' => $other_test_name_new,
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
	urnupdationEmailHistory('Academic Details Update',$urn_latest_info['lead_id'],$urn_latest_info['student_email'],$con);

	header("Location:urn_history.php?lead_id=".$_REQUEST['lead_id']."&tab=academic");
}

?>
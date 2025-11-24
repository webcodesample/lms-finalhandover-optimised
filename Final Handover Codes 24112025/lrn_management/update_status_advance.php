<?php
include_once("common_include.php");

$updated_columns = ['status_id'];

$current_status_step_order = getFieldValue('step_order','id',$_REQUEST['current_status_id'],'lead_status_list',$con);
$next_status_id = getFieldValue('id','description',$_REQUEST['next_status_description'],'lead_status_list',$con);
$_REQUEST['status_id'] = $next_status_id;

//update lrn status in lrn_list tbl
$where_con = ['lrn' => $_REQUEST['lrn'],];
$lrn_data = ['status_id' => $next_status_id,];
updateData('lrn_list',$lrn_data,$where_con,$con);

recordLRNAuditHistory($updated_columns,$con);
recordLRNActivityHistory($con);

//create email history
lrnupdationEmailHistory('LRN Status Updated',$_REQUEST['lrn'],$con);

header("Location:manage_lrn.php?lrn=".$_REQUEST['lrn']);
die();
?>

<?php
include_once("common_include.php");
$where_con_array = [
					'id' => $_REQUEST['current_status_id'],
					'batch_id' => $_REQUEST['current_status_batch_id'],
					];
$current_status_step_order = getFieldValueMultiCon('step_order',setWhereClause($where_con_array),'lead_status_list',$con);

$where_con_array_status = [
							'description' => $_REQUEST['next_status_description'],
							'batch_id' => $_REQUEST['current_status_batch_id'],
							];
$next_status_id = getFieldValueMultiCon('id',setWhereClause($where_con_array_status),'lead_status_list',$con);
$next_status_description = $_REQUEST['next_status_description'];//getFieldValueMultiCon('description',setWhereClause($where_con_array_status),'lead_status_list',$con);

$where_con = ['id' => $_REQUEST['lead_id'],];

//update lead status in leads_details tbl
$lead_data = [
				'status_id'	 => $next_status_id,
			];

updateData('leads_details',$lead_data,$where_con,$con);

//update lead status in leads_activity_history tbl
$lead_activity_data = [
						'lead_id' => $_REQUEST['lead_id'],
						'status_id' => $next_status_id,
						'comment' => 'Status Updated',
						'activity_by' => $_SESSION['user_ref_id'],
						'datentime' => strtotime('now'),
					];

insertData('leads_activity_history',$lead_activity_data,$con);

//get latest updated details about requested lead_id
$urn_latest_info = getLatestUpdateRow('lead_id',$_REQUEST['lead_id'],'urn_audit_history',$con);

//insert urn_audit_history
$urn_audit_history_array = [
					'lead_id' => $_REQUEST['lead_id'],
					'course_id' => $urn_latest_info['course_id'],
					'status_id' => $next_status_id,
					'student_name' => $urn_latest_info['student_name'],
					'student_dob' => $urn_latest_info['student_dob'],
					'student_mobile' => $urn_latest_info['student_mobile'],
					'student_mobile_alt' => $urn_latest_info['student_mobile_alt'],
					'student_email' => $urn_latest_info['student_email'],
					'student_address' => $urn_latest_info['student_address'],
					'student_brief_note' => $urn_latest_info['student_brief_note'],
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
					'updation_remark' => 'Status Updated',
					'datentime' => strtotime('now'),
					'updated_columns' => 'status',
					];

insertData('urn_audit_history', $urn_audit_history_array, $con);

//create email history
urnstatusEmailHistory($next_status_description,$urn_latest_info['lead_id'],$urn_latest_info['student_email'],$con);

header("Location:urn_history.php?lead_id=".$_REQUEST['lead_id']."&tab=history");
?>
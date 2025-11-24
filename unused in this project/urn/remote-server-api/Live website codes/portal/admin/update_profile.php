<?php
include_once("common_include.php");

if($_REQUEST['action_perform'] == 'update_profile')
{
	//update student info
	$student_data_array = [
				'name' => $_REQUEST['student_name'],
				'dob' => strtotime($_REQUEST['student_dob']),
				'mobile' => $_REQUEST['student_mobile'],
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
					'comment' => 'profile updated',
					'activity_by' => 'admin',
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
						'student_email' => $_REQUEST['student_email'],
						'student_brief_note' => $_REQUEST['student_brief_note'],
						'updation_remark' => $_REQUEST['updation_remark'],
						'datentime' => strtotime('now'),
						];

	insertData('urn_audit_history', $urn_audit_history_array, $con);

	header("Location:urn_history.php?lead_id=".$_REQUEST['lead_id']."&tab=profile");
}

?>
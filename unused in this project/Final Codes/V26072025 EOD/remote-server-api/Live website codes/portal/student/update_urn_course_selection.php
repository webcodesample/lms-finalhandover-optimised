<?php
include_once("common_include.php");

//update course selection for requested lead_id/urn
$data_array = [
				'course_id' => $_REQUEST['course_id'],
				];

$where_con_array = [
					'id' => $_REQUEST['lead_id'] 
					];
updateData('leads_details',$data_array,$where_con_array,$con);

//insert leads_activity_history
$current_status_id = getFieldValue('status_id','id',$_REQUEST['lead_id'],'leads_details',$con);

$activty_info_array = [
				'lead_id' => $_REQUEST['lead_id'],
				'status_id' => $current_status_id,
				'comment' => 'course selection updated',
				'activity_by' => 'Student Dashboard',
				'datentime' => strtotime('now'),
				];
insertData('leads_activity_history',$activty_info_array,$con);

//get urn detail for requested lead_id
$student_id = getFieldValue('student_id','id',$_REQUEST['lead_id'],'leads_details',$con);
$where_con_array = [ 'id' => $student_id];
$student = mysqli_fetch_assoc(getRowsDataCon('students',$where_con_array,$con));

//insert urn_audit_history
$urn_audit_history_array = [
					'lead_id' => $_REQUEST['lead_id'],
					'course_id' => $_REQUEST['course_id'],
					'status_id' => $current_status_id,
					'student_name' => $student['name'],
					'student_dob' => $student['dob'],
					'student_mobile' => $student['mobile'],
					'student_email' => $student['email'],
					'student_brief_note' => $student['brief_note'],
					'updation_remark' => 'course selection updated by student',
					'datentime' => strtotime('now'),
					'updated_columns' => 'course',
					];

insertData('urn_audit_history', $urn_audit_history_array, $con);


header("Location:urn_details.php?lead_id=".$_REQUEST['lead_id']."&tab=profile");

?>
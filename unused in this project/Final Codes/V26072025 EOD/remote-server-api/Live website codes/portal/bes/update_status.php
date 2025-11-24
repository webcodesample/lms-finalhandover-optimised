<h4>Update Status</h4>
<?php
include_once("common_include.php");
$where_con_array = [
					'id' => $_REQUEST['current_status_id'],
					'batch_id' => $_REQUEST['current_status_batch_id'],
					];
$current_status_step_order = getFieldValueMultiCon('step_order',setWhereClause($where_con_array),'lead_status_list',$con);

$where_con_array_status = [
							'step_order' => ($current_status_step_order + 1),
							'batch_id' => $_REQUEST['current_status_batch_id'],
							];
$next_status_id = getFieldValueMultiCon('id',setWhereClause($where_con_array_status),'lead_status_list',$con);

$where_con = ['id' => $_REQUEST['lead_id'],];

//update lead status in leads_details tbl
if(isset($_REQUEST['application_point_id']) && $_REQUEST['application_point_id'])
	$application_point_id = $_REQUEST['application_point_id'];
else
	$application_point_id = 0;

$lead_data = [
				'status_id'	 => $next_status_id,
				'application_point_id' => $application_point_id,
			];

updateData('leads_details',$lead_data,$where_con,$con);

//update lead status in leads_activity_history tbl
$lead_activity_data = [
						'lead_id' => $_REQUEST['lead_id'],
						'status_id' => $next_status_id,
						'comment' => 'Status Updated',
						'activity_by' => $_SESSION['staff_ref_id'],
						'datentime' => strtotime('now'),
					];

insertData('leads_activity_history',$lead_activity_data,$con);

//insert urn_audit_history
$urn_student_id = getFieldValue('student_id','id',$_REQUEST['lead_id'],'leads_details',$con);
$course_id = getFieldValue('course_id','id',$_REQUEST['lead_id'],'leads_details',$con);

$where_con_array = [
					'id' => $urn_student_id,
					];

$student_info = mysqli_fetch_assoc(getRowsDataCon('students',$where_con_array,$con));

$urn_audit_history_array = [
							'lead_id' => $_REQUEST['lead_id'],
							'course_id' => $course_id,
							'status_id' => $next_status_id,
							'student_name' => $student_info['name'],
							'student_mobile' => $student_info['mobile'],
							'student_mobile_alt' => $student_info['alternate_mobile'],
							'student_email' => $student_info['email'],
							'student_dob' => $student_info['dob'],
							'student_brief_note' => $student_info['brief_note'],
							'updation_remark' => 'Status Updated',
							'datentime' => strtotime('now'),
							'updated_columns' => 'status',
							];

insertData('urn_audit_history', $urn_audit_history_array, $con);

header("Location:urn_history.php?lead_id=".$_REQUEST['lead_id']."&tab=history");
?>
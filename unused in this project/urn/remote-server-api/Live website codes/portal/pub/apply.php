<?php
include_once("common_include.php");
$step1_display = "";
$step2_display = "none";

$email_flag = 0;
$mobile_flag = 0;
if(checkIsRequested('action_perform'))
{
	//check lead data email duplicacy
	if(isset($_REQUEST['email']) && $_REQUEST['email'])
	{	
		$temp_lead_email_count = getRowCount('email',$_REQUEST['email'],'temp_leads',$con);
		$student_email_count = getRowCount('email',$_REQUEST['email'],'students',$con);
		if(($temp_lead_email_count < 1) && ($student_email_count < 1))
		{
			$email_flag = 1;
		}
	}

	//check lead data mobile duplicacy
	if(isset($_REQUEST['mobile']) && $_REQUEST['mobile'])
	{
		$temp_lead_mobile_count = getRowCount('mobile',$_REQUEST['mobile'],'temp_leads',$con);
		$student_mobile_count = getRowCount('mobile',$_REQUEST['mobile'],'students',$con);
		if(($temp_lead_mobile_count < 1) && ($student_mobile_count < 1))
		{
			$mobile_flag = 1;
		}
	}

	if($email_flag == 1 && $mobile_flag == 1)
	{
		//create student & student login details
		$student_data = [
							'name' => $_REQUEST['full_name'],
							'mobile' => $_REQUEST['mobile'],
							'email' => $_REQUEST['email'],
							'brief_note' => 'No Note',
							'userid' => $_REQUEST['email'],
							'password' => 'test1234'
						];

		$student_id = insertData('students', $student_data,$con);

		//create new lead
		$urn = createUniqueURN($con);
		$latest_status_bath_id = getMaxBatchId($con);
		$where_con_array = [
							'batch_id' => $latest_status_bath_id,
							'step_order' => 1,
							];
		$new_lead_status_id = getFieldValueMultiCon('id',setWhereClause($where_con_array),'lead_status_list',$con);

		$lead_data_array = [
					'urn' => $urn,
					'status_id' => $new_lead_status_id,
					'status_batch_id' => $latest_status_bath_id,
					'student_id' => $student_id,
					'course_id' => $_REQUEST['course'],
					'datentime' => strtotime('now'),
					'created_by' => 'ST'.$student_id,
					'source_id' => 5,
				];
	
		$inserted_lead_id = insertData('leads_details', $lead_data_array, $con);

		//insert new lead activity record
		$activty_info_array = [
							'lead_id' => $inserted_lead_id,
							'status_id' => $new_lead_status_id,
							'comment' => 'Created',
							'activity_by' => 'Student',
							'datentime' => strtotime('now'),
							];

		insertData('leads_activity_history', $activty_info_array, $con);

		//insert urn_audit_history
		$urn_audit_history_array = [
							'lead_id' => $inserted_lead_id,
							'course_id' => $_REQUEST['course'],
							'status_id' => $new_lead_status_id,
							'student_name' => $_REQUEST['full_name'],
							'student_mobile' => $_REQUEST['mobile'],
							'student_email' => $_REQUEST['email'],
							'student_brief_note' => 'No Note',
							'updation_remark' => 'Created By Student',
							'datentime' => strtotime('now'),
							];
	
		insertData('urn_audit_history', $urn_audit_history_array, $con);

		$step1_display = "none";
		$step2_display = "";
	}
	else {
		$action_perform_msg = "sorry! data already exist";
	}
}


include_once("../common/head.php");
?>


<div class="d-flex justify-content-center fs-9">
<h6 class="text-danger" style="margin-top:17%;">
<?=ucwords($action_perform_msg)?>
</h6>
<div class="card position-fixed top-50 start-50 translate-middle" style="width:300px;display:<?=$step1_display?>">
<div class="card-body">
<form method="post">
	<input type="text" class="form-control m-1" style="width:250px;" name="full_name" placeholder="Full Name" required>
	<input type="text" class="form-control m-1" style="width:250px;" name="mobile" placeholder="Mobile Number" required>
	<input type="email" class="form-control m-1" style="width:250px;" name="email" placeholder="E mail" required>
	<input type="hidden" name="course" value="<?=$_REQUEST['course']?>">
	<div class="d-flex justify-content-end">
	<input type="submit" class="btn btn-subtle-primary m-1" name="action_perform" value="Continue...">
	</div>
</form>
</div>
</div>

<div class="card m-5" style="display:<?=$step2_display?>">
<div class="card-body">
<?php include_once("apply_step2.php"); ?>
</div>
</div>
</div>
<?php include_once("../common/footer_copyright.php"); ?>


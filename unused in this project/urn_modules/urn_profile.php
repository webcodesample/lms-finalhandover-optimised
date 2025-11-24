<?php
$query_view_lead_profile = "SELECT * FROM leads_details WHERE id = '".$_REQUEST['lead_id']."'";
$result_view_lead_profile = mysqli_query($con, $query_view_lead_profile);
$lead = mysqli_fetch_assoc($result_view_lead_profile);

$urn_latest_info = getLatestUpdateRow('lead_id',$_REQUEST['lead_id'],'urn_audit_history',$con);
$student = $urn_latest_info;

if($lead['course_id'] > 0)
{
	$course_name = getFieldValue('name','id',$lead['course_id'],'course_list',$con);
	$course_type = getFieldValue('type','id',$lead['course_id'],'course_list',$con);
	$course_intake = getFieldValue('intake','id',$lead['course_id'],'course_list',$con);
	$course_duration = getFieldValue('duration','id',$lead['course_id'],'course_list',$con);
	$course_fee = getFieldValue('fee','id',$lead['course_id'],'course_list',$con);
	$course_eligibility = getFieldValue('eligibility','id',$lead['course_id'],'course_list',$con);

	$university_id = getFieldValue('university_id','id',$lead['course_id'],'course_list',$con);
	$university = getFieldValue('name','id',$university_id,'university_list',$con);	
	$country_id = getFieldValue('country_id','id',$university_id,'university_list',$con);
	$country_name = getFieldValue('name','id',$country_id,'country_list',$con);
	$currency = getFieldValue('currency','id',$country_id,'country_list',$con);
}
else 
{
	$course_name = 'Select Any Course';
	$course_type = '';
	$course_intake = '';
	$course_duration = '';
	$course_fee = '';
	$course_eligibility = '';
	$university = '';	
	$country_name = '';
	$currency = '';
}

?>

<?php
include_once("urn_profile_form.php");

if(in_array($_SESSION['login_type'],array(1,2,3,8)))
{
	include_once("modals/update_status_modal.php");

	if(checkLoginType($_SESSION['login_type']) == 1)
	include_once("modals/kill_lead_modal.php");
	else
	include_once("modals/kill_lead_modal_bes.php");

	include_once("modals/approve_lead_deletion_modal.php");
	include_once("modals/urn_rejected_modal.php");
	include_once("modals/visa_rejected_modal.php");
	include_once("modals/manage_lead_modal.php");
}
include_once("../modal_boxes/communication/urn_communication_modal.php");
?>

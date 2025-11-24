<?php
include_once("common_include.php");

$email_flag = 0;

$temp_lead_data = [
					'name' => $_REQUEST['name'],
					'datentime' => strtotime('now'),
					'creator_id' => $_SESSION['userid'],
					'creator_type' => 1,
					'source_id' => $_REQUEST['lead_source_id'],
					];


//check lead data email duplicacy
if(isset($_REQUEST['email']) && $_REQUEST['email'])
{
	$email_flag = 1;
	$temp_lead_email_count = getRowCount('email',$_REQUEST['email'],'temp_leads',$con);
	$student_email_count = getRowCount('email',$_REQUEST['email'],'students',$con);
	if(($temp_lead_email_count < 1) && ($student_email_count < 1))
	{
		$temp_lead_data = array_merge($temp_lead_data, array('email' => $_REQUEST['email']));
	}
}

//check lead data mobile duplicacy
if(isset($_REQUEST['mobile']) && $_REQUEST['mobile'])
{
	$temp_lead_mobile_count = getRowCount('mobile',$_REQUEST['mobile'],'temp_leads',$con);
	$student_mobile_count = getRowCount('mobile',$_REQUEST['mobile'],'students',$con);
	if(($temp_lead_mobile_count < 1) && ($student_mobile_count < 1))
	{
		$temp_lead_data = array_merge($temp_lead_data, array('mobile' => $_REQUEST['mobile']));
	}
}

if(count($temp_lead_data) > 6 && $email_flag == 1)
{
	insertData('temp_leads',$temp_lead_data,$con);
	$msg = "success";
}
else if(count($temp_lead_data) > 5 && $email_flag == 0)
{
	insertData('temp_leads',$temp_lead_data,$con);
	$msg = "success";
}
else 
{
	$msg = "error";
}

header("Location:temp_leads.php?msg=".$msg);
?>



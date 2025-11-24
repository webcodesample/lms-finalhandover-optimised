<?php
include_once("common_include.php");

$temp_lead_where_con_array = [ 'id' => $_REQUEST['id'], ];
$temp_lead_data = [ 'name' => $_REQUEST['name'], ];

//check lead data email duplicacy
if(isset($_REQUEST['email']) && $_REQUEST['email'])
{
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

if(count($temp_lead_data) > 1)
{
	updateData('temp_leads',$temp_lead_data,$temp_lead_where_con_array,$con);
	$msg = "success";
}
else 
{
	$msg = "error";
}

header("Location:manage_temp_lead.php?id=".$_REQUEST['id']."&msg=".$msg);
?>
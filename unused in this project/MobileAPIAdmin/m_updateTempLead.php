<?php
include_once("common_include.php");

$jsonData = file_get_contents('php://input'); // Read raw POST data from the incoming request body

$data = json_decode($jsonData, true); // Decode the JSON data into a PHP array

$temp_lead_where_con_array = [ 'id' => $data['lead_id'], ];
$temp_lead_data = [ 'name' => $data['name'], ];

//check lead data email duplicacy
if(isset($data['email']) && $data['email'])
{
	$temp_lead_email_count = getRowCount('email',$data['email'],'temp_leads',$con);
	$student_email_count = getRowCount('email',$data['email'],'students',$con);
	if(($temp_lead_email_count < 1) && ($student_email_count < 1))
	{
		$temp_lead_data = array_merge($temp_lead_data, array('email' => $data['email']));
	}
}

//check lead data mobile duplicacy
if(isset($data['mobile']) && $data['mobile'])
{
	$temp_lead_mobile_count = getRowCount('mobile',$data['mobile'],'temp_leads',$con);
	$student_mobile_count = getRowCount('mobile',$data['mobile'],'students',$con);
	if(($temp_lead_mobile_count < 1) && ($student_mobile_count < 1))
	{
		$temp_lead_data = array_merge($temp_lead_data, array('mobile' => $data['mobile']));
	}
}

if(count($temp_lead_data) > 1)
{
	updateData('temp_leads',$temp_lead_data,$temp_lead_where_con_array,$con);
	$updateStatus = 1;
}
else
{
	$updateStatus = 0;
}

echo json_encode(array('updateStatus' => $updateStatus));
die();
?>
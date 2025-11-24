<?php
include_once("common_include.php");

$education_name = ['Masters/PG', 'Bachelor/Graduate', '10+2', 'Matric/10th'];

$where_con_array = [ 'id' => $_REQUEST['leadid']];

$urndetails = getRowsDataCon('leads_details',$where_con_array,$con);

$lead = mysqli_fetch_assoc($urndetails);
$urn = $lead['urn'];
$status_where_con_array = [ 
							'id' => $lead['status_id'],
							'batch_id' => $lead['status_batch_id'],
							];

//urn info
$lead = getLatestUpdateRow('lead_id',$_REQUEST['leadid'],'urn_audit_history',$con);

//status info
$lead['status'] = getFieldValueMultiCon('description',setWhereClause($status_where_con_array),'lead_status_list',$con);
$lead['urn'] = $urn;

if($lead['highest_education_type']>0)
$lead['highest_education_type'] = $education_name[$lead['highest_education_type']-1];
else
$lead['highest_education_type'] = '';

$lead['passport_issued_on'] = date('Y-m-d',$lead['passport_issued_on']);
$lead['passport_valid_till'] = date('Y-m-d',$lead['passport_valid_till']);
$lead['student_dob'] = date('Y-m-d',$lead['student_dob']);

if($lead['course_id'] > 0)
{
	$lead['course_name'] = getFieldValue('name','id',$lead['course_id'],'course_list',$con);
	$lead['course_type']= getFieldValue('type','id',$lead['course_id'],'course_list',$con);
	$lead['course_intake'] = getFieldValue('intake','id',$lead['course_id'],'course_list',$con);
	$lead['course_duration'] = getFieldValue('duration','id',$lead['course_id'],'course_list',$con);
	$lead['course_fee'] = getFieldValue('fee','id',$lead['course_id'],'course_list',$con);
	$lead['course_eligibility'] = getFieldValue('eligibility','id',$lead['course_id'],'course_list',$con);

	$university_id = getFieldValue('university_id','id',$lead['course_id'],'course_list',$con);
	$lead['university'] = getFieldValue('name','id',$university_id,'university_list',$con);	
	$country_id = getFieldValue('country_id','id',$university_id,'university_list',$con);
	$lead['country_name'] = getFieldValue('name','id',$country_id,'country_list',$con);
	$lead['currency'] = getFieldValue('currency','id',$country_id,'country_list',$con);
}


echo json_encode($lead);
?>

<?php
include_once("common_include.php");

$urn_info = getLatestUpdateRow('lead_id',$_REQUEST['lead_id'],'urn_audit_history',$con);

$urn = getFieldValue('urn','id',$_REQUEST['lead_id'],'leads_details',$con);
$lead_created_on_datentime = getFieldValue('datentime','id',$_REQUEST['lead_id'],'leads_details',$con);
$where_con_array = ['id' => $urn_info['course_id']];
$urn_course = mysqli_fetch_assoc(getRowsDataCon('course_list',$where_con_array,$con));

$university = getFieldValue('name','id',$urn_course['university_id'],'university_list',$con);
$country_id = getFieldValue('country_id','id',$urn_course['university_id'],'university_list',$con);

include_once("content_layout.php");
?>
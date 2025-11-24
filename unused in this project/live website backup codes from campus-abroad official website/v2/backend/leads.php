<?php
include_once("common_include.php");

$where_con = "WHERE 1 ";

if(isset($_REQUEST['status']) && $_REQUEST['status'])
$where_con .= "AND lsl.description = '".$_REQUEST['status']."'";

if(isset($_REQUEST['search_by']) && $_REQUEST['search_by'] == 'urn')
{
	$where_con .= "AND ld.urn = '".substr($_REQUEST['search_text'],2)."'";
}

if(isset($_REQUEST['search_by']) && $_REQUEST['search_by'] == 'name')
{
	$where_con .= "AND st.name LIKE '%".$_REQUEST['search_text']."%'";
}

if(isset($_REQUEST['search_by']) && $_REQUEST['search_by'] == 'mobile')
{
	$where_con .= "AND st.mobile = '".$_REQUEST['search_text']."'";
}

if(isset($_REQUEST['search_by']) && $_REQUEST['search_by'] == 'email')
{
	$where_con .= "AND st.email LIKE '%".$_REQUEST['search_text']."%'";
}

$query_view_lead = "SELECT *, ld.id AS lead_id, ld.datentime AS lead_created_on, st.name AS student_name, cl.name AS course_name FROM leads_details AS ld JOIN lead_status_list AS lsl ON ld.status_id = lsl.id JOIN course_list AS cl ON ld.course_id = cl.id JOIN students AS st ON ld.student_id = st.id ".$where_con." ORDER BY ld.datentime DESC";
$result_view_leads = mysqli_query($con, $query_view_lead);
$total_leads = mysqli_num_rows($result_view_leads);

include_once("content_layout.php");
?>
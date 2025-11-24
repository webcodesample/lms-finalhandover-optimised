<?php
include_once("common_include.php");

$where_con = "WHERE 1 ";

if(in_array($_SESSION['login_type'],array(4,6)))
$where_con .= "AND LD.allocated_id = '".$_SESSION['user_ref_id']."' ";

if(isset($_REQUEST['status']) && $_REQUEST['status'])
$where_con .= "AND LSL.description = '".$_REQUEST['status']."'";
else
$where_con .= "AND LSL.description != 'Deleted'";

if(isset($_REQUEST['search_by']) && $_REQUEST['search_by'] == 'urn')
{
	$where_con .= "AND LD.urn LIKE '%".$_REQUEST['search_text']."%'";
}

if(isset($_REQUEST['search_by']) && $_REQUEST['search_by'] == 'name')
{
	$where_con .= "AND UAH.student_name LIKE '%".$_REQUEST['search_text']."%'";
}

if(isset($_REQUEST['search_by']) && $_REQUEST['search_by'] == 'mobile')
{
	$where_con .= "AND UAH.student_mobile LIKE '%".$_REQUEST['search_text']."%'";
}

if(isset($_REQUEST['search_by']) && $_REQUEST['search_by'] == 'email')
{
	$where_con .= "AND UAH.student_email LIKE '%".$_REQUEST['search_text']."%'";
}

//$query_view_lead = "SELECT *, ld.id AS lead_id, ld.datentime AS lead_created_on, st.name AS student_name, cl.name AS course_name FROM leads_details AS ld JOIN lead_status_list AS lsl ON ld.status_id = lsl.id JOIN course_list AS cl ON ld.course_id = cl.id JOIN students AS st ON ld.student_id = st.id ".$where_con." ORDER BY ld.datentime DESC";
$comp_query = "SELECT MAX(id) AS audit_id FROM urn_audit_history GROUP BY lead_id";
$query_view_lead = "SELECT *,LD.id AS lead_id,LD.datentime AS lead_created_on FROM urn_audit_history AS UAH JOIN (".$comp_query.") AS MI ON UAH.id = MI.audit_id JOIN leads_details AS LD ON UAH.lead_id = LD.id JOIN lead_status_list AS LSL ON LD.status_id = LSL.id ".$where_con." ORDER BY UAH.datentime DESC";

$result_view_leads = mysqli_query($con, $query_view_lead);
$total_leads = mysqli_num_rows($result_view_leads);

include_once("content_layout.php");
?>
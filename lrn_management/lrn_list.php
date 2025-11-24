<?php
include_once("common_include.php");

$where_con = "WHERE 1 ";

if(in_array($_SESSION['login_type'],array(4,6)))
$where_con .= "AND LD.allocated_id = '".$_SESSION['user_ref_id']."' ";

if(isset($_REQUEST['status']) && $_REQUEST['status'])
$where_con .= "AND LSL.description = '".$_REQUEST['status']."'";
else
$where_con .= "AND LSL.description != 'Deleted'";

if(isset($_REQUEST['search_by']) && $_REQUEST['search_by'] == 'lrn')
{
	$where_con .= "AND LAH.lrn LIKE '%".$_REQUEST['search_text']."%'";
}

if(isset($_REQUEST['search_by']) && $_REQUEST['search_by'] == 'name')
{
	$where_con .= "AND LAH.name LIKE '%".$_REQUEST['search_text']."%'";
}

if(isset($_REQUEST['search_by']) && $_REQUEST['search_by'] == 'mobile')
{
	$where_con .= "AND LAH.mobile LIKE '%".$_REQUEST['search_text']."%'";
}

if(isset($_REQUEST['search_by']) && $_REQUEST['search_by'] == 'email')
{
	$where_con .= "AND LAH.email LIKE '%".$_REQUEST['search_text']."%'";
}

$comp_query = "SELECT MAX(id) AS audit_id FROM lrn_audit_history GROUP BY lrn";
//$query_view_lrn = "SELECT *,LL.datentime AS lrn_created_on FROM lrn_audit_history AS LAH JOIN (".$comp_query.") AS MI ON LAH.id = MI.audit_id JOIN lrn_list AS LL ON LAH.lrn = LL.lrn JOIN lead_status_list AS LSL ON LD.status_id = LSL.id ".$where_con." ORDER BY LAH.datentime DESC";
$query_view_lrn = "SELECT * FROM lrn_audit_history AS LAH JOIN (".$comp_query.") AS MI ON LAH.id = MI.audit_id JOIN lead_status_list AS LSL ON LAH.status_id = LSL.id ".$where_con." ORDER BY LAH.datentime DESC";

$result_view_lrns = mysqli_query($con, $query_view_lrn);
$total_lrns = mysqli_num_rows($result_view_lrns);

include_once("content_layout.php");
?>
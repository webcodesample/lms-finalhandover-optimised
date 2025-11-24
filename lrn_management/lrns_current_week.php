<?php
include_once("common_include.php");

if(date('l',strtotime('now')) == 'Monday')
{
    $current_week_start = strtotime("today");
}
else
{    
    $current_week_start = strtotime("Last Monday");
    $current_week_start_date = date('d',$current_week_start);
    $current_week_start_month = date('m',$current_week_start);
}

$current_week_end = getWeekEnd();

$where_con_array_this_week = [ ("datentime >". $current_week_start), ("datentime <". $current_week_end)];
$current_week_lrn_count = getRowCountMultiCol(setWhereClauseAdvance($where_con_array_this_week),'lrn_list',$con);

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

$comp_query = "SELECT lrn FROM lrn_list WHERE datentime > ".$current_week_start." AND datentime < ".$current_week_end;
$query_view_lrn = "SELECT * FROM lrn_audit_history AS LAH JOIN (".$comp_query.") AS CWLRN ON LAH.lrn = CWLRN.lrn JOIN lead_status_list AS LSL ON LAH.status_id = LSL.id ".$where_con." ORDER BY LAH.datentime DESC";

$result_view_lrns = mysqli_query($con, $query_view_lrn);
$total_lrns = mysqli_num_rows($result_view_lrns);

include_once("content_layout.php");
?>
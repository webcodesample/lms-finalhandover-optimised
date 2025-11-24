<?php
include_once("common_include.php");

$where_con = "WHERE hidden = 0 AND creator_id = ".$_SESSION['userid']." AND creator_type = ".$_SESSION['login_type'];
$orderby_clause = " ORDER BY datentime DESC";

$search_name = "";
$search_email = "";
$search_mobile = "";
$search_source = "";
$clear_filter_btn = "";
$search_form_display_class = "d-none";

if(isset($_REQUEST['action_perform']))
{
	$_REQUEST['msg'] = "";

	if(isset($_REQUEST['search_name']))
	{
		$search_name .= $_REQUEST['search_name'];
		$where_con .= " AND name LIKE '%".$_REQUEST['search_name']."%'";
	}

	if(isset($_REQUEST['search_mobile']))
	{
		$search_mobile .= $_REQUEST['search_mobile'];
		$where_con .= " AND mobile LIKE '%".$_REQUEST['search_mobile']."%'";
	}

	if(isset($_REQUEST['search_email']))
	{
		$search_email .= $_REQUEST['search_email'];
		$where_con .= " AND email LIKE '%".$_REQUEST['search_email']."%'";
	}

	if(isset($_REQUEST['search_source']) && $_REQUEST['search_source'])
	{
		$search_source .= $_REQUEST['search_source'];
		$where_con .= " AND source_id = ".$_REQUEST['search_source'];
	}

	$clear_filter_btn .= "<a href='temp_leads.php' class='btn btn-sm btn-subtle-info m-1 px-2'>Clear Filter</a>";
	$search_form_display_class = "";
}

$search_query = "SELECT * FROM temp_leads ".$where_con.$orderby_clause;
$temp_leads_list = mysqli_query($con,$search_query);

include_once("content_layout.php");
?>
<?php
include_once("common_include.php");

$where_con = "WHERE 1";

$search_email_type = "";
$search_email_subject = "";
$search_sender = "";
$search_recipient = "";
$clear_filter_btn = "";
$search_form_display_class = "d-none";

if(isset($_REQUEST['action_perform']))
{
	$_REQUEST['msg'] = "";

	if(isset($_REQUEST['search_email_type']) && $_REQUEST['search_email_type'])
	{
		$search_email_type .= $_REQUEST['search_email_type'];
		$where_con .= " AND type LIKE '%".$_REQUEST['search_email_type']."%'";
	}

	if(isset($_REQUEST['search_email_subject']) && $_REQUEST['search_email_subject'])
	{
		$search_email_subject .= $_REQUEST['search_email_subject'];
		$where_con .= " AND subject LIKE '%".$_REQUEST['search_email_subject']."%'";
	}

	if(isset($_REQUEST['search_sender']))
	{
		$search_sender .= $_REQUEST['search_sender'];
		$where_con .= " AND sender LIKE '%".$_REQUEST['search_sender']."%'";
	}

	if(isset($_REQUEST['search_recipient']))
	{
		$search_recipient .= $_REQUEST['search_recipient'];
		$where_con .= " AND recipients LIKE '%".$_REQUEST['search_recipient']."%'";
	}

	$clear_filter_btn .= "<a href='email_history.php' class='btn btn-sm btn-subtle-info m-1 px-2'>Clear Filter</a>";
	$search_form_display_class = "";
}

$email_history_list_query = "SELECT * FROM email_history ".$where_con." ORDER BY datentime DESC";
$email_history_list = mysqli_query($con,$email_history_list_query);

include_once("content_layout.php");
?>
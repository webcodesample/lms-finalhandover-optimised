<?php
include_once("common_include.php");

$where_con = "";

$search_trigger_type = "";
$search_sender = "";
$search_recipient = "";
$clear_filter_btn = "";
$search_form_display_class = "d-none";

if(isset($_REQUEST['action_perform']))
{
	$_REQUEST['msg'] = "";

	if(isset($_REQUEST['search_trigger_type']) && $_REQUEST['search_trigger_type'])
	{
		$search_trigger_type .= $_REQUEST['search_trigger_type'];
		$where_con .= " AND email_trigger_type LIKE '%".$_REQUEST['search_trigger_type']."%'";
	}

	if(isset($_REQUEST['search_sender']))
	{
		$search_sender .= $_REQUEST['search_sender'];
		$where_con .= " AND from_email LIKE '%".$_REQUEST['search_sender']."%'";
	}

	if(isset($_REQUEST['search_recipient']))
	{
		$search_recipient .= $_REQUEST['search_recipient'];
		$where_con .= " AND to_emails LIKE '%".$_REQUEST['search_recipient']."%'";
	}

	$clear_filter_btn .= "<a href='email_alerts_settings.php' class='btn btn-sm btn-subtle-info m-1 px-2'>Clear Filter</a>";
	$search_form_display_class = "";
}

$email_alert_list_query = "SELECT * FROM email_alerts_setup WHERE 1".$where_con." ORDER BY email_trigger_type ASC";
$email_alert_list = mysqli_query($con, $email_alert_list_query);

include_once("content_layout.php");
?>
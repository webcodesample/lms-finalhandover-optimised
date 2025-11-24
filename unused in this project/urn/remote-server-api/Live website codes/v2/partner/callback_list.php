<?php
include_once("common_include.php");

$all_callback = "";
$past_callback = "";
$today_callback = "";
$future_callback = "";

//total callback list & count for current agent
$callback_list_query = "SELECT *,CBL.id AS callback_id FROM callback_list AS CBL JOIN leads_details AS LD ON CBL.lead_id = LD.id WHERE LD.allocated_id = '".$_SESSION['user_ref_id']."'";
$callback_list = mysqli_query($con, $callback_list_query);
$callback_count = mysqli_num_rows($callback_list);

//past callback list & count for current agent
$past_callback_list_query = "SELECT *,CBL.id AS callback_id FROM callback_list AS CBL JOIN leads_details AS LD ON CBL.lead_id = LD.id WHERE CBL.callback_datentime < ".strtotime('today')." AND LD.allocated_id = '".$_SESSION['user_ref_id']."'";
$past_callback_list = mysqli_query($con, $past_callback_list_query);
$past_callback_count = mysqli_num_rows($past_callback_list);

//today callback list & count for current agent
$today_callback_list_query = "SELECT *,CBL.id AS callback_id FROM callback_list AS CBL JOIN leads_details AS LD ON CBL.lead_id = LD.id WHERE CBL.callback_datentime > ".strtotime('today')." AND CBL.callback_datentime < ".strtotime('tomorrow')." AND LD.allocated_id = '".$_SESSION['user_ref_id']."'";
$today_callback_list = mysqli_query($con, $today_callback_list_query);
$today_callback_count = mysqli_num_rows($today_callback_list);

//today callback list & count for current agent
$future_callback_list_query = "SELECT *,CBL.id AS callback_id FROM callback_list AS CBL JOIN leads_details AS LD ON CBL.lead_id = LD.id WHERE CBL.callback_datentime > ".strtotime('tomorrow')." AND LD.allocated_id = '".$_SESSION['user_ref_id']."'";
$future_callback_list = mysqli_query($con, $future_callback_list_query);
$future_callback_count = mysqli_num_rows($future_callback_list);

if(isset($_REQUEST['tab']) && $_REQUEST['tab'] == 'past')
{
	$past_callback = "active";
	$callback_list = $past_callback_list;
}
else if(isset($_REQUEST['tab']) && $_REQUEST['tab'] == 'today')
{
	$today_callback = "active";
	$callback_list = $today_callback_list;
}
else if(isset($_REQUEST['tab']) && $_REQUEST['tab'] == 'future')
{
	$future_callback = "active";
	$callback_list = $future_callback_list;
}
else 
{
	$all_callback = "active";
	$callback_list = $callback_list;
}

include_once("content_layout.php")
?>

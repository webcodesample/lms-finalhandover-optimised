<?php
include_once("common_include.php");

$all_callback = "";
$past_callback = "";
$today_callback = "";
$future_callback = "";
$orderby_clause = " ORDER BY callback_datentime DESC";

//condition array as per day criteria
$where_con_array_past = [ ("callback_datentime <". strtotime('today'))];
$where_con_array_today = [ ("callback_datentime >". strtotime('today')),("callback_datentime <". strtotime('tomorrow'))];
$where_con_array_future = [ ("callback_datentime >". strtotime('tomorrow'))];

//callback count as per selected criteria
$past_callback_count = getRowCountMultiCol(setWhereClauseAdvance($where_con_array_past),'callback_list',$con);
$today_callback_count = getRowCountMultiCol(setWhereClauseAdvance($where_con_array_today),'callback_list',$con);
$future_callback_count = getRowCountMultiCol(setWhereClauseAdvance($where_con_array_future),'callback_list',$con);

if(isset($_REQUEST['tab']) && $_REQUEST['tab'] == 'past')
{
	$past_callback = "active";
	$callback_list = getRowsDataConAdvance('callback_list',$where_con_array_past,$con,$orderby_clause);
}
else if(isset($_REQUEST['tab']) && $_REQUEST['tab'] == 'today')
{
	$today_callback = "active";
	$callback_list = getRowsDataConAdvance('callback_list',$where_con_array_today,$con,$orderby_clause);
}
else if(isset($_REQUEST['tab']) && $_REQUEST['tab'] == 'future')
{
	$future_callback = "active";
	$callback_list = getRowsDataConAdvance('callback_list',$where_con_array_future,$con,$orderby_clause);
}
else 
{
	$all_callback = "active";
	$callback_list = getRowsData('callback_list',$con,'callback_datentime','DESC');
}

include_once("content_layout.php")
?>

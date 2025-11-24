<?php

include_once("common_include.php");

$all_agents = "";
$active_agents = "";
$inactive_agents = "";
$reset_url = "agent_list.php";
$orderby_clause = " ORDER BY name ASC";

$where_con_array = [];

if(isset($_REQUEST['name']) && $_REQUEST['name'])
$where_con_array = array_merge($where_con_array,array('name' => $_REQUEST['name']));

if(isset($_REQUEST['email']) && $_REQUEST['email'])
$where_con_array = array_merge($where_con_array,array('email' => $_REQUEST['email']));

if(isset($_REQUEST['mobile']) && $_REQUEST['mobile'])
$where_con_array = array_merge($where_con_array,array('mobile' => $_REQUEST['mobile']));

if(isset($_REQUEST['whatsapp']) && $_REQUEST['whatsapp'])
$where_con_array = array_merge($where_con_array,array('whatsapp' => $_REQUEST['whatsapp']));

if(isset($_REQUEST['company_name']) && $_REQUEST['company_name'])
$where_con_array = array_merge($where_con_array,array('company_name' => $_REQUEST['company_name']));


if(isset($_REQUEST['status']) && $_REQUEST['status'] != '')
{
	$status = $_REQUEST['status'];
	$reset_url .= "?status=".$_REQUEST['status'];

	if($status)
	$active_agents = "active";
	else
	$inactive_agents = "active";

	$where_con_array = array_merge($where_con_array, array( 'status' => $status));
	$agent_list = getRowsDataCon('agent_list',$where_con_array,$con,$orderby_clause);
}
else
{
	$all_agents = "active";
	$agent_list = getRowsDataCon('agent_list',$where_con_array,$con,$orderby_clause);
}

include_once("content_layout.php");
?>
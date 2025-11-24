<?php

include_once("common_include.php");

$all_sales_person = "";
$active_sales_person = "";
$inactive_sales_person = "";
$reset_url = "sales_person_list.php";
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
	$active_sales_person = "active";
	else
	$inactive_sales_person = "active";

	$where_con_array = array_merge($where_con_array, array( 'status' => $status));
	$sales_person_list = getRowsDataCon('sales_person_list',$where_con_array,$con,$orderby_clause);
}
else
{
	$all_sales_person = "active";
	$sales_person_list = getRowsDataCon('sales_person_list',$where_con_array,$con,$orderby_clause);
}

include_once("content_layout.php");
?>
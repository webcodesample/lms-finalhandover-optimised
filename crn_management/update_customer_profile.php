<?php
include_once("common_include.php");

//step 1 :update customer profile
$where_con_array = [ 'id' => $_REQUEST['crn'], ];

$customer_data = $_REQUEST;
unset($customer_data['crn']);

updateData('customers_list',$customer_data,$where_con_array,$con);

$where_con_array =['crn' => $_REQUEST['crn']];
$company_detail = ['name' => $_REQUEST['company_name']];
updateData('crn_company_details',$company_detail,$where_con_array,$con);

header("Location:../crn_management/manage_crn.php?crn=".$_REQUEST['crn']."&tab=basic_details");
?>
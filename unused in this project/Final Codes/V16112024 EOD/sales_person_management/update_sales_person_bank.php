<?php
include_once("common_include.php");

$where_con_array = [ 'id' => $_REQUEST['sales_person_id'], ];

$sales_person_bank_info = $_REQUEST;
unset($sales_person_bank_info['sales_person_id']);

updateData('sales_person_list',$sales_person_bank_info,$where_con_array,$con);

header("Location:manage_sales_person.php?sales_person_id=".$_REQUEST['sales_person_id']."&tab=bank");
?>
<?php
include_once("common_include.php");

$where_con_array = [ 'id' => $_REQUEST['sales_person_id'], ];

$data_array = [ 'status' => $_REQUEST['status'], ];

updateData('sales_person_list',$data_array,$where_con_array,$con);

$where_con_array_login_detail = [ 'ref_id' => 'SP'.$_REQUEST['sales_person_id'], ];

$data_array_login_detail = [ 'status' => $_REQUEST['status'], ];

updateData('login_detail',$data_array_login_detail,$where_con_array_login_detail,$con);

header("Location:sales_person_list.php");

?>
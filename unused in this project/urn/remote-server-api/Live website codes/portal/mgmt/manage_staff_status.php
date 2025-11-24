<?php
include_once("common_include.php");

$where_con_array_login_detail = [ 'ref_id' => 'BS'.$_REQUEST['staff_id'], ];

$data_array_login_detail = [ 'status' => $_REQUEST['status'], ];

updateData('login_detail',$data_array_login_detail,$where_con_array_login_detail,$con);

header("Location:staff_list.php");

?>
<?php
include_once("common_include.php");

//update staff login status
$where_con_array_login_detail = [ 'ref_id' => 'BS'.$_REQUEST['staff_id'], ];

$data_array_login_detail = [ 'status' => $_REQUEST['status'], ];

updateData('login_detail',$data_array_login_detail,$where_con_array_login_detail,$con);

//update staff status
$where_con_array_staff = [ 'id' => $_REQUEST['staff_id'], ];

$data_array_staff = [ 'status' => $_REQUEST['status'], ];

updateData('staff_list',$data_array_staff,$where_con_array_staff,$con);

header("Location:staff_list.php");

?>
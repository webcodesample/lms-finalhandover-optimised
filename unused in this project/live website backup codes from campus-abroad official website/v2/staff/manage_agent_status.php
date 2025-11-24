<?php
include_once("common_include.php");

$where_con_array = [ 'id' => $_REQUEST['agent_id'], ];

$data_array = [ 'status' => $_REQUEST['status'], ];

updateData('agent_list',$data_array,$where_con_array,$con);

$where_con_array_login_detail = [ 'ref_id' => 'SA'.$_REQUEST['agent_id'], ];

$data_array_login_detail = [ 'status' => $_REQUEST['status'], ];

updateData('login_detail',$data_array_login_detail,$where_con_array_login_detail,$con);

header("Location:agent_list.php");

?>
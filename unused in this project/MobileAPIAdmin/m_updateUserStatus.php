<?php
include_once("common_include.php");

$jsonData = file_get_contents('php://input'); // Read raw POST data from the incoming request body

$data = json_decode($jsonData, true); // Decode the JSON data into a PHP array

$user_current_status = getFieldValue('status','ref_id',$data['user_ref_id'],'login_detail',$con);

if($user_current_status == 1)
$new_status = 0;
else
$new_status = 1;

$where_con_array_login_detail = [ 'ref_id' => $data['user_ref_id'], ];
$data_array_login_detail = [ 'status' => $new_status, ];
updateData('login_detail',$data_array_login_detail,$where_con_array_login_detail,$con);

$userid = substr($data['user_ref_id'],2);
$userid_prefix = substr($data['user_ref_id'],0,2);
$where_con_array = [ 'id' => $userid, ];
$data_array = [ 'status' => $new_status, ];

if($userid_prefix == 'SA')
updateData('agent_list',$data_array,$where_con_array,$con);
else if($userid_prefix == 'SP')
updateData('sales_person_list',$data_array,$where_con_array,$con);
else if($userid_prefix == 'BS')
updateData('staff_list',$data_array,$where_con_array,$con);

echo json_encode(array('updateStatus' => 1));
die();
?>
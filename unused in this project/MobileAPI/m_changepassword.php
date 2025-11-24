<?php
include_once("common_include.php");

$jsonData = file_get_contents('php://input'); // Read raw POST data from the incoming request body

$data = json_decode($jsonData, true); // Decode the JSON data into a PHP array

// Simulate user authentication (this would normally be a database check)
$id = $data['id'];
$password = $data['password'];

$data_array = [
				'password' => $password,
			];

$where_con_array = [ 'ref_id' => 'ST'.$id, ];

updateData('login_detail',$data_array,$where_con_array,$con);

echo json_encode('Password Successfuly Updated');

die();
?>
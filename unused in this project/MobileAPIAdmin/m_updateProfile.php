<?php
include_once("common_include.php");

$jsonData = file_get_contents('php://input'); // Read raw POST data from the incoming request body

$data = json_decode($jsonData, true); // Decode the JSON data into a PHP array

// Simulate user authentication (this would normally be a database check)
$id = $data['id'] ?? null;
$name = $data['name'] ?? null;
$mobile = $data['mobile'];

$data_array = [
				'name' => $name,
				'mobile' => $mobile,
			];

$where_con_array = [ 'id' => $id, ];

updateData('staff_list',$data_array,$where_con_array,$con);

echo json_encode('Successfuly Updated');

die();
?>
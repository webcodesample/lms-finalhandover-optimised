<?php
include_once("common_include.php");

$jsonData = file_get_contents('php://input'); // Read raw POST data from the incoming request body

$data = json_decode($jsonData, true); // Decode the JSON data into a PHP array

$application_point_data = [
							'name' => $data['name'],
							'address' => $data['address'],
							'type' => $data['type'],
							'contact_person_name' => $data['contact_person_name'],
							'mobile' => $data['mobile'],
							'email' => $data['email'],
							'comission_percentage' => $data['comission_percentage'],
							];

insertData('application_point_list',$application_point_data,$con);

echo json_encode(array('updateStatus' => 1));
die();
?>
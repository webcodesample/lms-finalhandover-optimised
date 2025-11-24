<?php
include_once("common_include.php");

$jsonData = file_get_contents('php://input'); // Read raw POST data from the incoming request body

$data = json_decode($jsonData, true); // Decode the JSON data into a PHP array

$where_con_array = [ 'id' => $data['lead_id'], ];
$temp_lead_data = [
						'status' => 2,
						'remark' => $data['remark'],
						'hidden' => 1,
						];

updateData('temp_leads',$temp_lead_data,$where_con_array,$con);

echo json_encode(array('deleteStatus' => 1));
die();
?>
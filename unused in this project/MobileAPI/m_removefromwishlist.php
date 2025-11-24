<?php
include_once("common_include.php");

$jsonData = file_get_contents('php://input'); // Read raw POST data from the incoming request body

$data = json_decode($jsonData, true); // Decode the JSON data into a PHP array

$where_con_array = [
					'course_id' => $data['course_id'],
					'student_id' => $data['student_id']
					];
deleteData('student_wishlist',$where_con_array,$con);
?>
<?php
include_once("common_include.php");

$jsonData = file_get_contents('php://input'); // Read raw POST data from the incoming request body

$data = json_decode($jsonData, true); // Decode the JSON data into a PHP array

// Simulate user authentication (this would normally be a database check)
$id = $data['id'] ?? null;
$name = $data['name'] ?? null;
$mobile = $data['mobile'];
$altMobile = $data['altMobile'];
$dob = $data['dob'];

$data_array = [
				'name' => $name,
				'mobile' => $mobile,
				'alternate_mobile' => $altMobile,
				'dob' => strtotime($dob),
			];

$where_con_array = [ 'id' => $id, ];

updateData('students',$data_array,$where_con_array,$con);

echo json_encode('Successfuly Updated');

die();

setProfilePic($_FILES['profile_pic'],$_SESSION['user_ref_id']);

$data_array = [
				'name' => $_REQUEST['name'],
				'mobile' => $_REQUEST['mobile'],
				'email' => $_REQUEST['email'],
				'alternate_mobile' => $_REQUEST['alternate_mobile'],
				'dob' => strtotime($_REQUEST['dob']),
			];

$where_con_array = [
					'id' => $_SESSION['userid'],
				];

updateData($_SESSION['user_table'],$data_array,$where_con_array,$con);

$where_con_array_login_detail = [
					'ref_id' => $_SESSION['user_ref_id'],
				];
$login_detail_data = [
						'username' => $_REQUEST['email'],
					];

updateData('login_detail',$login_detail_data,$where_con_array_login_detail,$con);


header("Location:myaccount.php");
?>
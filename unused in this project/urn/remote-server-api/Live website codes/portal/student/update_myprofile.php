<?php
include_once("common_include.php");

setProfilePic($_FILES['profile_pic'],$_SESSION['student_ref_id']);

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

updateData('students',$data_array,$where_con_array,$con);

header("Location:myprofile.php");
?>
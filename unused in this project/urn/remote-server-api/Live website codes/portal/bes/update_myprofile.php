<?php
include_once("common_include.php");

setProfilePic($_FILES['profile_pic'],$_SESSION['staff_ref_id']);

$data_array = [
				'name' => $_REQUEST['name'],
				'mobile' => $_REQUEST['mobile'],
				'email' => $_REQUEST['email'],
			];

$where_con_array = [
					'id' => $_SESSION['userid'],
				];

updateData('staff_list',$data_array,$where_con_array,$con);

header("Location:myaccount.php");
?>
<?php
include_once("common_include.php");

setProfilePic($_FILES['profile_pic'],$_SESSION['user_ref_id']);

$data_array = [
				'name' => $_REQUEST['name'],
				'mobile' => $_REQUEST['mobile'],
				'email' => $_REQUEST['email'],
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
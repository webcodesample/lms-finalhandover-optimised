<?php
include_once("common_include.php");

$data_array = [
				'password' => password_hash($_REQUEST['new_password'],PASSWORD_DEFAULT),
			];

$where_con_array = [
					'ref_id' => $_SESSION['user_ref_id'],
				];

updateData('login_detail',$data_array,$where_con_array,$con);

header("Location:myaccount.php?tab=settings");
?>
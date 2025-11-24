<?php
include_once("common_include.php");

$data_array = [
				'password' => $_REQUEST['new_password'],
			];

$where_con_array = [
					'ref_id' => $_SESSION['staff_ref_id'],
				];

updateData('login_detail',$data_array,$where_con_array,$con);

header("Location:myaccount.php?tab=settings");
?>
<?php
include_once("common_include.php");

$data_array = [
				'password' => $_REQUEST['new_password'],
			];

$where_con_array = [
					'id' => $_SESSION['userid'],
				];

updateData('students',$data_array,$where_con_array,$con);

header("Location:mysettings.php");
?>
<?php
include_once("common_include.php");

$data_array = $_REQUEST;

$where_con_array = [
						'id' => $_SESSION['userid'],
					];

updateData($_SESSION['user_table'],$data_array,$where_con_array,$con);

header("Location:myaccount.php?tab=bank");
?>
<?php
include_once("common_include.php");
$where_con_array = [
					'id' => $_SESSION['userid'],
					];
$login_detial = mysqli_fetch_assoc(getRowsDataCon('students',$where_con_array,$con));

include_once("content_layout.php");
?>


<?php
include_once("common_include.php");

$delete_staff_query = "DELETE FROM staff_list WHERE id = '".$_REQUEST['staff_id']."'";
$delete_staff_result = mysqli_query($con,$delete_staff_query);

$delete_login_query = "DELETE FROM login_detail WHERE ref_id = 'BS".$_REQUEST['staff_id']."'";
$delete_login_result = mysqli_query($con,$delete_login_query);

header("Location: staff_list.php");
?>
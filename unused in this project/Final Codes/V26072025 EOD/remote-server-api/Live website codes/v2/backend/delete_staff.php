<?php
include_once("common_include.php");

$delete_query = "DELETE FROM staff_list WHERE id = '".$_REQUEST['staff_id']."'";
$delete_result = mysqli_query($con,$delete_query);

header("Location: staff_list.php");
?>
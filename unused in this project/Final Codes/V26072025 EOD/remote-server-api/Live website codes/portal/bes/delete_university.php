<?php
include_once("common_include.php");

$delete_query = "DELETE FROM university_list WHERE id = '".$_REQUEST['id']."'";
$delete_result = mysqli_query($con,$delete_query);

header("Location: university_list.php");
?>
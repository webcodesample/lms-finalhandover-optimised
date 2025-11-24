<?php
include_once("common_include.php");

$delete_query = "DELETE FROM course_list WHERE id = '".$_REQUEST['course_id']."'";
$delete_result = mysqli_query($con,$delete_query);

header("Location: view_course.php");
?>
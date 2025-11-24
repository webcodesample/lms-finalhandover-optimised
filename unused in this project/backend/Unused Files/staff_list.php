<?php
include_once("common_include.php");

$query_staff_list = "SELECT * FROM staff_list";
$result_staff_list = mysqli_query($con, $query_staff_list);
$total_staff = mysqli_num_rows($result_staff_list);

include_once("content_layout.php");
?>
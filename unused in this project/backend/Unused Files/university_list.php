<?php
include_once("common_include.php");

$view_query = "SELECT * FROM university_list";
$view_result = mysqli_query($con, $view_query);

include_once("content_layout.php");
?>
<?php
include_once("common_include.php");

validateLoginType($_SESSION['login_type']);

$view_query = "SELECT * FROM university_list";
$view_result = mysqli_query($con, $view_query);

include_once("content_layout.php");
?>
<?php
include_once("common_include.php");

validateLoginType($_SESSION['login_type']);

$request_list = mysqli_query($con, "SELECT * FROM customer_request_list ORDER BY datentime DESC");

include_once("content_layout.php");
?>
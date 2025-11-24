<?php
include_once("common_include.php");

if($_SESSION['login_type'] == 5)
	header("Location: ../customer/myaccount.php");
else
	include_once("content_layout.php");
?>
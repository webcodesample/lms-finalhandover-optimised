<?php
session_start();
if(!isset($_SESSION['student_username']) && $_SESSION['student_username'] == '')
{
	header("Location:login.php");
	die();
}
?>
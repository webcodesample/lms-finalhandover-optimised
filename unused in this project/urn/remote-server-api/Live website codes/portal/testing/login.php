<?php
include_once("../pub/common_include.php");

$log_flag = 0;
	
if($_REQUEST['username'] == 'Yogesh' && $_REQUEST['password'] == 'admin' && $_REQUEST['role'] == 1)
	$log_flag = 1;
else if($_REQUEST['username'] == 'Jasi' && $_REQUEST['password'] == 'Testing' && $_REQUEST['role'] == 3)
	$log_flag = 1;
else if($_REQUEST['username'] == 'Amit' && $_REQUEST['password'] == '@dmin' && $_REQUEST['role'] == 2)
	$log_flag = 1;

if($log_flag ==1)
{
	session_start();
	$_SESSION['username'] = $_REQUEST['username'];
	$_SESSION['login_type'] = $_REQUEST['role'];

	header("Location:test_report.php");
}
else
{
	header("Location:index.php");
}

?>
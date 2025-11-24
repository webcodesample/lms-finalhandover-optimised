<?php
include_once("common_include.php");

validateLoginType($_SESSION['login_type']);

if(isset($_REQUEST['id']))
$activity_by = "BS".$_REQUEST['id'];
else
$activity_by = $_SESSION['user_ref_id'];

$activity_user_name = getFieldValue('name','id',str_replace('BS','',$activity_by),'staff_list',$con);

$lan_activity_list = mysqli_query($con, "SELECT * FROM lan_activity_history WHERE activity_by = '".$activity_by."' ORDER BY datentime DESC");
$lrn_activity_list = mysqli_query($con, "SELECT * FROM lrn_activity_history WHERE activity_by = '".$activity_by."' ORDER BY datentime DESC");

include_once("content_layout.php");
?>
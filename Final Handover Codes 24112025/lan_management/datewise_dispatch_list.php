<?php
include_once("common_include.php");

validateLoginType($_SESSION['login_type']);

$start_date = strtotime($_REQUEST['date']);
//$end_date = strtotime($_REQUEST['date'].'11:59:59 PM');

//$where_con = "WHERE approval_date BETWEEN ".$start_date." AND ".$end_date;
$where_con = "WHERE status = 0 AND approval_date = ".$start_date;

$datewise_dispatch_list = mysqli_query($con, "SELECT * FROM dispatch_list ".$where_con." ORDER BY approval_datentime DESC");

include_once("content_layout.php");
?>
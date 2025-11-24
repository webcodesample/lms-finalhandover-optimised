<?php
include_once("common_include.php");

validateLoginType($_SESSION['login_type']);

$payment_date = strtotime($_REQUEST['date']);
//$end_date = strtotime($_REQUEST['date'].'11:59:59 PM');

//$where_con = "WHERE approval_date BETWEEN ".$start_date." AND ".$end_date;
$where_con = "WHERE status IN (1,2) AND collected_date = ".$payment_date;

$rcvd_payment_list = mysqli_query($con, "SELECT * FROM repayment_schedule_list ".$where_con." GROUP BY due_date ORDER BY collected_date DESC");

include_once("content_layout.php");
?>
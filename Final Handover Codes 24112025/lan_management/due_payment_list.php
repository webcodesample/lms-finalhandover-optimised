<?php
include_once("common_include.php");

validateLoginType($_SESSION['login_type']);
$where_con = "WHERE due_date >= ".strtotime('today')." AND status = 0";
//$due_payment_list = mysqli_query($con, "SELECT *, sum(due_amount) AS total_due, sum(collected_amount) AS total_collection, count(*) AS lan_count FROM repayment_schedule_list WHERE status = 0 GROUP BY due_date ORDER BY due_date ASC");
$due_payment_list = mysqli_query($con, "SELECT *, sum(due_amount) AS total_due, sum(collected_amount) AS total_collection, count(*) AS lan_count FROM repayment_schedule_list ".$where_con." GROUP BY due_date ORDER BY due_date ASC");

include_once("content_layout.php");
?>
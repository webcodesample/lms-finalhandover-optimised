<?php
include_once("common_include.php");

validateLoginType($_SESSION['login_type']);

$where_con = "WHERE status = 2 AND collected_date <= ".strtotime('today');

$rcvd_payment_list = mysqli_query($con, "SELECT *, sum(due_amount) AS total_due, sum(collected_amount) AS total_collection, count(DISTINCT lan) AS lan_count FROM repayment_schedule_list ".$where_con." GROUP BY collected_date ORDER BY collected_date DESC");

include_once("content_layout.php");
?>
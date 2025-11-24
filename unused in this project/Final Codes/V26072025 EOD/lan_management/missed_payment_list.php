<?php
include_once("common_include.php");

validateLoginType($_SESSION['login_type']);

$where_con = "WHERE status IN(0,2) AND due_date < ".strtotime('today');

$missed_payment_list = mysqli_query($con, "SELECT *, sum(due_amount) AS total_due, sum(collected_amount) AS total_collection, count(DISTINCT lan) AS lan_count FROM repayment_schedule_list ".$where_con." GROUP BY due_date ORDER BY due_date ASC");

include_once("content_layout.php");
?>
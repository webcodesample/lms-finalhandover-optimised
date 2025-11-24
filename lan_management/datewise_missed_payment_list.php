<?php
include_once("common_include.php");

validateLoginType($_SESSION['login_type']);

$missed_date = strtotime($_REQUEST['date']);
//$end_date = strtotime($_REQUEST['date'].'11:59:59 PM');

//$where_con = "WHERE approval_date BETWEEN ".$start_date." AND ".$end_date;
$where_con = "WHERE status IN (0,2) AND due_date = ".$missed_date;

$missed_payment_list = mysqli_query($con, "SELECT *, SUM(collected_amount) AS collected_amount  FROM repayment_schedule_list ".$where_con." GROUP BY lan ORDER BY due_date DESC");

include_once("content_layout.php");
?>
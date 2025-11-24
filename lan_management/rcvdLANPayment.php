<?php
include_once("common_include.php");
//include_once("generateRepaymentSchedule.php");
//include_once("generateLANLedger.php");
include_once("../common/ledger-schedule-functions.php");

$rcvdPaymentDate = strtotime('today');

print_r($_REQUEST); die();

foreach($_REQUEST['duePaymentList'] AS $duePaymentId)
{
	$duePayment = mysqli_fetch_assoc(mysqli_query($con,"SELECT * FROM repayment_schedule_list WHERE id = ".$duePaymentId));
	$rcvdPaymentData = "status = 1, collected_amount = ".$duePayment['due_amount'].", collected_date = ".$rcvdPaymentDate;
	mysqli_query($con,"UPDATE repayment_schedule_list SET ".$rcvdPaymentData." WHERE id = ".$duePaymentId);
	
	createLedgerTransaction($duePayment['lan'],$duePayment['lrn'],$duePayment['crn'],$rcvdPaymentDate,$duePayment['due_amount'],'Interest Credit',1,$con);
}

header("Location: ".$_REQUEST['return_url']);
?>
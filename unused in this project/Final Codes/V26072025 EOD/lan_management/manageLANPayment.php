<?php
include_once("common_include.php");

$_REQUEST['payment_id_list'] = explode(',',implode(',',$_REQUEST['payment_id_list']));

//print_r($_REQUEST); die();

foreach($_REQUEST['payment_id_list'] AS $id)
{
	$duePaymentId = $id;

	if($_REQUEST['action'] == 'deletePayment')
	{
		$duePayment = mysqli_fetch_assoc(mysqli_query($con,"SELECT * FROM repayment_schedule_list WHERE id = ".$duePaymentId));

		if($duePayment['due_amount'] > 0)
		{
			$rcvdPaymentData = "status = 0, collected_amount = 0, collected_date = 0";
			mysqli_query($con,"UPDATE repayment_schedule_list SET ".$rcvdPaymentData." WHERE id = ".$duePaymentId);
		}
		else
		mysqli_query($con,"DELETE FROM repayment_schedule_list WHERE id = ".$duePaymentId);
	
		updateLedgerTransaction($duePayment['lan'],$duePayment['collected_date'],$duePayment['collected_amount'],0,$con);
	}
	else
	{
		$transactionDate = strtotime($_REQUEST['transaction_date']);
		$duePayment = mysqli_fetch_assoc(mysqli_query($con,"SELECT * FROM repayment_schedule_list WHERE id = ".$duePaymentId));
		$rcvdPaymentData = "status = 1, collected_amount = ".$duePayment['due_amount'].", collected_date = ".$transactionDate;
		mysqli_query($con,"UPDATE repayment_schedule_list SET ".$rcvdPaymentData." WHERE id = ".$duePaymentId);

		if(updateLedgerTransaction($duePayment['lan'],$transactionDate,$duePayment['collected_amount'],1,$con))
		createLedgerTransaction($duePayment['lan'],$duePayment['lrn'],$duePayment['crn'],$transactionDate,$duePayment['due_amount'],'Customer Payment Received',1,$con);
	}
}
header("Location: manage_lan.php?lan=".$_REQUEST['lan']."&tab=repayment_schedule");
?>
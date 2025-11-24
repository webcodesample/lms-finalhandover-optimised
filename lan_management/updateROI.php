<?php
include_once("common_include.php");

//print_r($_REQUEST); die();

$lan = getLatestUpdateRow('lan',$_REQUEST['lan'],'lan_audit_history',$con);
$crn = getFieldValue('crn','lrn',$lan['lrn'],'lrn_list',$con);
$approval_date = getFieldValue('approval_date','lan',$lan['lan'],'dispatch_list',$con);
$loan_end_date = strtotime(setDateIncrement($lan['payment_frequency'],$lan['loan_tenure']),$approval_date);
$coming_due_date = getWEFComingDueDate($_REQUEST['lan'],strtotime($_REQUEST['wef_date']),$con);

$processing_charges = $lan['approved_loan_amount'] * getProcessingChargeRate('ROI Updation',$con)/100;
$installment_date = $coming_due_date;
createLedgerTransaction($lan['lan'],$lan['lrn'],$crn,strtotime('today'),$processing_charges,'Interest Rate Updation Fee WEF '.$_REQUEST['wef_date'],0,$con);
addtoProcessingChargesList($lan['lan'],$processing_charges,'Interest Rate Updation Fee WEF '.$_REQUEST['wef_date'],strtotime('today'),$con);
$interest_emi = round(($lan['approved_loan_amount']*$_REQUEST['new_roi'])/100);

//delete ledger records from wef_date
mysqli_query($con,"DELETE FROM lan_ledger_transactions WHERE lan = ".$lan['lan']." AND date > ".strtotime($_REQUEST['wef_date']));

$ledger_rcvd_total = mysqli_fetch_assoc(mysqli_query($con,"SELECT SUM(amount) AS total_rcvd FROM lan_ledger_transactions WHERE lan = ".$_REQUEST['lan']." AND remark LIKE '%Customer Payment Rec%' AND date <= ".strtotime($_REQUEST['wef_date'])." AND type = 1"))['total_rcvd'];
$collected_total = mysqli_fetch_assoc(mysqli_query($con,"SELECT SUM(collected_amount) AS total_rcvd FROM repayment_schedule_list WHERE lan = ".$_REQUEST['lan']." AND due_date <= ".strtotime($_REQUEST['wef_date'])." AND status IN (1,2)"))['total_rcvd'];
echo $adjustable_amount = $ledger_rcvd_total - $collected_total;

while($installment_date <= $loan_end_date)
{
	$principal = 0;
	$interest = $interest_emi;
	$other_charges = mysqli_fetch_assoc(mysqli_query($con,"SELECT SUM(other_charges) AS other_charges_sum FROM repayment_schedule_list WHERE lan = ".$_REQUEST['lan']." AND due_date = ".$installment_date))['other_charges_sum'];
	mysqli_query($con,"DELETE FROM repayment_schedule_list WHERE lan = ".$lan['lan']." AND due_date = ".$installment_date);

    if($installment_date == $loan_end_date)
    $principal = $lan['approved_loan_amount'];

    createLedgerTransaction($lan['lan'],$lan['lrn'],$crn,$installment_date,$interest,'Interest Debit',0,$con);

    if($installment_date == $coming_due_date)
    $other_charges += $processing_charges;

	$total_due = $principal + $interest + $other_charges;

    mysqli_query($con,"INSERT INTO repayment_schedule_list SET principal = ".$principal.",interest = ".$interest.", other_charges  = ".$other_charges.", due_amount = ".$total_due.", lan = ".$lan['lan'].", lrn = ".$lan['lrn'].", crn = ".$crn.", due_date = ".$installment_date);
	$installment_date = strtotime(setDateIncrement($lan['payment_frequency']),$installment_date);
}

if($adjustable_amount > 0)
{
	$installment_date = $coming_due_date;
	createLedgerTransaction($lan['lan'],$lan['lrn'],$crn,strtotime('today'),$adjustable_amount,'Amount Adjusted After Interest Update',0,$con);
	createLedgerTransaction($lan['lan'],$lan['lrn'],$crn,strtotime('today'),$adjustable_amount,'Amount Adjusted After Interest Update',1,$con);

	while($adjustable_amount > 0)
	{
		$due_balance = checkDueBalance($_REQUEST['lan'],$installment_date,$con);

		if($adjustable_amount > $due_balance)
		{
			$collected_amount = $due_balance;
			$status = 1;
		}
		else
		{
			$collected_amount = $adjustable_amount;
			$status = 2;
		}

		$rcvdPaymentData = "status = ".$status.", collected_amount = ".$collected_amount.", collected_date = ".strtotime('today');
		mysqli_query($con,"UPDATE repayment_schedule_list SET ".$rcvdPaymentData." WHERE lan = ".$_REQUEST['lan']." AND due_date = ".$installment_date);

		$installment_date = strtotime(setDateIncrement($lan['payment_frequency']),$installment_date);
		$adjustable_amount -= $due_balance;
	}
}

unset($lan['id'],$lan['updation_remark'],$lan['updated_columns']);
$lan['roi'] = $_REQUEST['new_roi'];
$lan['updated_columns'] = 'roi';
$lan['updation_remark'] = 'Interest Rate Updated';
$lan['datentime'] = strtotime('now');
	
insertData('lan_audit_history',$lan,$con);

//insert lan_activity_history
$lan_activty_info_array = [
							'lan' => $lan['lan'],
							'lrn' => $lan['lrn'],
							'comment' => 'Interest Rate Updated',
							'activity_by' => $_SESSION['user_ref_id'],
							'datentime' => strtotime('now'),
							];
insertData('lan_activity_history',$lan_activty_info_array,$con);

function checkDueBalanceNew($lan,$date,$con)
{
	return mysqli_fetch_assoc(mysqli_query($con,"SELECT due_amount FROM repayment_schedule_list WHERE lan = ".$lan." AND due_date = ".$date))['due_amount'];
}

header("Location: manage_lan.php?lan=".$_REQUEST['lan']."&tab=ledger");
?>
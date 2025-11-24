<?php
include_once("common_include.php");
include_once("generateRepaymentSchedule.php");
include_once("generateLANLedger.php");
print_r($_REQUEST); //die();
mysqli_query($con,"UPDATE lan_processing_charges_list SET status = 1, waived_on = ".strtotime('today')." WHERE id = ".$_REQUEST['id']);

$lan = getLatestUpdateRow('lan',$_REQUEST['lan'],'lan_audit_history',$con);
$crn = getFieldValue('crn','lrn',$lan['lrn'],'lrn_list',$con);
$approval_date = getFieldValue('approval_date','lan',$lan['lan'],'dispatch_list',$con);
//createLedgerTransaction($lan['lan'],$lan['lrn'],$crn,strtotime('today'),$_REQUEST['amount'],'Charges Waived off',1,$con);

$installment_date = getComingDueDate($_REQUEST['lan'],$con);
//$installment_date = strtotime(setDateIncrement($lan['payment_frequency']),$coming_due_date);
$loan_end_date = strtotime(setDateIncrement($lan['payment_frequency'],$lan['loan_tenure']),$approval_date);

//echo $existId = getFieldValueMultiCon('id',' WHERE lan = '.$_REQUEST['lan'].' AND due_date = '.$coming_due_date.' AND interest > 0','repayment_schedule_list',$con);
$waiver_amount = $_REQUEST['amount'];

while($installment_date <= $loan_end_date)
{
    $existing_scheduled_row = mysqli_fetch_assoc(mysqli_query($con,"SELECT * FROM repayment_schedule_list WHERE lan = ".$_REQUEST['lan']." AND due_date = ".$installment_date." AND interest > 0"));
    print_r($existing_scheduled_row); echo "<br>";

    if($waiver_amount > $existing_scheduled_row['due_amount'])



    if($existId)
    mysqli_query($con,"UPDATE repayment_schedule_list SET interest = interest+".$remaining_days_topup_interest.", due_amount = due_amount+".$total_due.", status = 2 WHERE id = ".$existId);
    else
    mysqli_query($con,"INSERT INTO repayment_schedule_list SET interest = ".$remaining_days_topup_interest.", due_amount = ".$total_due.", lan = ".$lan['lan'].", lrn = ".$lan['lrn'].", crn = ".$crn.", due_date = ".$coming_due_date);

    $installment_date = strtotime(setDateIncrement($lan['payment_frequency']),$installment_date);
}

function getComingDueDate($lan,$con)
{
	return mysqli_fetch_assoc(mysqli_query($con,"SELECT min(due_date) AS coming_due_date FROM repayment_schedule_list WHERE lan = ".$lan." AND due_date > ".strtotime('today')))['coming_due_date'];
}
die();
header("Location: manage_lan.php?lan=".$_REQUEST['lan']."&tab=ledger");
?>
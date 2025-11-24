<?php
include_once("common_include.php");

$lan = getLatestUpdateRow('lan',$_REQUEST['lan'],'lan_audit_history',$con);
$crn = getFieldValue('crn','lrn',$lan['lrn'],'lrn_list',$con);
$coming_due_date = getWEFComingDueDate($_REQUEST['lan'],strtotime('today'),$con);//getComingDueDate2($_REQUEST['lan'],$con);
$approval_date = getFieldValue('approval_date','lan',$lan['lan'],'dispatch_list',$con);
$topup_processing_charges = $_REQUEST['topup_amount'] * getProcessingChargeRate('Top Up',$con)/100;
$disbursed_topup_amount = $_REQUEST['topup_amount'] - $topup_processing_charges;
$installment_date = strtotime(setDateIncrement($lan['payment_frequency']),$coming_due_date);
$loan_end_date = strtotime(setDateIncrement($lan['payment_frequency'],$lan['loan_tenure']),$approval_date);

$remaining_days_topup_interest = calculateRemainingDaysTopupInterest($_REQUEST['lan'],$_REQUEST['topup_amount'],$_REQUEST['topupROI'],$_REQUEST['installmentType'],$coming_due_date,$con);
createLedgerTransaction($lan['lan'],$lan['lrn'],$crn,strtotime('today'),$topup_processing_charges,'Topup Processing Charges',0,$con);
addtoProcessingChargesList($lan['lan'],$topup_processing_charges,'Topup Processing Charges',strtotime('today'),$con);
createLedgerTransaction($lan['lan'],$lan['lrn'],$crn,strtotime('today'),$disbursed_topup_amount,'Topup Amount Disbursed',0,$con);
createLedgerTransaction($lan['lan'],$lan['lrn'],$crn,$coming_due_date,$remaining_days_topup_interest,'Remaining Days Interest on Topup',0,$con);

$topup_interest_emi = round(($_REQUEST['topup_amount']*$_REQUEST['topupROI'])/100);
$topup_principal_due = 0;
$total_due = $topup_principal_due + $remaining_days_topup_interest;// + $topup_processing_charges;

//mysqli_query($con,"UPDATE repayment_schedule_list SET principal = (principal+".$topup_principal_due."), interest = (interest+".$remaining_days_topup_interest."), due_amount = interest WHERE lan = ".$lan['lan']." AND due_date = ".$coming_due_date);

echo $existId = getFieldValueMultiCon('id',' WHERE lan = '.$_REQUEST['lan'].' AND due_date = '.$coming_due_date.' AND interest > 0','repayment_schedule_list',$con);
//die();
if($existId)
mysqli_query($con,"UPDATE repayment_schedule_list SET interest = interest+".$remaining_days_topup_interest.", due_amount = due_amount+".$total_due.", status = 2 WHERE id = ".$existId);
else
mysqli_query($con,"INSERT INTO repayment_schedule_list SET interest = ".$remaining_days_topup_interest.", due_amount = ".$total_due.", lan = ".$lan['lan'].", lrn = ".$lan['lrn'].", crn = ".$crn.", due_date = ".$coming_due_date);

//die();
while($installment_date <= $loan_end_date)
{
    $existing_scheduled_row = mysqli_fetch_assoc(mysqli_query($con,"SELECT * FROM repayment_schedule_list WHERE lan = ".$_REQUEST['lan']." AND due_date = ".$installment_date." AND interest > 0"));

    if($installment_date == $loan_end_date)
    $topup_principal_due = $_REQUEST['topup_amount'];

    $total_due = $topup_principal_due + $topup_interest_emi;

    createLedgerTransaction($lan['lan'],$lan['lrn'],$crn,$installment_date,$topup_interest_emi,'Interest on Topup',0,$con);
    //mysqli_query($con,"INSERT INTO repayment_schedule_list SET principal = ".$topup_principal_due.",interest = ".$topup_interest_emi.", due_amount = ".$total_due.", lan = ".$lan['lan'].", lrn = ".$lan['lrn'].", crn = ".$crn.", due_date = ".$installment_date);

    if($existing_scheduled_row['collected_amount'] > 0)
    {
        if(($existing_scheduled_row['due_amount']+$total_due) > $existing_scheduled_row['collected_amount'])
        $new_status = 2;
        else if(($existing_scheduled_row['due_amount']+$total_due) == $existing_scheduled_row['collected_amount'])
        $new_status = 1;
    }
    else
    $new_status = 0;

    mysqli_query($con,"UPDATE repayment_schedule_list SET principal = principal+".$topup_principal_due.",interest = interest+".$topup_interest_emi.", due_amount = due_amount+".$total_due.", status = ".$new_status." WHERE id = ".$existing_scheduled_row['id']);
    $installment_date = strtotime(setDateIncrement($lan['payment_frequency']),$installment_date);
}

unset($lan['id'],$lan['updation_remark'],$lan['updated_columns']);
$lan['approved_loan_amount'] += $_REQUEST['topup_amount'];
$lan['updated_columns'] = 'approved_loan_amount';
$lan['updation_remark'] = 'Topup Amount Approved';
$lan['datentime'] = strtotime('now');
	
insertData('lan_audit_history',$lan,$con);

//insert lan_activity_history
$lan_activty_info_array = [
							'lan' => $lan['lan'],
							'lrn' => $lan['lrn'],
							'comment' => 'Topup Amount Approved',
							'activity_by' => $_SESSION['user_ref_id'],
							'datentime' => strtotime('now'),
							];
insertData('lan_activity_history',$lan_activty_info_array,$con);

function calculateRemainingDaysTopupInterest($lan,$topupAmount,$topupROI,$paymentFrequency,$coming_due_date,$con)
{
	$remaining_days = ($coming_due_date - strtotime('today'))/(24*60*60);

    $paymentFrequency_days = [
                                'Quarterly' => 90,
                                'Yearly' => 365,
                                'Monthly' => 30,
                                'Weekly' => 7
                            ];

	$days = $paymentFrequency_days[$paymentFrequency];

    $roi_per_day = round(($topupROI / $days),2);
    return round(($topupAmount * $roi_per_day * $remaining_days)/100);
}

function getComingDueDate2($lan,$con)
{
	return mysqli_fetch_assoc(mysqli_query($con,"SELECT min(due_date) AS coming_due_date FROM repayment_schedule_list WHERE lan = ".$lan." AND due_date > ".strtotime('today')))['coming_due_date'];
}

header("Location: manage_lan.php?lan=".$_REQUEST['lan']."&tab=ledger");
?>
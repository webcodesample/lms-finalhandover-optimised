<?php
include_once("common_include.php");
//include_once("generateRepaymentSchedule.php");
//include_once("generateLANLedger.php");
include_once("../common/ledger-schedule-functions.php");
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

while($waiver_amount > 0)
{
	if($installment_date <= $loan_end_date)
	{
		$due_balance = checkDueBalance($_REQUEST['lan'],$installment_date,$con);
		$existing_scheduled_row = mysqli_fetch_assoc(mysqli_query($con,"SELECT * FROM repayment_schedule_list WHERE lan = ".$_REQUEST['lan']." AND due_date = ".$installment_date." AND interest > 0"));

		if($waiver_amount >= $due_balance)
		{
			$collected_amount = $due_balance;
			$status = 1;
		}
		else
		{
			$collected_amount = $waiver_amount;
			$status = 2;
		}
		
		if($existing_scheduled_row)
		{
			if($existing_scheduled_row['status'] == 0)
			mysqli_query($con,"UPDATE repayment_schedule_list SET interest = interest+".$remaining_days_topup_interest.", due_amount = due_amount+".$total_due.", status = 2 WHERE id = ".$existId);
		}
		else
		mysqli_query($con,"INSERT INTO repayment_schedule_list SET interest = ".$remaining_days_topup_interest.", due_amount = ".$total_due.", lan = ".$lan['lan'].", lrn = ".$lan['lrn'].", crn = ".$crn.", due_date = ".$coming_due_date);

		
		
		
		
		print_r($lan_scheduled_data);	die();
		if($lan_scheduled_data['total_collected_amount'] < $lan_scheduled_data['total_due_amount'])
		{
			if($waiver_amount >= $due_balance)
			{
				$collected_amount = $due_balance;
				$status = 1;
			}
			else
			{
				$collected_amount = $waiver_amount;
				$status = 2;
			}

			if(($lan_scheduled_data['collected_date'] == 0) || ($lan_scheduled_data['collected_date'] == $payment_date))
			{
				$rcvdPaymentData = "status = ".$status.", collected_amount = (collected_amount+".$collected_amount."), collected_date = ".$payment_date;
				mysqli_query($con,"UPDATE repayment_schedule_list SET ".$rcvdPaymentData." WHERE id = ".$lan_scheduled_data['id']);
			}
			else
			{
				$collection_data = $lan_scheduled_data;
				unset($collection_data['id'],$collection_data['principal'],$collection_data['interest'],$collection_data['due_amount'],$collection_data['total_collected_amount'],$collection_data['total_due_amount']);
				$collection_data['collected_amount'] = $collected_amount;
				$collection_data['collected_date'] = $payment_date;
				$collection_data['status'] = 2;
				insertData('repayment_schedule_list',$collection_data,$con);
			}		
			$waiver_amount -= $due_balance;
		}
		$installment_date = strtotime(setDateIncrement($lan['payment_frequency']),$installment_date);
	}
	else
	break;
}

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

die();
header("Location: manage_lan.php?lan=".$_REQUEST['lan']."&tab=ledger");
?>
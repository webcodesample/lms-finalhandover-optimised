<?php
include_once("common_include.php");

//print_r($_REQUEST); die();

$lan = getLatestUpdateRow('lan',$_REQUEST['lan'],'lan_audit_history',$con);
$crn = getFieldValue('crn','lrn',$lan['lrn'],'lrn_list',$con);
$approval_date = getFieldValue('approval_date','lan',$lan['lan'],'dispatch_list',$con);
$loan_end_date = strtotime(setDateIncrement($lan['payment_frequency'],$lan['loan_tenure']),$approval_date);
$coming_due_date = getComingDueDate($_REQUEST['lan'],$con);
$payment_date = strtotime($_REQUEST['payment_date']);
$installment_date = $coming_due_date;
//echo checkDueBalance($_REQUEST['lan'],$installment_date,$con); die();

$rowCount = getRowCountMultiCol(' WHERE lan = '.$_REQUEST['lan'].' AND remark LIKE "%Customer Payment Received%" AND date = '.$payment_date.' AND type = 1','lan_ledger_transactions',$con);

if($rowCount > 0)
{
	$where_clause = ' WHERE lan = '.$_REQUEST['lan'].' AND date = '.$payment_date.' AND type = 1';
	$ledger_transaction_id = getFieldValueMultiCon('id',$where_clause,'lan_ledger_transactions',$con);
	mysqli_query($con,"UPDATE lan_ledger_transactions SET amount = (amount+".$_REQUEST['partial_amount'].") WHERE id = ".$ledger_transaction_id);
}
else
createLedgerTransaction($lan['lan'],$lan['lrn'],$crn,$payment_date,$_REQUEST['partial_amount'],'Customer Payment Received',1,$con);

$partial_payment_amount = $_REQUEST['partial_amount'];


while($partial_payment_amount > 0)
{
	if($installment_date <= $loan_end_date)
	{
		$due_balance = checkDueBalance($_REQUEST['lan'],$installment_date,$con);
		$lan_scheduled_data = mysqli_fetch_assoc(mysqli_query($con,"SELECT *,SUM(due_amount) AS total_due_amount, SUM(collected_amount) AS total_collected_amount FROM repayment_schedule_list WHERE lan = ".$_REQUEST['lan']." AND status IN (0,2) AND due_date = ".$installment_date." GROUP BY status"));

		if($lan_scheduled_data['total_collected_amount'] < $lan_scheduled_data['total_due_amount'])
		{
			if($partial_payment_amount >= $due_balance)
			{
				$collected_amount = $due_balance;
				$status = 1;
			}
			else
			{
				$collected_amount = $partial_payment_amount;
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
				unset($collection_data['id'],$collection_data['principal'],$collection_data['interest'],$collection_data['other_charges'],$collection_data['due_amount'],$collection_data['total_collected_amount'],$collection_data['total_due_amount']);
				$collection_data['collected_amount'] = $collected_amount;
				$collection_data['collected_date'] = $payment_date;
				$collection_data['status'] = 2;
				insertData('repayment_schedule_list',$collection_data,$con);
			}		
			$partial_payment_amount -= $due_balance;
		}
		$installment_date = strtotime(setDateIncrement($lan['payment_frequency']),$installment_date);
	}
	else
	break;
}
header("Location: manage_lan.php?lan=".$_REQUEST['lan']."&tab=ledger");
?>
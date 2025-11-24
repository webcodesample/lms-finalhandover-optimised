<?php
function createLedger($lan,$con)
{
    $crn = getFieldValue('crn','lrn',$lan['lrn'],'lrn_list',$con);
    $approval_date = getFieldValue('approval_date','lan',$lan['lan'],'dispatch_list',$con);

    $processing_charges = $lan['approved_loan_amount'] * getProcessingChargeRate('New Loan',$con)/100;
    $disbursed_amount = $lan['approved_loan_amount'] - $processing_charges;

    createLedgerTransaction($lan['lan'],$lan['lrn'],$crn,$approval_date,$processing_charges,'Processing Fee Applied',0,$con);
    addtoProcessingChargesList($lan['lan'],$processing_charges,'Processing Fee Applied',$approval_date,$con);
    createLedgerTransaction($lan['lan'],$lan['lrn'],$crn,$approval_date,$disbursed_amount,'Loan Amount Disbursed',0,$con);

    // Generate repayment schedule (starts after delay)
    if($lan['payment_frequency'] == 'Quarterly')
    $date_increment = '+3 months';
    else
    $date_increment = '+1 '.str_replace('ly','',$lan['payment_frequency']);

    $emi = $lan['approved_loan_amount'] * ($lan['roi']/100);
    $installment_date = strtotime($date_increment, $approval_date); // Apply delay

    for ($i = 1; $i <= $lan['loan_tenure']; $i++) 
    {
        createLedgerTransaction($lan['lan'],$lan['lrn'],$crn,$installment_date,$emi,'Interest Debit',0,$con);
        $installment_date = strtotime($date_increment, $installment_date);
    }
}

function createLoanExtensionLedger($lan,$extension_roi,$extension_tenure,$con)
{
    $lan = getLatestUpdateRow('lan',$lan,'lan_audit_history',$con);
    $crn = getFieldValue('crn','lrn',$lan['lrn'],'lrn_list',$con);
    $approval_date = getFieldValue('approval_date','lan',$lan['lan'],'dispatch_list',$con);
    $gap = $lan['loan_tenure']+1;

    $emi = $lan['approved_loan_amount'] * ($extension_roi/100);
    $installment_date = strtotime(setDateIncrement($lan['payment_frequency'],$gap), $approval_date); // Apply delay

    for ($i = 1; $i <= $extension_tenure; $i++) 
    {
        createLedgerTransaction($lan['lan'],$lan['lrn'],$crn,$installment_date,$emi,'Interest Debit',0,$con);
        $installment_date = strtotime(setDateIncrement($lan['payment_frequency']), $installment_date);
    }
}

function setDateIncrement($peymentFrequency,$gap=1)
{
    if($peymentFrequency == 'Quarterly')
    $date_increment = '+'.(3*$gap).' months';
    else
    $date_increment = '+'.(1*$gap).' '.str_replace('ly','',$peymentFrequency);

    return $date_increment;
}

function addtoProcessingChargesList($lan,$amount,$remark,$date,$con)
{
    $data = [
            'lan' => $lan,
            'amount' => $amount,
            'remark' => $remark,
            'applied_on' => $date
            ];
    insertData('lan_processing_charges_list',$data,$con);
}

function createLedgerTransaction($lan,$lrn,$crn,$date,$amount,$remark,$type,$con)
{
    $insertFlag = 0;
    if(in_array($remark,['Processing Fee Applied','Loan Amount Disbursed']))
    {
        $where_clause = " WHERE lan = ".$lan." AND remark = '".$remark."'";
        $insertFlag = getRowCountMultiCol($where_clause,'lan_ledger_transactions',$con);
    }

    if($insertFlag == 0)
    {
        $ledger_transaction_data = [
                                    'lan' => $lan,
                                    'lrn' => $lrn,
                                    'crn' => $crn,
                                    'amount' => $amount,
                                    'remark' => $remark,
                                    'date' => $date,
                                    'type' => $type
                                    ];
        insertData('lan_ledger_transactions',$ledger_transaction_data,$con);
    }
}

function createRepaymentSchedule($lan,$con)
{
    $crn = getFieldValue('crn','lrn',$lan['lrn'],'lrn_list',$con);
    $start_date = getFieldValue('approval_date','lan',$lan['lan'],'dispatch_list',$con);
    $emi = $lan['approved_loan_amount'] * ($lan['roi']/100);

    if($lan['payment_frequency'] == 'Quarterly')
    $date_increment = '+3 months';
    else
    $date_increment = '+1 '.str_replace('ly','',$lan['payment_frequency']);
    
    $installment_date = strtotime($date_increment, $start_date); // Apply delay

    for ($i = 1; $i <= $lan['loan_tenure']; $i++) 
    {
        $principal_due = 0;

        // Adjust for final period
        if ($i == $lan['loan_tenure'])
        $principal_due = $lan['approved_loan_amount'];

        $total_due = $principal_due + $emi;

        $rs_data = [
                    'lan' => $lan['lan'],
                    'lrn' => $lan['lrn'],
                    'crn' => $crn,
                    'due_date' => $installment_date,
                    'principal' => $principal_due,
                    'interest' => $emi,
                    'due_amount' => $total_due,
                    ];
        insertData('repayment_schedule_list',$rs_data,$con);
        $installment_date = strtotime($date_increment, $installment_date);
    }
}

function createExtensionRepaymentSchedule($lan,$extension_roi,$extension_tenure,$con)
{
    $lan = getLatestUpdateRow('lan',$lan,'lan_audit_history',$con);
    $crn = getFieldValue('crn','lrn',$lan['lrn'],'lrn_list',$con);
    $start_date = getFieldValue('approval_date','lan',$lan['lan'],'dispatch_list',$con);
    $emi = $lan['approved_loan_amount'] * ($extension_roi/100);
    $gap = $lan['loan_tenure'];
    $old_tenure_end_date = strtotime(setDateIncrement($lan['payment_frequency'],$gap), $start_date);
    $installment_date = strtotime(setDateIncrement($lan['payment_frequency'],$gap+1), $start_date); // Apply delay
    mysqli_query($con,"UPDATE repayment_schedule_list SET principal = 0, due_amount = interest WHERE lan = ".$lan['lan']." AND due_date = ".$old_tenure_end_date);

    for ($i = 1; $i <= $extension_tenure; $i++) 
    {
        $principal_due = 0;

        // Adjust for final period
        if ($i == $extension_tenure)
        $principal_due = $lan['approved_loan_amount'];

        $total_due = $principal_due + $emi;

        $rs_data = [
                    'lan' => $lan['lan'],
                    'lrn' => $lan['lrn'],
                    'crn' => $crn,
                    'due_date' => $installment_date,
                    'principal' => $principal_due,
                    'interest' => $emi,
                    'due_amount' => $total_due,
                    ];
        insertData('repayment_schedule_list',$rs_data,$con);
        $installment_date = strtotime(setDateIncrement($lan['payment_frequency']), $installment_date);
    }
}

function updateRepaymentSchedule($lan,$extension_roi,$extension_tenure,$con)
{
    $lan = getLatestUpdateRow('lan',$lan,'lan_audit_history',$con);
    $crn = getFieldValue('crn','lrn',$lan['lrn'],'lrn_list',$con);
    $start_date = getFieldValue('approval_date','lan',$lan['lan'],'dispatch_list',$con);
    $emi = $lan['approved_loan_amount'] * ($extension_roi/100);
    $gap = $lan['loan_tenure'];
    $old_tenure_end_date = strtotime(setDateIncrement($lan['payment_frequency'],$gap), $start_date);
    $installment_date = strtotime(setDateIncrement($lan['payment_frequency'],$gap+1), $start_date); // Apply delay
    mysqli_query($con,"UPDATE repayment_schedule_list SET principal = 0, due_amount = interest WHERE lan = ".$lan['lan']." AND due_date = ".$old_tenure_end_date);

    for ($i = 1; $i <= $extension_tenure; $i++) 
    {
        $principal_due = 0;

        // Adjust for final period
        if ($i == $extension_tenure)
        $principal_due = $lan['approved_loan_amount'];

        $total_due = $principal_due + $emi;

        $rs_data = [
                    'lan' => $lan['lan'],
                    'lrn' => $lan['lrn'],
                    'crn' => $crn,
                    'due_date' => $installment_date,
                    'principal' => $principal_due,
                    'interest' => $emi,
                    'due_amount' => $total_due,
                    ];
        insertData('repayment_schedule_list',$rs_data,$con);
        $installment_date = strtotime(setDateIncrement($lan['payment_frequency']), $installment_date);
    }
}

function updateLedgerTransaction($lan,$date,$amount,$type,$con)
{
	$insertFlag = 1;
	$result = mysqli_query($con,"SELECT * FROM lan_ledger_transactions WHERE lan = ".$lan." AND type = 1 AND date = ".$date);
    $ledger_row = mysqli_fetch_assoc($result);

    if(mysqli_num_rows($result))
	{
		$insertFlag = 0;
		$where_con_array = ['id' => $ledger_row['id'],];

		if($type)
		$ledger_transaction_data['amount'] = $ledger_row['amount'] + $amount;
		else
		$ledger_transaction_data['amount'] = $ledger_row['amount'] - $amount;

		if($ledger_transaction_data['amount'] > 0)
		updateData('lan_ledger_transactions',$ledger_transaction_data,$where_con_array,$con);
		else
		deleteData('lan_ledger_transactions',$where_con_array,$con);
	}

	return $insertFlag;
}

function getComingDueDate($lan,$con)
{
	return mysqli_fetch_assoc(mysqli_query($con,"SELECT min(due_date) AS coming_due_date FROM repayment_schedule_list WHERE lan = ".$lan." AND status IN (0,2)"))['coming_due_date'];
}

function checkDueBalance($lan,$date,$con)
{
	return mysqli_fetch_assoc(mysqli_query($con,"SELECT SUM(due_amount-collected_amount) AS due_balance FROM repayment_schedule_list WHERE lan = ".$lan." AND due_date = ".$date))['due_balance'];
}

//to get comming due date after wef date for roi updation
function getWEFComingDueDate($lan,$wefDate,$con)
{
	return mysqli_fetch_assoc(mysqli_query($con,"SELECT min(due_date) AS coming_due_date FROM repayment_schedule_list WHERE lan = ".$lan." AND due_date > ".$wefDate))['coming_due_date'];
}

//not in use
function checkPaymentStatus($lan,$date,$con)
{
	return mysqli_fetch_assoc(mysqli_query($con,"SELECT status FROM repayment_schedule_list WHERE lan = ".$lan." AND due_date = ".$date))['status'];
}
?>
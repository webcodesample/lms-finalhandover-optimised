<?php
//print_r($lan); 
function createLedger($lan,$con)
{
    $crn = getFieldValue('crn','lrn',$lan['lrn'],'lrn_list',$con);
    $approval_date = getFieldValue('approval_date','lan',$lan['lan'],'dispatch_list',$con);

    $processing_charges = $lan['approved_loan_amount'] * 2/100;
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


//not in use
function createLedgerInterestTransaction($lan,$lrn,$crn,$date,$amount,$remark,$type,$con)
{
    if($lan['payment_frequency'] == 'Quarterly')
    $date_increment = '+3 months';
    else
    $date_increment = '+1 '.str_replace('ly','',$lan['payment_frequency']);

    $emi = $lan['approved_loan_amount'] * ($lan['roi']/100);
    $installment_date = strtotime($date_increment, $approval_date); // Apply delay

    for ($i = 1; $i <= $lan['loan_tenure']; $i++) 
    {
        if($installment_date <= strtotime('30-06-2025'))
        {
            createLedgerTransaction($lan['lan'],$lan['lrn'],$crn,$installment_date,$emi,'Interest Debit',0,$con);
        }
        $installment_date = strtotime($date_increment, $installment_date);
    }
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
?>
<?php
include_once("common_include.php");

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
?>
<?php
include_once("common_include.php");

$lan_data = getLatestUpdateRow('lan',8586121748928019,'lan_audit_history',$con);
$crn = getFieldValue('crn','lrn',$lan_data['lrn'],'lrn_list',$con);
print_r($lan_data);

$start_date = getFieldValue('approval_date','lan',$lan_data['lan'],'dispatch_list',$con);

function createLedgerTransaction($lan,$lrn,$crn,$date,$amount,$remark,$type,$con)
{
    $where_clause = " WHERE lan = ".$lan." AND date = ".$date;
    if(getRowCountMultiCol($where_clause,'lan_ledger_transactions',$con) == 0)
    {
        $ledger_transaction_data = [
                                    'lan' => $lan,
                                    'lrn' => $lRN,
                                    'crn' => $crn,
                                    'amount' => $amount,
                                    'remark' => $remark,
                                    'date' => $date,
                                    'type' => $type
                                    ];
        insertData('lan_ledger_transactions',$ledger_transaction_data,$con);
    }
}

die();

$where_clause = " WHERE lan = ".$lan_data['lan']." AND date = ".$start_date;
if(getRowCountMultiCol($where_clause,'lan_ledger_transactions',$con) == 0)
{
    $ledger_transaction_data = [
                                'lan' => $lan_data['lan'],
                                'lrn' => $lan_data['lrn'],
                                'crn' => $crn,
                                'amount' => $lan_data['approved_loan_amount'],
                                'remark' => 'Loan Amount Disbursed',
                                'date' => $start_date,
                                ];
    insertData('lan_ledger_transactions',$ledger_transaction_data,$con);
}
//die();

$term_type = $lan_data['payment_frequency'];

// Define date increments and delays
$date_increments = [
    'Weekly' => '+1 week',
    'Monthly' => '+1 month',
    'Quarterly' => '+3 months',
    'Yearly' => '+1 year'
];
$start_delays = [
    'Weekly' => '+1 week',
    'Monthly' => '+1 month',
    'Quarterly' => '+3 months',
    'Yearly' => '+1 year'
];

// Generate repayment schedule (starts after delay)
$loan_amount = $lan_data['approved_loan_amount'];
$balance = $lan_data['approved_loan_amount'];
$rate_per_period = $lan_data['roi']/100;
$periods = $lan_data['loan_tenure'];
$repayment_schedule = [];


$emi = $lan_data['approved_loan_amount'] * $rate_per_period ;
$total_payment = $loan_amount + $emi * $periods;
$total_interest = $total_payment - $lan_data['approved_loan_amount'];

$installment_date = strtotime($start_delays[$term_type], $start_date); // Apply delay

for ($i = 1; $i <= $periods; $i++) 
{
    if($installment_date <= strtotime('today'))
    {
        $where_clause = " WHERE lan = ".$lan_data['lan']." AND date = ".$installment_date;
        if(getRowCountMultiCol($where_clause,'lan_ledger_transactions',$con) == 0)
        {
            $interest_payment = $balance * $rate_per_period;

            $ledger_transaction_data = [
                                        'lan' => $lan_data['lan'],
                                        'lrn' => $lan_data['lrn'],
                                        'crn' => $crn,
                                        'amount' => $interest_payment,
                                        'remark' => 'Interest Debit',
                                        'date' => $installment_date,
                                        ];
            insertData('lan_ledger_transactions',$ledger_transaction_data,$con);
        }
    }
    $installment_date = strtotime($date_increments[$term_type], $installment_date);
}
?>
<?php
include_once("common_include.php");

$lan_data = getLatestUpdateRow('lan',8586121748928019,'lan_audit_history',$con);
$crn = getFieldValue('crn','lrn',$lan_data['lrn'],'lrn_list',$con);
print_r($lan_data);
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
$start_date = getFieldValue('approval_date','lan',$lan_data['lan'],'dispatch_list',$con);

$emi = $lan_data['approved_loan_amount'] * $rate_per_period ;
$total_payment = $loan_amount + $emi * $periods;
$total_interest = $total_payment - $lan_data['approved_loan_amount'];

$installment_date = strtotime($start_delays[$term_type], $start_date); // Apply delay

for ($i = 1; $i <= $periods; $i++) {
    $interest_payment = $balance * $rate_per_period;
    $principal_payment = $emi - $interest_payment;
    $balance -= $principal_payment;

    // Adjust for final period
    if ($i == $periods && $balance > 0) {
        $principal_payment += $balance;
        $emi_adjusted = $principal_payment + $interest_payment;
        $balance = 0;
    } else {
        $emi_adjusted = $emi;
    }

    $repayment_schedule[] = [
        'period' => $i,
        'date' => date('d-m-Y', $installment_date),
        'emi' => $emi_adjusted,
        'principal' => $principal_payment,
        'interest' => $interest_payment,
        'balance' => $balance
    ];

    $rs_data = [
                'lan' => $lan_data['lan'],
                'lrn' => $lan_data['lrn'],
                'crn' => $crn,
                'due_date' => $installment_date,
                'due_amount' => $emi_adjusted,
                ];
    insertData('repayment_schedule_list',$rs_data,$con);
    $installment_date = strtotime($date_increments[$term_type], $installment_date);
}
$output = "";
// Repayment schedule
    $output .= '<div class="schedule-section">';
    $output .= '<h6 class="mt-4 bg-warning-subtle p-2">Repayment Schedule (Starts after 1 ' . ucfirst(str_replace('ly','',$term_type)) . ')</h6>';
    $output .= '<div class="table-responsive">';
    $output .= '<table class="table table-sm table-bordered table-hover fs-9">';
    $output .= '<thead class="table-info">
                    <tr>
                        <td class="fw-semibold text-center">#</td>
                        <td class="fw-semibold text-center">Due Date</td>
                        <td class="fw-semibold text-center">Installment (₹)</td>
                        <td class="fw-semibold text-center">Principal (₹)</td>
                        <td class="fw-semibold text-center">Interest (₹)</td>
                        <td class="fw-semibold text-center">Remaining Balance (₹)</td>
                    </tr>
            </thead>';
    $output .= '<tbody>';
    foreach ($repayment_schedule as $row) {
        $output .= '<tr>';
        $output .= '<td class="px-2">' . $row['period'] . '</td>';
        $output .= '<td class="px-2">' . $row['date'] . '</td>';
        $output .= '<td class="px-2">' . number_format($row['emi'], 2) . '</td>';
        $output .= '<td class="px-2">' . number_format($row['principal'], 2) . '</td>';
        $output .= '<td class="px-2">' . number_format($row['interest'], 2) . '</td>';
        $output .= '<td class="px-2">' . number_format(max(0, $row['balance']), 2) . '</td>';
        $output .= '</tr>';
    }
    $output .= '</tbody></table></div></div>';

    echo $output;
?>
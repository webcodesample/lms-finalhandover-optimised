<?php
header('Content-Type: text/html; charset=UTF-8');

if ($_SERVER['REQUEST_METHOD'] === 'POST') {
    $loan_amount = floatval($_POST['loan_amount']);
    $interest_rate = floatval($_POST['interest_rate']);
    $loan_term = intval($_POST['loan_term']);
    $term_type = $_POST['term_type'];
    $start_date = date('Y-m-d'); // Today: June 4, 2025

    // Define date increments and delays
    $date_increments = [
        'weekly' => '+1 week',
        'monthly' => '+1 month',
        'quarterly' => '+3 months',
        'yearly' => '+1 year'
    ];
    $start_delays = [
        'weekly' => '+1 week',
        'monthly' => '+1 month',
        'quarterly' => '+3 months',
        'yearly' => '+1 year'
    ];

    // Validate inputs
    if ($loan_amount <= 0 || $interest_rate <= 0 || $loan_term <= 0 || !array_key_exists($term_type, $date_increments)) {
        echo '<div class="alert alert-danger">Invalid input values. Please check your inputs.</div>';
        exit;
    }

    // Calculate EMI
    $periods = $loan_term; // Loan term is the number of periods
    $rate_per_period = $interest_rate / 100; // Interest rate is per period

    if ($rate_per_period == 0) {
        $emi = $loan_amount / $periods;
    } else {
        $emi = $loan_amount * $rate_per_period * pow(1 + $rate_per_period, $periods) / (pow(1 + $rate_per_period, $periods) - 1);
    }

    $total_payment = $emi * $periods;
    $total_interest = $total_payment - $loan_amount;

    // Generate amortization schedule (starts immediately)
    $balance = $loan_amount;
    $amortization = [];
    $current_date = strtotime($start_date);

    for ($i = 1; $i <= $periods; $i++) {
        $interest_payment = $balance * $rate_per_period;
        $principal_payment = $emi - $interest_payment;
        $balance -= $principal_payment;

        // Adjust for final period
        if ($i == $periods && $balance < 0) {
            $principal_payment += $balance;
            $emi_adjusted = $principal_payment + $interest_payment;
            $balance = 0;
        } else {
            $emi_adjusted = $emi;
        }

        $amortization[] = [
            'period' => $i,
            'date' => date('d-m-Y', $current_date),
            'emi' => $emi_adjusted,
            'principal' => $principal_payment,
            'interest' => $interest_payment,
            'balance' => $balance
        ];

        $current_date = strtotime($date_increments[$term_type], $current_date);
    }

    // Generate repayment schedule (starts after delay)
    $balance = $loan_amount;
    $repayment_schedule = [];
    $current_date = strtotime($start_delays[$term_type], strtotime($start_date)); // Apply delay

    for ($i = 1; $i <= $periods; $i++) {
        $interest_payment = $balance * $rate_per_period;
        $principal_payment = $emi - $interest_payment;
        $balance -= $principal_payment;

        // Adjust for final period
        if ($i == $periods && $balance < 0) {
            $principal_payment += $balance;
            $emi_adjusted = $principal_payment + $interest_payment;
            $balance = 0;
        } else {
            $emi_adjusted = $emi;
        }

        $repayment_schedule[] = [
            'period' => $i,
            'date' => date('d-m-Y', $current_date),
            'emi' => $emi_adjusted,
            'principal' => $principal_payment,
            'interest' => $interest_payment,
            'balance' => $balance
        ];

        $current_date = strtotime($date_increments[$term_type], $current_date);
    }

    // Format results
    $output = '<div class="card">';
    $output .= '<div class="card-body">';
    $output .= '<h6 class="card-title">EMI Calculated On '.date('d-m-Y h:i:s A').'</h6>';
    /*$output .= '<p class="card-text">
                <span class="fw-semibold">Loan Amount:</span> ₹' . number_format($loan_amount, 2) . '<br>
                <span class="fw-semibold">' . ucfirst($term_type) . ' Interest Rate:</span> ' . number_format($interest_rate, 2) . '%<br>
                <span class="fw-semibold">Loan Term:</span> ' . $loan_term . ' ' . ucfirst(str_replace('ly','s',$term_type)) . '<br>
                <span class="fw-semibold">'. ucfirst($term_type) .' EMI :</span> ₹' . number_format($emi, 2) . '<br>
                <span class="fw-semibold">Total Payment:</span> ₹' . number_format($total_payment, 2) . '<br>
                <span class="fw-semibold">Total Interest:</span> ₹' . number_format($total_interest, 2) . '</p>';*/
    $output .= '<table class="table table-sm table-bordered table-hover w-50 fs-9">
                <tr>
                    <td>Loan Amount</td>
                    <td class="text-end">₹ ' . number_format($loan_amount, 2) . '</td>
                </tr>
                <tr>
                    <td>Intrest Rate '.ucfirst($term_type).'</td>
                    <td class="text-end">' . number_format($interest_rate, 2) . ' %</td>
                </tr>
                <tr>
                    <td>Loan Term</td>
                    <td class="text-end">' . $loan_term . ' ' . ucfirst(str_replace('ly','s',$term_type)) . '</td>
                </tr>
                <tr>
                    <td>'. ucfirst($term_type) .' EMI</td>
                    <td class="text-end">₹ ' . number_format($emi, 2) . '</td>
                </tr>
                <tr>
                    <td>Total Interest</td>
                    <td class="text-end">₹ ' . number_format($total_interest, 2) . '</td>
                </tr>
                <tr>
                    <td>Total Payment</td>
                    <td class="text-end">₹ ' . number_format($total_payment, 2) . '</td>
                </tr>
                </table>';
    $output .= '</div></div>';

    // Repayment schedule
    $output .= '<div class="schedule-section">';
    $output .= '<h6 class="mt-4 text-danger bg-warning p-2">Repayment Schedule (Starts after 1 ' . str_replace('ly','',$term_type) . ')</h6>';
    $output .= '<div class="table-responsive">';
    $output .= '<table class="table table-sm table-bordered table-striped fs-9">';
    $output .= '<thead>
                    <tr>
                        <td class="fw-semibold text-center">Period</td>
                        <td class="fw-semibold text-center">Due Date</td>
                        <td class="fw-semibold text-center">EMI (₹)</td>
                        <td class="fw-semibold text-center">Principal (₹)</td>
                        <td class="fw-semibold text-center">Interest (₹)</td>
                        <td class="fw-semibold text-center">Remaining Balance (₹)</td>
                    </tr>
            </thead>';
    $output .= '<tbody>';
    foreach ($repayment_schedule as $row) {
        $output .= '<tr>';
        $output .= '<td>' . $row['period'] . '</td>';
        $output .= '<td>' . $row['date'] . '</td>';
        $output .= '<td>' . number_format($row['emi'], 2) . '</td>';
        $output .= '<td>' . number_format($row['principal'], 2) . '</td>';
        $output .= '<td>' . number_format($row['interest'], 2) . '</td>';
        $output .= '<td>' . number_format(max(0, $row['balance']), 2) . '</td>';
        $output .= '</tr>';
    }
    $output .= '</tbody></table></div></div>';

    // Amortization schedule
    /*
    $output .= '<div class="schedule-section">';
    $output .= '<h3 class="mt-4">Amortization Schedule (Starts Immediately)</h3>';
    $output .= '<div class="table-responsive">';
    $output .= '<table class="table table-bordered table-striped">';
    $output .= '<thead><tr><th>Period</th><th>Payment Date</th><th>EMI (₹)</th><th>Principal Paid (₹)</th><th>Interest Paid (₹)</th><th>Remaining Balance (₹)</th></tr></thead>';
    $output .= '<tbody>';
    foreach ($amortization as $row) {
        $output .= '<tr>';
        $output .= '<td>' . $row['period'] . '</td>';
        $output .= '<td>' . $row['date'] . '</td>';
        $output .= '<td>' . number_format($row['emi'], 2) . '</td>';
        $output .= '<td>' . number_format($row['principal'], 2) . '</td>';
        $output .= '<td>' . number_format($row['interest'], 2) . '</td>';
        $output .= '<td>' . number_format(max(0, $row['balance']), 2) . '</td>';
        $output .= '</tr>';
    }
    $output .= '</tbody></table></div></div>';

    // Optional: Save to database (commented out)
    /*
    $conn = new mysqli('localhost', 'username', 'password', 'database');
    if ($conn->connect_error) {
        $output .= '<div class="alert alert-danger mt-3">Database connection failed.</div>';
    } else {
        $timestamp_ms = round(microtime(true) * 1000);
        $stmt = $conn->prepare("INSERT INTO emi_calculations (loan_amount, interest_rate, loan_term, term_type, emi, total_payment, total_interest, timestamp_ms) VALUES (?, ?, ?, ?, ?, ?, ?, ?)");
        $stmt->bind_param("ddisdddd", $loan_amount, $interest_rate, $loan_term, $term_type, $emi, $total_payment, $total_interest, $timestamp_ms);
        $stmt->execute();
        $stmt->close();
        $conn->close();
    }
    */

    echo $output;
} else {
    echo '<div class="alert alert-danger">Invalid request method. Use POST.</div>';
}
?>
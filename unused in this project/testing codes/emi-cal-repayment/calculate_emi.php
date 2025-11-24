<?php
header('Content-Type: text/html; charset=UTF-8');

if ($_SERVER['REQUEST_METHOD'] === 'POST') {
    $loan_amount = floatval($_POST['loan_amount']);
    $interest_rate = floatval($_POST['interest_rate']);
    $loan_term = intval($_POST['loan_term']);
    $term_type = $_POST['term_type'];
    $start_date = date('Y-m-d'); // Default to today (June 4, 2025)

    // Define date increments for schedules
    $date_increments = [
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

    // Generate repayment schedule
    $repayment_schedule = [];
    $current_date = strtotime($start_date);
    for ($i = 1; $i <= $periods; $i++) {
        $repayment_schedule[] = [
            'period' => $i,
            'date' => date('d-m-Y', $current_date),
            'emi' => $emi
        ];
        $current_date = strtotime($date_increments[$term_type], $current_date);
    }

    // Generate amortization schedule
    $balance = $loan_amount;
    $amortization = [];
    $current_date = strtotime($start_date);

    for ($i = 1; $i <= $periods; $i++) {
        $interest_payment = $balance * $rate_per_period;
        $principal_payment = $emi - $interest_payment;
        $balance -= $principal_payment;

        // Adjust for final period to avoid negative balance
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

    // Format results
    $output = '<div class="card">';
    $output .= '<div class="card-body">';
    $output .= '<h3 class="card-title">EMI Calculation Results</h3>';
    $output .= '<p class="card-text"><strong>Loan Amount:</strong> ₹' . number_format($loan_amount, 2) . '</p>';
    $output .= '<p class="card-text"><strong>Interest Rate per ' . ucfirst($term_type) . ':</strong> ' . number_format($interest_rate, 2) . '%</p>';
    $output .= '<p class="card-text"><strong>Loan Term:</strong> ' . $loan_term . ' ' . $term_type . '</p>';
    $output .= '<p class="card-text"><strong>EMI per ' . ucfirst($term_type) . ':</strong> ₹' . number_format($emi, 2) . '</p>';
    $output .= '<p class="card-text"><strong>Total Payment:</strong> ₹' . number_format($total_payment, 2) . '</p>';
    $output .= '<p class="card-text"><strong>Total Interest:</strong> ₹' . number_format($total_interest, 2) . '</p>';
    $output .= '</div></div>';

    // Repayment schedule
    $output .= '<div class="schedule-section">';
    $output .= '<h3 class="mt-4">Repayment Schedule</h3>';
    $output .= '<div class="table-responsive">';
    $output .= '<table class="table table-bordered table-striped">';
    $output .= '<thead><tr><th>Period</th><th>Payment Date</th><th>EMI (₹)</th></tr></thead>';
    $output .= '<tbody>';
    foreach ($repayment_schedule as $row) {
        $output .= '<tr>';
        $output .= '<td>' . $row['period'] . '</td>';
        $output .= '<td>' . $row['date'] . '</td>';
        $output .= '<td>' . number_format($row['emi'], 2) . '</td>';
        $output .= '</tr>';
    }
    $output .= '</tbody></table></div></div>';

    // Amortization schedule
    $output .= '<div class="schedule-section">';
    $output .= '<h3 class="mt-4">Amortization Schedule</h3>';
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
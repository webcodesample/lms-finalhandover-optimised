<?php
header('Content-Type: text/html; charset=UTF-8');

if ($_SERVER['REQUEST_METHOD'] === 'POST') {
    $loan_amount = floatval($_POST['loan_amount']);
    $interest_rate = floatval($_POST['interest_rate']);
    $loan_term = intval($_POST['loan_term']);
    $term_type = $_POST['term_type'];
    $start_date = isset($_POST['start_date']) ? $_POST['start_date'] : date('Y-m-d'); // Default to today (June 4, 2025)

    // Define periods per year and date increments
    $periods_per_year = [
        'weekly' => 52,
        'monthly' => 12,
        'quarterly' => 4,
        'yearly' => 1
    ];
    $date_increments = [
        'weekly' => '+1 week',
        'monthly' => '+1 month',
        'quarterly' => '+3 months',
        'yearly' => '+1 year'
    ];

    // Validate inputs
    if ($loan_amount <= 0 || $interest_rate <= 0 || $loan_term <= 0 || !array_key_exists($term_type, $periods_per_year)) {
        echo '<p class="error">Invalid input values. Please check your inputs.</p>';
        exit;
    }

    // Calculate EMI
    $periods = $loan_term * $periods_per_year[$term_type];
    $rate_per_period = $interest_rate / 100 / $periods_per_year[$term_type];

    if ($rate_per_period == 0) {
        $emi = $loan_amount / $periods;
    } else {
        $emi = $loan_amount * $rate_per_period * pow(1 + $rate_per_period, $periods) / (pow(1 + $rate_per_period, $periods) - 1);
    }

    $total_payment = $emi * $periods;
    $total_interest = $total_payment - $loan_amount;

    // Generate amortization schedule
    $balance = $loan_amount;
    $amortization = [];
    $current_date = strtotime($start_date);

    for ($i = 1; $i <= $periods; $i++) {
        $interest_payment = $balance * $rate_per_period;
        $principal_payment = $emi - $interest_payment;
        $balance -= $principal_payment;

        // Adjust for final period to avoid negative balance due to rounding
        if ($i == $periods && $balance < 0) {
            $principal_payment += $balance;
            $emi = $principal_payment + $interest_payment;
            $balance = 0;
        }

        $amortization[] = [
            'period' => $i,
            'date' => date('d-m-Y', $current_date),
            'emi' => $emi,
            'principal' => $principal_payment,
            'interest' => $interest_payment,
            'balance' => $balance
        ];

        $current_date = strtotime($date_increments[$term_type], $current_date);
    }

    // Format results
    $output = "<h3>EMI Calculation Results</h3>";
    $output .= "<p>Loan Amount: ₹" . number_format($loan_amount, 2) . "</p>";
    $output .= "<p>Annual Interest Rate: " . number_format($interest_rate, 2) . "%</p>";
    $output .= "<p>Loan Term: $loan_term $term_type</p>";
    $output .= "<p>EMI per $term_type: ₹" . number_format($emi, 2) . "</p>";
    $output .= "<p>Total Payment: ₹" . number_format($total_payment, 2) . "</p>";
    $output .= "<p>Total Interest: ₹" . number_format($total_interest, 2) . "</p>";

    // Amortization table
    $output .= "<h3>Amortization Schedule</h3>";
    $output .= "<table>";
    $output .= "<tr><th>Period</th><th>Payment Date</th><th>EMI (₹)</th><th>Principal Paid (₹)</th><th>Interest Paid (₹)</th><th>Remaining Balance (₹)</th></tr>";
    foreach ($amortization as $row) {
        $output .= "<tr>";
        $output .= "<td>" . $row['period'] . "</td>";
        $output .= "<td>" . $row['date'] . "</td>";
        $output .= "<td>" . number_format($row['emi'], 2) . "</td>";
        $output .= "<td>" . number_format($row['principal'], 2) . "</td>";
        $output .= "<td>" . number_format($row['interest'], 2) . "</td>";
        $output .= "<td>" . number_format(max(0, $row['balance']), 2) . "</td>";
        $output .= "</tr>";
    }
    $output .= "</table>";

    // Optional: Save to database (commented out; uncomment and configure as needed)
    /*
    $conn = new mysqli('localhost', 'username', 'password', 'database');
    if ($conn->connect_error) {
        $output .= '<p class="error">Database connection failed.</p>';
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
    echo '<p class="error">Invalid request method. Use POST.</p>';
}
?>
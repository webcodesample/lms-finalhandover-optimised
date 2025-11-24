<?php
header('Content-Type: text/html; charset=UTF-8');

if ($_SERVER['REQUEST_METHOD'] === 'POST') {
    $loan_amount = floatval($_POST['loan_amount']);
    $interest_rate = floatval($_POST['interest_rate']);
    $loan_term = intval($_POST['loan_term']);
    $term_type = $_POST['term_type'];

    // Define periods per year based on term type
    $periods_per_year = [
        'weekly' => 52,
        'monthly' => 12,
        'quarterly' => 4,
        'yearly' => 1
    ];

    // Validate inputs
    if ($loan_amount <= 0 || $interest_rate <= 0 || $loan_term <= 0 || !array_key_exists($term_type, $periods_per_year)) {
        echo '<p class="error">Invalid input values. Please check your inputs.</p>';
        exit;
    }

    // Calculate EMI
    $periods = $loan_term * $periods_per_year[$term_type]; // Total number of payments
    $rate_per_period = $interest_rate / 100 / $periods_per_year[$term_type]; // Interest rate per period

    if ($rate_per_period == 0) {
        $emi = $loan_amount / $periods;
    } else {
        $emi = $loan_amount * $rate_per_period * pow(1 + $rate_per_period, $periods) / (pow(1 + $rate_per_period, $periods) - 1);
    }

    $total_payment = $emi * $periods;
    $total_interest = $total_payment - $loan_amount;

    // Format results
    $output = "<h3>EMI Calculation Results</h3>";
    $output .= "<p>Loan Amount: ₹" . number_format($loan_amount, 2) . "</p>";
    $output .= "<p>Annual Interest Rate: " . number_format($interest_rate, 2) . "%</p>";
    $output .= "<p>Loan Term: $loan_term $term_type</p>";
    $output .= "<p>EMI per $term_type: ₹" . number_format($emi, 2) . "</p>";
    $output .= "<p>Total Payment: ₹" . number_format($total_payment, 2) . "</p>";
    $output .= "<p>Total Interest: ₹" . number_format($total_interest, 2) . "</p>";

    echo $output;
} else {
    echo '<p class="error">Invalid request method. Use POST.</p>';
}
?>
<?php
//header('Content-Type: application/json');

// Get input data
$income = isset($_POST['income']) ? floatval($_POST['income']) : 0;
$expenses = isset($_POST['expenses']) ? floatval($_POST['expenses']) : 0;
$loanAmount = isset($_POST['loanAmount']) ? floatval($_POST['loanAmount']) : 0;

// Basic validation
if ($income <= 0 || $expenses < 0 || $loanAmount <= 0) {
    echo json_encode([
        'eligible' => false,
        'loanAmount' => $loanAmount,
        'maxLoan' => 0,
        'message' => 'Invalid input values'
    ]);
    exit;
}

// Simple loan eligibility logic
// Assume 40% of disposable income can be used for loan repayment
$disposableIncome = $income - $expenses;
$maxMonthlyPayment = $disposableIncome * 0.4;
// Assume 5-year loan term at 5% interest rate
$interestRate = 0.05;
$loanTermYears = 5;
$monthlyRate = $interestRate / 12;
$numberOfPayments = $loanTermYears * 12;

// Calculate maximum loan amount using loan amortization formula
$maxLoan = ceil($maxMonthlyPayment * (1 - pow(1 + $monthlyRate, -$numberOfPayments)) / $monthlyRate);

$response = [
    'eligible' => $loanAmount <= $maxLoan,
    'loanAmount' => $loanAmount,
    'maxLoan' => $maxLoan
];

echo json_encode($response);
?>
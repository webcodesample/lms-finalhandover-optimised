<?php
//header('Content-Type: application/json');

// Get POST data
$income = isset($_POST['income']) ? floatval($_POST['income']) : 0;
$expenses = isset($_POST['expenses']) ? floatval($_POST['expenses']) : 0;
$creditScore = isset($_POST['creditScore']) ? intval($_POST['creditScore']) : 0;

// Basic validation
if ($income <= 0 || $expenses < 0 || $creditScore < 300 || $creditScore > 850) {
    echo json_encode([
        'eligible' => false,
        'message' => 'Invalid input values.'
    ]);
    exit;
}

// Simple loan eligibility logic
$disposableIncome = $income - $expenses;
$minDisposableIncome = 1000; // Minimum disposable income required
$minCreditScore = 600; // Minimum credit score required
$maxLoanAmount = $disposableIncome * 12 * 3; // 3 years of disposable income

if ($disposableIncome >= $minDisposableIncome && $creditScore >= $minCreditScore) {
    $loanAmount = min($maxLoanAmount, 50000); // Cap loan at $50,000
    echo json_encode([
        'eligible' => true,
        'message' => "Congratulations! You are eligible for a loan up to $" . number_format($loanAmount, 2)
    ]);
} else {
    $reason = $disposableIncome < $minDisposableIncome 
        ? 'Insufficient disposable income (minimum $' . $minDisposableIncome . ' required)'
        : 'Credit score too low (minimum ' . $minCreditScore . ' required)';
    echo json_encode([
        'eligible' => false,
        'message' => 'Sorry, you are not eligible for a loan. Reason: ' . $reason
    ]);
}
?>
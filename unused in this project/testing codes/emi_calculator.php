<?php
// Function to calculate EMI
function calculateEMI($principal, $rate, $time) {
    $monthlyRate = ($rate / 12) / 100; // Monthly interest rate
    $emi = ($principal * $monthlyRate * pow(1 + $monthlyRate, $time)) / (pow(1 + $monthlyRate, $time) - 1);
    return $emi;
}

// Function to generate amortization schedule
function generateSchedule($principal, $rate, $time, $emi) {
    $schedule = [];
    $balance = $principal;
    $monthlyRate = ($rate / 12) / 100;
    
    for ($month = 1; $month <= $time; $month++) {
        $interest = $balance * $monthlyRate;
        $principalPayment = $emi - $interest;
        $balance -= $principalPayment;
        
        // Ensure balance doesn't go negative due to rounding
        if ($month == $time) {
            $principalPayment += $balance;
            $balance = 0;
        }
        
        $schedule[] = [
            'month' => $month,
            'payment' => $emi,
            'principal' => $principalPayment,
            'interest' => $interest,
            'balance' => max(0, $balance)
        ];
    }
    
    return $schedule;
}

// Initialize variables
$principal = $rate = $time = 0;
$emi = 0;
$totalPayment = $totalInterest = 0;
$schedule = [];
$showSchedule = false;

// Process form submission
if ($_SERVER['REQUEST_METHOD'] === 'POST') {
    $principal = floatval($_POST['principal']);
    $rate = floatval($_POST['rate']);
    $time = intval($_POST['time']);
    $showSchedule = isset($_POST['show_schedule']);
    
    if ($principal > 0 && $rate > 0 && $time > 0) {
        $emi = calculateEMI($principal, $rate, $time);
        $totalPayment = $emi * $time;
        $totalInterest = $totalPayment - $principal;
        
        if ($showSchedule) {
            $schedule = generateSchedule($principal, $rate, $time, $emi);
        }
    }
}
?>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>EMI Calculator</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            line-height: 1.6;
            max-width: 800px;
            margin: 0 auto;
            padding: 20px;
        }
        .calculator {
            background: #f4f4f4;
            padding: 20px;
            border-radius: 5px;
            margin-bottom: 20px;
        }
        .result {
            background: #e7f3fe;
            padding: 15px;
            border-radius: 5px;
            margin-bottom: 20px;
        }
        table {
            width: 100%;
            border-collapse: collapse;
            margin-top: 20px;
        }
        th, td {
            border: 1px solid #ddd;
            padding: 8px;
            text-align: left;
        }
        th {
            background-color: #f2f2f2;
        }
        tr:nth-child(even) {
            background-color: #f9f9f9;
        }
        input[type="number"] {
            width: 100%;
            padding: 8px;
            margin: 5px 0 15px 0;
            display: inline-block;
            border: 1px solid #ccc;
            border-radius: 4px;
            box-sizing: border-box;
        }
        input[type="submit"] {
            background-color: #4CAF50;
            color: white;
            padding: 10px 15px;
            border: none;
            border-radius: 4px;
            cursor: pointer;
        }
        input[type="submit"]:hover {
            background-color: #45a049;
        }
        .checkbox-container {
            margin: 15px 0;
        }
    </style>
</head>
<body>
    <h1>EMI Calculator</h1>
    
    <div class="calculator">
        <form method="post" action="">
            <label for="principal">Loan Amount (Principal):</label>
            <input type="number" id="principal" name="principal" value="<?php echo $principal; ?>" required min="1">
            
            <label for="rate">Annual Interest Rate (%):</label>
            <input type="number" id="rate" name="rate" value="<?php echo $rate; ?>" required step="0.01" min="0.01">
            
            <label for="time">Loan Term (in months):</label>
            <input type="number" id="time" name="time" value="<?php echo $time; ?>" required min="1">
            
            <div class="checkbox-container">
                <input type="checkbox" id="show_schedule" name="show_schedule" <?php echo $showSchedule ? 'checked' : ''; ?>>
                <label for="show_schedule">Show Amortization Schedule</label>
            </div>
            
            <input type="submit" value="Calculate EMI">
        </form>
    </div>
    
    <?php if ($_SERVER['REQUEST_METHOD'] === 'POST' && $emi > 0): ?>
        <div class="result">
            <h2>EMI Calculation Results</h2>
            <p><strong>Loan Amount:</strong> ₹<?php echo number_format($principal, 2); ?></p>
            <p><strong>Monthly EMI:</strong> ₹<?php echo number_format($emi, 2); ?></p>
            <p><strong>Total Interest Payable:</strong> ₹<?php echo number_format($totalInterest, 2); ?></p>
            <p><strong>Total Payment (Principal + Interest):</strong> ₹<?php echo number_format($totalPayment, 2); ?></p>
        </div>
        
        <?php if ($showSchedule && !empty($schedule)): ?>
            <h2>Amortization Schedule</h2>
            <table>
                <thead>
                    <tr>
                        <th>Month</th>
                        <th>Payment (EMI)</th>
                        <th>Principal</th>
                        <th>Interest</th>
                        <th>Remaining Balance</th>
                    </tr>
                </thead>
                <tbody>
                    <?php foreach ($schedule as $entry): ?>
                        <tr>
                            <td><?php echo $entry['month']; ?></td>
                            <td>₹<?php echo number_format($entry['payment'], 2); ?></td>
                            <td>₹<?php echo number_format($entry['principal'], 2); ?></td>
                            <td>₹<?php echo number_format($entry['interest'], 2); ?></td>
                            <td>₹<?php echo number_format($entry['balance'], 2); ?></td>
                        </tr>
                    <?php endforeach; ?>
                </tbody>
            </table>
        <?php endif; ?>
    <?php endif; ?>
</body>
</html>
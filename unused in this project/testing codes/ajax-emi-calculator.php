<?php
// emi_calculator.php

// Function to calculate EMI
function calculateEMI($principal, $annualRate, $termValue, $termUnit) {
    // Convert annual rate to decimal and adjust for term unit
    $rate = $annualRate / 100;
    
    // Calculate rate per term and total terms
    switch ($termUnit) {
        case 'weekly':
            $ratePerTerm = $rate / 52;
            $totalTerms = $termValue * 52;
            break;
        case 'monthly':
            $ratePerTerm = $rate / 12;
            $totalTerms = $termValue * 12;
            break;
        case 'quarterly':
            $ratePerTerm = $rate / 4;
            $totalTerms = $termValue * 4;
            break;
        case 'yearly':
            $ratePerTerm = $rate;
            $totalTerms = $termValue;
            break;
        default:
            $ratePerTerm = $rate / 12;
            $totalTerms = $termValue * 12;
    }
    
    // Calculate EMI using the formula
    if ($ratePerTerm == 0) {
        $emi = $principal / $totalTerms;
    } else {
        $emi = ($principal * $ratePerTerm * pow(1 + $ratePerTerm, $totalTerms)) / (pow(1 + $ratePerTerm, $totalTerms) - 1);
    }
    
    return [
        'emi' => $emi,
        'totalPayment' => $emi * $totalTerms,
        'totalInterest' => ($emi * $totalTerms) - $principal,
        'totalTerms' => $totalTerms,
        'ratePerTerm' => $ratePerTerm * 100 // Return as percentage
    ];
}

// Process AJAX request
if ($_SERVER['REQUEST_METHOD'] === 'POST' && isset($_POST['action']) && $_POST['action'] === 'calculate') {
    header('Content-Type: application/json');
    
    $principal = floatval($_POST['principal']);
    $annualRate = floatval($_POST['annualRate']);
    $termValue = intval($_POST['termValue']);
    $termUnit = $_POST['termUnit'];
    
    if ($principal > 0 && $annualRate >= 0 && $termValue > 0) {
        $result = calculateEMI($principal, $annualRate, $termValue, $termUnit);
        echo json_encode([
            'success' => true,
            'emi' => $result['emi'],
            'totalPayment' => $result['totalPayment'],
            'totalInterest' => $result['totalInterest'],
            'totalTerms' => $result['totalTerms'],
            'ratePerTerm' => $result['ratePerTerm']
        ]);
    } else {
        echo json_encode(['success' => false, 'message' => 'Invalid input values']);
    }
    exit;
}
?>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Advanced EMI Calculator</title>
    <!-- Bootstrap CSS -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/css/bootstrap.min.css" rel="stylesheet">
    <style>
        .calculator-container {
            max-width: 800px;
            margin: 30px auto;
            padding: 20px;
            border-radius: 10px;
            box-shadow: 0 0 20px rgba(0,0,0,0.1);
            background-color: #f8f9fa;
        }
        .result-card {
            display: none;
            margin-top: 20px;
        }
        .term-options {
            margin-bottom: 15px;
        }
        .loading {
            display: none;
            text-align: center;
            margin: 10px 0;
        }
        .chart-container {
            height: 300px;
            margin-top: 20px;
        }
    </style>
</head>
<body>
    <div class="container calculator-container">
        <h2 class="text-center mb-4">Advanced EMI Calculator</h2>
        
        <form id="emiForm">
            <div class="row mb-3">
                <div class="col-md-6">
                    <label for="principal" class="form-label">Loan Amount (₹)</label>
                    <input type="number" class="form-control" id="principal" min="1" required>
                </div>
                <div class="col-md-6">
                    <label for="annualRate" class="form-label">Annual Interest Rate (%)</label>
                    <input type="number" step="0.01" class="form-control" id="annualRate" min="0" required>
                </div>
            </div>
            
            <div class="row mb-3">
                <div class="col-md-6">
                    <label for="termValue" class="form-label">Loan Term</label>
                    <div class="input-group">
                        <input type="number" class="form-control" id="termValue" min="1" required>
                        <select class="form-select" id="termUnit">
                            <option value="weekly">Weeks</option>
                            <option value="monthly" selected>Months</option>
                            <option value="quarterly">Quarters</option>
                            <option value="yearly">Years</option>
                        </select>
                    </div>
                </div>
                <div class="col-md-6">
                    <label class="form-label">Payment Frequency</label>
                    <div class="form-control term-options">
                        <div class="form-check form-check-inline">
                            <input class="form-check-input" type="radio" name="paymentFrequency" id="frequencyWeekly" value="weekly">
                            <label class="form-check-label" for="frequencyWeekly">Weekly</label>
                        </div>
                        <div class="form-check form-check-inline">
                            <input class="form-check-input" type="radio" name="paymentFrequency" id="frequencyMonthly" value="monthly" checked>
                            <label class="form-check-label" for="frequencyMonthly">Monthly</label>
                        </div>
                        <div class="form-check form-check-inline">
                            <input class="form-check-input" type="radio" name="paymentFrequency" id="frequencyQuarterly" value="quarterly">
                            <label class="form-check-label" for="frequencyQuarterly">Quarterly</label>
                        </div>
                        <div class="form-check form-check-inline">
                            <input class="form-check-input" type="radio" name="paymentFrequency" id="frequencyYearly" value="yearly">
                            <label class="form-check-label" for="frequencyYearly">Yearly</label>
                        </div>
                    </div>
                </div>
            </div>
            
            <div class="d-grid gap-2">
                <button type="submit" class="btn btn-primary">Calculate EMI</button>
            </div>
        </form>
        
        <div class="loading">
            <div class="spinner-border text-primary" role="status">
                <span class="visually-hidden">Loading...</span>
            </div>
        </div>
        
        <div class="card result-card">
            <div class="card-header bg-primary text-white">
                <h5 class="card-title mb-0">EMI Calculation Results</h5>
            </div>
            <div class="card-body">
                <div class="row">
                    <div class="col-md-6">
                        <p><strong>EMI Amount:</strong> <span id="emiAmount" class="fw-bold">₹0.00</span></p>
                        <p><strong>Total Interest:</strong> <span id="totalInterest">₹0.00</span></p>
                    </div>
                    <div class="col-md-6">
                        <p><strong>Total Payment:</strong> <span id="totalPayment">₹0.00</span></p>
                        <p><strong>Interest Rate per Term:</strong> <span id="ratePerTerm">0.00%</span></p>
                    </div>
                </div>
                
                <div class="chart-container">
                    <canvas id="emiChart"></canvas>
                </div>
            </div>
        </div>
    </div>

    <!-- Bootstrap JS Bundle with Popper -->
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/js/bootstrap.bundle.min.js"></script>
    <!-- Chart.js -->
    <script src="https://cdn.jsdelivr.net/npm/chart.js"></script>
    
    <script>
        document.addEventListener('DOMContentLoaded', function() {
            const emiForm = document.getElementById('emiForm');
            const resultCard = document.querySelector('.result-card');
            const loadingDiv = document.querySelector('.loading');
            let emiChart = null;
            
            // Sync term unit with payment frequency
            document.getElementById('termUnit').addEventListener('change', function() {
                const selectedValue = this.value;
                document.querySelector(`input[name="paymentFrequency"][value="${selectedValue}"]`).checked = true;
            });
            
            // Sync payment frequency with term unit
            document.querySelectorAll('input[name="paymentFrequency"]').forEach(radio => {
                radio.addEventListener('change', function() {
                    if (this.checked) {
                        document.getElementById('termUnit').value = this.value;
                    }
                });
            });
            
            emiForm.addEventListener('submit', function(e) {
                e.preventDefault();
                
                const principal = parseFloat(document.getElementById('principal').value);
                const annualRate = parseFloat(document.getElementById('annualRate').value);
                const termValue = parseInt(document.getElementById('termValue').value);
                const termUnit = document.getElementById('termUnit').value;
                
                // Show loading
                loadingDiv.style.display = 'block';
                resultCard.style.display = 'none';
                
                // AJAX request
                const xhr = new XMLHttpRequest();
                xhr.open('POST', 'emi_calculator.php', true);
                xhr.setRequestHeader('Content-Type', 'application/x-www-form-urlencoded');
                xhr.onreadystatechange = function() {
                    if (xhr.readyState === 4) {
                        loadingDiv.style.display = 'none';
                        
                        if (xhr.status === 200) {
                            try {
                                const response = JSON.parse(xhr.responseText);
                                
                                if (response.success) {
                                    // Update results
                                    document.getElementById('emiAmount').textContent = '₹' + response.emi.toFixed(2);
                                    document.getElementById('totalInterest').textContent = '₹' + response.totalInterest.toFixed(2);
                                    document.getElementById('totalPayment').textContent = '₹' + response.totalPayment.toFixed(2);
                                    document.getElementById('ratePerTerm').textContent = response.ratePerTerm.toFixed(2) + '%';
                                    
                                    // Update chart
                                    updateChart(principal, response.totalInterest);
                                    
                                    // Show results
                                    resultCard.style.display = 'block';
                                } else {
                                    alert(response.message || 'Error in calculation');
                                }
                            } catch (e) {
                                alert('Error parsing response');
                            }
                        } else {
                            alert('Request failed');
                        }
                    }
                };
                
                xhr.send('action=calculate&principal=' + principal + 
                         '&annualRate=' + annualRate + 
                         '&termValue=' + termValue + 
                         '&termUnit=' + termUnit);
            });
            
            function updateChart(principal, totalInterest) {
                const ctx = document.getElementById('emiChart').getContext('2d');
                
                // Destroy previous chart if exists
                if (emiChart) {
                    emiChart.destroy();
                }
                
                emiChart = new Chart(ctx, {
                    type: 'doughnut',
                    data: {
                        labels: ['Principal', 'Interest'],
                        datasets: [{
                            data: [principal, totalInterest],
                            backgroundColor: [
                                '#36a2eb',
                                '#ff6384'
                            ],
                            borderWidth: 1
                        }]
                    },
                    options: {
                        responsive: true,
                        maintainAspectRatio: false,
                        plugins: {
                            legend: {
                                position: 'bottom'
                            },
                            tooltip: {
                                callbacks: {
                                    label: function(context) {
                                        let label = context.label || '';
                                        if (label) {
                                            label += ': ';
                                        }
                                        label += '₹' + context.raw.toFixed(2);
                                        return label;
                                    }
                                }
                            }
                        }
                    }
                });
            }
        });
    </script>
</body>
</html>
<div class="d-flex">
<div class="mb-3" style="width:500px;">
    <h5 class="mb-3">Loan Installment Calculator</h5>
    <form id="emiForm">
        <div <?=$input_row_div_design?>>
            <label for="loan_amount" <?=$label_design_col1?>>Installment Type</label>
            <select <?=$input_design?> name="emi_type" id="emi_type" required>
            <option value=''>Select Installment Type</option>
            <option value='calculate_emi.php'>Principal + Interest</option>
            <option value='calculate_emi_interest_only.php'>Interest only</option>
            </select>
        </div>
        <div <?=$input_row_div_design?>>
            <label for="loan_amount" <?=$label_design_col1?>>Loan Amount (₹)</label>
            <input type="number" <?=$input_design?> id="loan_amount" name="loan_amount" min="1" placeholder="Loan Amout (₹)" required>
        </div>
        <div <?=$input_row_div_design?>>
            <label for="interest_rate" <?=$label_design_col1?>>Interest Rate (%)</label>
            <input type="number" <?=$input_design?> id="interest_rate" name="interest_rate" step="0.01" min="0.01" required>
        </div>
        <div <?=$input_row_div_design?>>
            <label for="loan_term" <?=$label_design_col1?>>Loan Term</label>
            <input type="number" <?=$input_design?> id="loan_term" name="loan_term" min="2" required>
        </div>
        <div <?=$input_row_div_design?>>
            <label <?=$label_design_col1?>>Repayment Frequency</label>
            <div class="d-flex justify-content-start align-items-center gap-3">
                <div class="form-check">
                    <input class="form-check-input" type="radio" name="term_type" value="weekly" id="weekly">
                    <label class="form-check-label" for="weekly">Weekly</label>
                </div>
                <div class="form-check">
                    <input class="form-check-input" type="radio" name="term_type" value="monthly" id="monthly" checked>
                    <label class="form-check-label" for="monthly">Monthly</label>
                </div>
                <div class="form-check">
                    <input class="form-check-input" type="radio" name="term_type" value="quarterly" id="quarterly">
                    <label class="form-check-label" for="quarterly">Quarterly</label>
                </div>
                <div class="form-check">
                    <input class="form-check-input" type="radio" name="term_type" value="yearly" id="yearly">
                    <label class="form-check-label" for="yearly">Yearly</label>
                </div>
            </div>
        </div>
        <center><button type="submit" class="btn btn-sm btn-subtle-success">Calculate Installment</button></center>
    </form>
</div>
<div id="results" class="d-none"></div>
</div>

<?php include_once("footer_copyright.php"); ?>
<script>
    $(document).ready(function() {
        $('#emiForm').on('submit', function(e) {
            e.preventDefault();
            let checkedCount = $('input[name="term_type"]:checked').length;
            if (checkedCount !== 1) {
                $('#results').html('<div class="alert alert-danger">Please select exactly one repayment frequency.</div>').removeClass('d-none').show();
                return;
            }

            let formData = {
                scriptUrl: $('#emi_type').val(),
                loan_amount: parseFloat($('#loan_amount').val()),
                interest_rate: parseFloat($('#interest_rate').val()),
                loan_term: parseInt($('#loan_term').val()),
                term_type: $('input[name="term_type"]:checked').val()
            };

            if (isNaN(formData.loan_amount) || isNaN(formData.interest_rate) || isNaN(formData.loan_term)) {
                $('#results').html('<div class="alert alert-danger">Please enter valid numbers for all fields.</div>').removeClass('d-none').show();
                return;
            }

            $.ajax({
                url: formData.scriptUrl,
                type: 'POST',
                data: formData,
                success: function(response) {
                    $('#results').html(response).removeClass('d-none').show();
                },
                error: function(xhr, status, error) {
                    $('#results').html('<div class="alert alert-danger">Error calculating EMI: ' + error + '. Ensure the backend is hosted on a PHP server.</div>').removeClass('d-none').show();
                }
            });
        });
    });
</script>
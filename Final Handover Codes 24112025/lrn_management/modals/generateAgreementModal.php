<!-- Modal -->
<?php
$btnDisabledStatus = "";

if($current_status_step_order == 2 && $mandatory_documents_upload_status == 0)
$btnDisabledStatus = "disabled";
?>
<div class="modal fade" id="generateAgreementModal" data-bs-backdrop="static" data-bs-keyboard="false" tabindex="-1" aria-labelledby="staticBackdropLabel" aria-hidden="true">
  <div class="modal-dialog modal-sm modal-dialog-centered">
    <div class="modal-content container p-3" style="width:300px;">
    <center>
        <form action="generateAgreement.php" method="post">
        <input type="hidden" name="lrn" value="<?=$_REQUEST['lrn']?>">
        <div class="text-start ps-2 fs-9 text-danger">Request Loan Amount </div>
        <input type="text" class="form-control mb-1 text-danger fw-semibold" value="<?=$lrn['required_loan_amount']?>" readonly>

        <input type="text" class="form-control mb-1" name="approved_loan_amount" placeholder="Approved Loan Amount" onBlur="setCreditLimit(this.value)" required>

        <?php
        $paymentFrequencyArray = ['Weekly','Monthly','Quarterly','Yearly'];
        $options = "<option value=''>Select Payment Frequency</option>";

        foreach($paymentFrequencyArray AS $val)
        {
            $options .= "<option>".$val."</options>";
        }

        echo "<select class='form-select mb-1' name='payment_frequency' required>".$options."</select>";

        ?>

        <input type="text" class="form-control mb-1" name="loan_tenure" placeholder="Loan Tenure As Per Payment Frequency" required>
        <input type="text" class="form-control mb-1" name="roi" placeholder="Rate of Interest" required>
        <input type="reset" class="btn btn-sm btn-subtle-danger rounded" data-bs-dismiss="modal" value="Cancel">
        <input type="submit" class="btn btn-sm btn-subtle-success rounded" value="Generate Agreement" <?=$btnDisabledStatus?>>
        </form>
    </center>
    </div>
  </div>
</div>
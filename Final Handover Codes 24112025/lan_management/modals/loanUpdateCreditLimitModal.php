<!-- Modal -->
<div class="modal fade" id="loanUpdateCreditLimitModal" data-bs-backdrop="static" data-bs-keyboard="false" tabindex="-1" aria-labelledby="manageLeadLabel" aria-hidden="true">
  <div class="modal-dialog modal-dialog-centered">
    <div class="modal-content container p-3" style="width:300px;">
    <center>
        <form method="post" action="updateCreditLimit.php">
        <input type="hidden" name="lan" value="<?=$_REQUEST['lan']?>">

        <div class="fs-9 text-start text-danger fw-semibold ps-2">Current Credit Limit</div>
        <input type="text" class="form-control form-control-sm m-1" id="current_credit_limit" value="<?=getCreditLimit($lan['lrn'],$con)?>" readonly>
        <input type="text" name="new_credit_limit" id="new_credit_limit" class="form-control form-control-sm m-1" placeholder="New Credit Limit" onFocus="$('#updateBtn').prop('disabled',true)" onBlur="validateCreditLimit()" required>

        <button class="btn btn-sm btn-subtle-success" id="updateBtn" disabled>Update Credit Limit</button>
        <button type="reset" class="btn btn-sm btn-subtle-danger" data-bs-dismiss="modal">Cancel</button>
        </form>
    </center>
    </div>
  </div>
</div>
<script>
function validateCreditLimit()
{
    if(parseInt($('#new_credit_limit').val()) > parseInt($('#current_credit_limit').val()))
    {
        $('#updateBtn').prop('disabled',false);
        $('#updateBtn').focus();
    }
    else
    {
        $('#updateBtn').prop('disabled',true);
        alert('New Credit Limit must be graeter than Current');
    }
}
</script>
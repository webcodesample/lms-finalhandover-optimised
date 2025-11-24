<!-- Modal -->
<div class="modal fade" id="loanExtensionModal" data-bs-backdrop="static" data-bs-keyboard="false" tabindex="-1" aria-labelledby="manageLeadLabel" aria-hidden="true">
  <div class="modal-dialog modal-dialog-centered">
    <div class="modal-content container p-3" style="width:300px;">
    <center>
        <form method="post" action="extendLoan.php">
        <input type="hidden" name="lan" value="<?=$_REQUEST['lan']?>">
        <input type="hidden" name="installmentType" value="<?=$lan['payment_frequency']?>">
        <div class="fs-9 text-start text-danger fw-semibold ps-2">Extension Period (In <?=str_replace('ly','s',$lan['payment_frequency'])?>)</div>
        <input type="number" name="extensionPeriod" class="form-control form-control-sm m-1" min="3" value="3" required>
        <input type="text" name="extensionROI" class="form-control form-control-sm m-1" placeholder="Extension Interest Rate" required>

        <button class="btn btn-sm btn-subtle-success">Extend Loan</button>
        <button type="reset" class="btn btn-sm btn-subtle-danger" data-bs-dismiss="modal">Cancel</button>
        </form>
    </center>
    </div>
  </div>
</div>
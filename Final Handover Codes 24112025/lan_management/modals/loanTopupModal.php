<!-- Modal -->
<div class="modal fade" id="loanTopupModal" data-bs-backdrop="static" data-bs-keyboard="false" tabindex="-1" aria-labelledby="manageLeadLabel" aria-hidden="true">
  <div class="modal-dialog modal-dialog-centered">
    <div class="modal-content container p-3" style="width:300px;">
    <center>
        <form method="post" action="topupLoan.php">
        <input type="hidden" name="lan" value="<?=$_REQUEST['lan']?>">
        <input type="hidden" name="installmentType" value="<?=$lan['payment_frequency']?>">
        <div class="fs-9 text-start text-danger fw-semibold ps-2">Topup Amount</div>
        <input type="text" name="topup_amount" class="form-control form-control-sm m-1" placeholder="Topup Amount" required>
        <input type="text" name="topupROI" class="form-control form-control-sm m-1" placeholder="Topup Interest Rate" required>
        <input type="date" name="topup_date" class="form-control form-control-sm m-1" min="<?=date('Y-m-d',strtotime('today+10days'))?>" required>
        <button class="btn btn-sm btn-subtle-success">Topup Loan</button>
        <button type="reset" class="btn btn-sm btn-subtle-danger" data-bs-dismiss="modal">Cancel</button>
        </form>
    </center>
    </div>
  </div>
</div>
<!-- Modal -->
<div class="modal fade" id="loanUpdateROIModal" data-bs-backdrop="static" data-bs-keyboard="false" tabindex="-1" aria-labelledby="manageLeadLabel" aria-hidden="true">
  <div class="modal-dialog modal-dialog-centered">
    <div class="modal-content container p-3" style="width:300px;">
    <center>
        <form method="post" action="updateROI.php">
        <input type="hidden" name="lan" value="<?=$_REQUEST['lan']?>">
        <input type="hidden" name="installmentType" value="<?=$lan['payment_frequency']?>">
        <div class="fs-9 text-start text-danger fw-semibold ps-2">Current Rate of Interest</div>
        <input type="text" class="form-control form-control-sm m-1" value="<?=$lan['roi'].'% '.$lan['payment_frequency']?>">
        <input type="text" name="new_roi" class="form-control form-control-sm m-1" placeholder="New Interest Rate" required>
        <div class="fs-9 text-start text-danger fw-semibold ps-2">WEF Date</div>
        <input type="date" name="wef_date" class="form-control form-control-sm m-1" min="<?=date('Y-m-d',strtotime('today+10days'))?>" max="<?=date('Y-m-d',strtotime('today+20days'))?>" required>
        
        <button class="btn btn-sm btn-subtle-success">Update ROI</button>
        <button type="reset" class="btn btn-sm btn-subtle-danger" data-bs-dismiss="modal">Cancel</button>
        </form>
    </center>
    </div>
  </div>
</div>
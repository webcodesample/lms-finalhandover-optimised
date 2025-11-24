<!-- Modal -->
<div class="modal fade" id="killLead" data-bs-backdrop="static" data-bs-keyboard="false" tabindex="-1" aria-labelledby="killLeadLabel" aria-hidden="true">
  <div class="modal-dialog modal-sm modal-dialog-centered">
    <div class="modal-content container p-3" style="width:300px;">
    <center>
        <form action="update_status_advance.php" method="post">
        <input type="hidden" name="lrn" value="<?=$_REQUEST['lrn']?>">
        <input type="hidden" name="current_status_id" value="<?=$lrn['status_id']?>">

        <select name="next_status_description" class="form-select form-select-sm mb-2" required>
        <option value="">Select Status</option>
        <option>Deleted</option>
        <option>LRN Rejected</option>
        <option>Customer Rejected</option>
        </select>

        <textarea class="form-control mb-2" name="updation_remark" style="height:120px;" placeholder="Reason to Delete/Reject" required></textarea>
        <input type="button" class="btn btn-sm btn-subtle-danger rounded" data-bs-dismiss="modal" value="Cancel">
        <input type="submit" class="btn btn-sm btn-subtle-warning rounded" value="Delete/Reject">

        </form>
    </center>
    </div>
  </div>
</div>
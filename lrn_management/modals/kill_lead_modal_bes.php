<!-- Modal -->
<div class="modal fade" id="killLead" data-bs-backdrop="static" data-bs-keyboard="false" tabindex="-1" aria-labelledby="killLeadLabel" aria-hidden="true">
  <div class="modal-dialog modal-sm modal-dialog-centered">
    <div class="modal-content container p-3" style="width:300px;">
    <center>
        <form action="request_lead_deletion.php" method="post">
            <input type="hidden" name="lrn" value="<?=$_REQUEST['lrn']?>">
            <input type="hidden" name="action_perform" value="kill_lead">
            <input type="hidden" name="current_status_id" value="<?=$current_status_id?>">
            <input type="hidden" name="current_status_batch_id" value="<?=$current_status_batch_id?>">
            <input type="hidden" name="next_status_description" value="Pending">

            <textarea class="form-control" name="updation_remark" style="height:120px;" placeholder="Reason to Deletion Request" required></textarea>
            <input type="button" class="btn btn-danger rounded" data-bs-dismiss="modal" value="Cancel">
            <input type="submit" class="btn btn-primary rounded" value="Submit">
        </form>
    </center>
    </div>
  </div>
</div>
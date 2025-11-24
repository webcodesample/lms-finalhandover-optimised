<!-- Modal -->
<?php
$btnDisabledStatus = "";

if($current_status_step_order == 2 && $mandatory_documents_upload_status == 0)
$btnDisabledStatus = "disabled";
?>
<div class="modal fade" id="staticBackdrop" data-bs-backdrop="static" data-bs-keyboard="false" tabindex="-1" aria-labelledby="staticBackdropLabel" aria-hidden="true">
  <div class="modal-dialog modal-sm modal-dialog-centered">
    <div class="modal-content container p-3" style="width:300px;">
    <center>
        <form action="update_status.php" method="post">
        <input type="hidden" name="lrn" value="<?=$_REQUEST['lrn']?>">
        <input type="hidden" name="action_perform" value="next_status">
        <input type="hidden" name="current_status_id" value="<?=$lrn['status_id']?>">
        
        <textarea class="form-control mb-2" name="updation_remark" style="height:120px;" placeholder="Status Updation Remark" required></textarea>
        <input type="reset" class="btn btn-sm btn-subtle-danger rounded" data-bs-dismiss="modal" value="Cancel">
        <input type="submit" class="btn btn-sm btn-subtle-primary rounded" value="Update Status" <?=$btnDisabledStatus?>>
        </form>
    </center>
    </div>
  </div>
</div>
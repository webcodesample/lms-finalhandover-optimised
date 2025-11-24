<!-- Modal -->
<div class="modal fade" id="updateLANRequestModal" data-bs-backdrop="static" data-bs-keyboard="false" tabindex="-1" aria-labelledby="manageLeadLabel" aria-hidden="true">
  <div class="modal-dialog modal-dialog-centered">
    <div class="modal-content container p-3" style="width:300px;">
    <center>
        <form method="post" action="updateLANRequest.php">
        <input type="hidden" name="request_ref_id" id="request_ref_id">
        <input type="hidden" name="returnType" id="returnType">
        <div class="d-flex align-items-center gap-2 mb-2">
            <div class="fs-9 text-primary fw-semibold">Status</div>
            <div class="d-flex text-success fw-semibold fs-9">
            <input type="radio" name="status" class="form-check-input me-1" value="1" required>Closed
            </div>
            <div class="d-flex text-danger fw-semibold fs-9">
            <input type="radio" name="status" class="form-check-input me-1" value="2" required>Canceled
            </div>
        </div>
        <textarea name="remark" class="form-control mb-2" placeholder="Request Updation Remark" required></textarea>
        <button class="btn btn-sm btn-subtle-success">Update Request</button>
        <button type="reset" class="btn btn-sm btn-subtle-danger" data-bs-dismiss="modal">Cancel</button>
        </form>
    </center>
    </div>
  </div>
</div>
<script>
function setReqRefID(RefId,ReturnType)
{
    $('#request_ref_id').val(RefId);
    $('#returnType').val(ReturnType);
}
</script>
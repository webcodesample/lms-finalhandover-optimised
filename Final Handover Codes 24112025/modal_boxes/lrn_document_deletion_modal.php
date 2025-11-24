<!-- Modal -->
<div class="modal fade" id="deleteURNDocument" data-bs-backdrop="static" data-bs-keyboard="false" tabindex="-1" aria-labelledby="deleteURNDocumentLabel" aria-hidden="false">
  <div class="modal-dialog modal-dialog-centered">
    <div class="modal-content container p-3" style="width:300px;">
    <center>
        <form action="delete_lrn_document.php" method="post">
        <input type="hidden" name="lrn" value="<?=$_REQUEST['lrn']?>">
        <input type="hidden" name="uploaded_document_id" id="uploaded_document_id">

        <div>
        <textarea class="form-control m-1" name="document_deletion_remark" style="width:250px;height:120px;" placeholder="Document Deletion Remark" required></textarea>

        <div class="d-flex">
        <input type="button" class="btn btn-danger rounded m-1" data-bs-dismiss="modal" value="Cancel">
        <input type="submit" class="btn btn-primary rounded m-1" value="Delete Document">
        </div>

        </div>
        </form>
    </center>
    </div>
  </div>
</div>
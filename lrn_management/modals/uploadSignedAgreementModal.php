<!-- Modal -->
<div class="modal fade" id="uploadSignedAgreementModal" data-bs-backdrop="static" data-bs-keyboard="false" tabindex="-1" aria-labelledby="staticBackdropLabel" aria-hidden="true">
  <div class="modal-dialog modal-sm modal-dialog-centered">
    <div class="modal-content container p-3" style="width:300px;">
    <center>
        <form action="uploadSignedAgreement.php" method="post" enctype="multipart/form-data">
        <input type="hidden" name="lrn" value="<?=$_REQUEST['lrn']?>">
        
        <input type="file" class="form-control mb-2" name="signed_agreement" required>
        <input type="reset" class="btn btn-sm btn-subtle-danger rounded" data-bs-dismiss="modal" value="Cancel">
        <input type="submit" class="btn btn-sm btn-subtle-success rounded" value="Upload Agreement">
        </form>
    </center>
    </div>
  </div>
</div>
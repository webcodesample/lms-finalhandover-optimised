<!-- Modal -->
<div class="modal fade" id="viewLANRequestModal" data-bs-backdrop="static" data-bs-keyboard="false" tabindex="-1" aria-labelledby="staticBackdropLabel" aria-hidden="true">
  <div class="modal-dialog modal-lg modal-dialog-centered">
    <div class="modal-content container p-3">
        <div class="d-flex justify-content-between align-items-center gap-2 mb-1">
            <h5 class="text-primary">LAN Request History : <span class="text-danger"><?=$_REQUEST['lan']?></span></h5>
            <input type="button" class="btn btn-sm btn-subtle-danger rounded-2 px-1 py-0 fs-8" data-bs-dismiss="modal" value="X" title="Close">
        </div>
        <div class="table-responsive table-scrollbar" style="max-height:500px;">
        <?php include_once("../lan_modules/lan_request_history.php"); ?>
        </div>
    </div>
  </div>
</div>


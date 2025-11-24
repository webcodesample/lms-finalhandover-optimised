<div class="modal fade" id="alertModal" data-bs-backdrop="static" aria-labelledby="staticBackdropLabel" aria-hidden="true">
  <div class="modal-dialog modal-sm">
    <div class="modal-content">
        <div class="d-flex pt-2 px-2 justify-content-between">
            <h5 class="text-<?=$alertbox_color_code?>" id="staticBackdropLabel"><?=$alertbox_title?></h5>
            <button type="button" class="btn-close fs-10" data-bs-dismiss="modal" aria-label="Close"></button>
        </div>
        <div class="modal-body fw-semibold text-center">
            <h5 class="text-<?=$alertbox_color_code?>"><?=$action_perform_msg?></h5>
        </div>
        <div class="container text-center">
            <button type="button" class="btn btn-sm btn-<?=$alertbox_color_code?> p-1 mx-auto mb-2" data-bs-dismiss="modal">OK</button>
        </div>
    </div>
  </div>
</div>
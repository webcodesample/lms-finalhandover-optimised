<!-- Modal -->
<div class="modal fade" id="addCRNDocument" data-bs-backdrop="static" data-bs-keyboard="false" tabindex="-1" aria-labelledby="staticBackdropLabel" aria-hidden="true">
  <div class="modal-dialog modal-sm modal-dialog-centered">
    <div class="modal-content">
		<div class="modal-body">
		<center>
			<form action="update_crn_document_list.php" method="post" enctype="multipart/form-data">
				<input type="hidden" name="crn" value="<?=$crn['id']?>">
				<h6 class="mb-3 text-center">New CRN Document</h6>
				<input type="text" name="document_title" placeholder="Document Title" <?=$input_design?>>
				<input type="file" name="crn_document" <?=$input_design?>>
				<button class="btn btn-sm btn-subtle-success m-1">Add CRN Document</button>
				<button type="reset" class="btn btn-sm btn-subtle-danger m-1" data-bs-dismiss="modal">Cancel</button>
			</form>
		</center>
      </div>
    </div>
  </div>
</div>
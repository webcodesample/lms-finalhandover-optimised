<!-- Modal -->
<div class="modal fade" id="addIntroducer" data-bs-backdrop="static" data-bs-keyboard="false" tabindex="-1" aria-labelledby="staticBackdropLabel" aria-hidden="true">
  <div class="modal-dialog modal-sm modal-dialog-centered">
    <div class="modal-content">
		<div class="modal-body">
		<center>
			<form id="introducer_form" action="create.php" method="post" enctype="multipart/form-data">
				<h6 class="mb-3 text-center">New Introducer Details</h6>
				<select name="type" <?=$input_design?> onChange="checkIntroducerType(this.value)">
				<option value=''>Select Type</option>
				<option value='1'>Individual</option>
				<option value='2'>Corporate</option>
				</select>
				<input type="text" name="name" placeholder="Name" <?=$input_design?>>
				<input type="text" name="contact_person" id="contact_person" placeholder="Contact Person" <?=$input_design?>>
				<input type="text" name="mobile" placeholder="Mobile" <?=$input_design?>>
				<input type="email" name="email" placeholder="Email" <?=$input_design?>>
				<input type="text" name="commission_percent" placeholder="Commission Percentage" <?=$input_design?>>

				<textarea name="address" id="address" placeholder="Address" <?=$input_textarea_design?>></textarea>

				<input type="text" name="document_title" placeholder="Document Title" <?=$input_design?>>
				<input type="file" name="introducer_document" <?=$input_design?>>

				<button class="btn btn-sm btn-subtle-success m-1">Add Introducer</button>
				<button type="reset" class="btn btn-sm btn-subtle-danger m-1" data-bs-dismiss="modal">Cancel</button>
			</form>
		</center>
      </div>
    </div>
  </div>
</div>
<script src="../js/lms.js"></script>
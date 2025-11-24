<!-- Modal -->
<div class="modal fade" id="addBank" data-bs-backdrop="static" data-bs-keyboard="false" tabindex="-1" aria-labelledby="staticBackdropLabel" aria-hidden="true">
  <div class="modal-dialog modal-sm modal-dialog-centered">
    <div class="modal-content">
		<div class="modal-body">
		<center>
			<form id="customer_form" action="update_crn_bank_list.php" method="post" enctype="multipart/form-data">
				<input type="hidden" name="crn" value="<?=$crn['id']?>">
				<h6 class="mb-3 text-center">New Bank Account Details</h6>
				<input type="text" name="bank_name" placeholder="Bank Name" <?=$input_design?>>
				<textarea name="branch_address" placeholder="Bank Branch Address" <?=$input_textarea_design?>></textarea>
				<input type="text" name="account_holder_name" placeholder="Account Holder Name" <?=$input_design?>>
				<input type="text" name="account_number" placeholder="Account Number" <?=$input_design?>>
				<input type="text" name="ifsc" placeholder="Bank IFSC" <?=$input_design?>>
			
				<div class="m-2 ps-1 fs-9 text-start">
					Is Primary? 
					<input type="radio" name="is_primary" class="form-check-input m-1" value="0" required>No
					<input type="radio" name="is_primary" class="form-check-input m-1" value="1" required>Yes
				</div>
				<div class="m-2 ps-1 fs-9 text-start">
					Account Verified
					<input type="radio" name="verification_status" class="form-check-input m-1" value="0" required>No
					<input type="radio" name="verification_status" class="form-check-input m-1" value="1" required>Yes
				</div>
				<input type="file" name="bank_proof" <?=$input_design?>>
				<button class="btn btn-sm btn-subtle-success m-1">Add Bank Account</button>
				<button type="reset" class="btn btn-sm btn-subtle-danger m-1" data-bs-dismiss="modal">Cancel</button>
			</form>
		</center>
      </div>
    </div>
  </div>
</div>
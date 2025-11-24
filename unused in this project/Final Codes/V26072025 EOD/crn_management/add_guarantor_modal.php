<!-- Modal -->
<div class="modal fade" id="addGuarantor" data-bs-backdrop="static" data-bs-keyboard="false" tabindex="-1" aria-labelledby="staticBackdropLabel" aria-hidden="true">
  <div class="modal-dialog modal-sm modal-dialog-centered">
    <div class="modal-content">
		<div class="modal-body">
		<center>
			<form id="guarantor_form" action="update_crn_guarantor_list.php" method="post" enctype="multipart/form-data">
				<input type="hidden" name="crn" value="<?=$crn['id']?>">
				<h6 class="mb-3 text-center">New Guarantor Details</h6>
				<input type="text" name="name" placeholder="Name" <?=$input_design?>>
				<input type="text" name="company" placeholder="Company Name" <?=$input_design?>>
				<input type="text" name="mobile" placeholder="Mobile" <?=$input_design?>>
				<input type="email" name="email" placeholder="Email" <?=$input_design?>>

				<textarea name="permanent_address" id="guarantor_permanent_address" placeholder="Permanent Address" onChange="setCurrentAddress(this.value)" <?=$input_textarea_design?>></textarea>
				<div class="text-start ms-2"><input type="checkbox" id="addressCheck" class="form-check-input m-1" onClick="validateBothAddress(this.checked)"> <span class="m-1 fs-9 fw-semibold">Same AS Permanent Address</span></div>
				<textarea name="current_address" id="guarantor_current_address" placeholder="Current Address" <?=$input_textarea_design?>></textarea>

				<input type="text" name="document_title" placeholder="Document Title" <?=$input_design?>>
				<input type="file" name="guarantor_document" <?=$input_design?>>

				<button class="btn btn-sm btn-subtle-success m-1">Add Guarantor</button>
				<button type="reset" class="btn btn-sm btn-subtle-danger m-1" data-bs-dismiss="modal">Cancel</button>
			</form>
		</center>
      </div>
    </div>
  </div>
</div>
<script>
function validateBothAddress(checkStatus)
{
	if(checkStatus)
	{
		$('#guarantor_current_address').prop('readonly',true);
		$('#guarantor_current_address').val($('#guarantor_permanent_address').val());
	}
	else
	{
		$('#guarantor_current_address').prop('readonly',false);
		$('#guarantor_current_address').val('');		
	}
}

function setCurrentAddress(addressVal)
{
	if($('#addressCheck').prop('checked'))
	$('#guarantor_current_address').val(addressVal);
	else
	$('#guarantor_current_address').val('');
}

function showCompanyInput(custType)
{
	if(custType == 2)
	$('#customer_company').prop('disabled',false);
	else
	$('#customer_company').prop('disabled',true);
}
</script>
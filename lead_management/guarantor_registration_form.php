<div>
<h6 class="m-1">Guarantor's Details</h6>
<input type="text" name="guarantor['name']" placeholder="Name" <?=$input_design?>>
<input type="text" name="guarantor['mobile']" placeholder="Mobile" <?=$input_design?>>
<input type="email" name="guarantor['email']" placeholder="Email" <?=$input_design?>>

<textarea name="guarantor['permanent_address']" id="guarantor_permanent_address" placeholder="Permanent Address" onChange="setCurrentAddress(this.value)" <?=$input_textarea_design?>></textarea>
<input type="checkbox" id="addressCheck" class="form-check-input m-1" onClick="validateBothAddress(this.checked)"> <span class="m-1 fs-9 fw-semibold">Same AS Permanent Address</span>
<textarea name="guarantor['current_address']" id="guarantor_current_address" placeholder="Current Address" <?=$input_textarea_design?>></textarea>

</div>

<div>
<h6 class="m-1">Guarantor's Document</h6>
<input type="text" name="guarantor['document_title']" placeholder="Document Title" <?=$input_design?>>
<input type="file" name="document" <?=$input_design?>>
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
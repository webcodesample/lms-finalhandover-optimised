<div class="d-flex justify-content-between mb-3">
<h5 class="text-primary my-2">Create New CRN</h5>
<?php setGoBack('crn_list.php'); ?>
</div>

<?php
$input_design = 'class="form-control form-control-sm m-1" style="width:250px;" required';
$input_design_optional = 'class="form-control form-control-sm m-1" style="width:250px;"';
$input_textarea_design = 'class="form-control form-control-sm m-1" style="width:250px; height:100px;" required';
?>

<form id="customer_form" action="create_customer_profile.php" method="post" enctype="multipart/form-data">

<div class="p-3 rounded-2 border border-secondary-subtle">
<div class="d-flex gap-3">

<div>
<h6 class="m-1">Customer's Details</h6>
<select <?=$input_design?> name="customer[cust_type]" onChange="showCompanyInput(this.value)">
<option value="">Select Type</option>
<option value="1">Individual</option>
<option value="2">Corporate</option>
</select>
<input type="text" name="customer[company_name]" placeholder="Company Name" id="customer_company" <?=$input_design?> disabled>
<input type="text" name="customer[name]" placeholder="Name" <?=$input_design?>>
<input type="text" name="customer[mobile]" placeholder="Mobile" <?=$input_design?>>
<input type="text" name="customer[alt_mobile]" placeholder="Alternate Mobile" <?=$input_design_optional?>>
<input type="text" name="customer[email]" placeholder="Email" <?=$input_design?>>

<textarea name="customer[permanent_address]" placeholder="Permanent Address" <?=$input_textarea_design?>></textarea>
</div>

<div>
<h6 class="m-1">Customer's Document</h6>
<input type="text" name="customer[document_title]" placeholder="Document Title" <?=$input_design_optional?>>
<input type="file" name="document" <?=$input_design_optional?>>
<textarea name="customer[brief_note]" placeholder="Special Note" <?=$input_textarea_design?>>No Note</textarea>
</div>

</div>

<center>
<button class="btn btn-sm btn-subtle-success m-1">Create Customer Profile</button>
</center>
</div>

</form>

<?php include_once("footer_copyright.php") ?>
<script>
function showCompanyInput(custType)
{
	if(custType == 2)
	$('#customer_company').prop('disabled',false);
	else
	{
		$('#customer_company').prop('disabled',true);
		$('#customer_company').val('');
	}
}
</script>
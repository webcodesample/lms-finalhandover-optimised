<div class="d-flex justify-content-between mb-3">
<h5 class="text-primary my-2">Convert Lead -> CRN</h5>
<?php setGoBack('temp_leads.php'); ?>
</div>

<?php
if($email_duplicay_flag == 0)
{
	$input_design = 'class="form-control form-control-sm m-1" style="width:250px;" required';
	$input_design_optional = 'class="form-control form-control-sm m-1" style="width:250px;"';
	$input_textarea_design = 'class="form-control form-control-sm m-1" style="width:250px; height:100px;" required';
?>

<form id="customer_form" action="../crn_management/create_customer_profile.php" method="post" enctype="multipart/form-data">

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
<input type="text" name="customer[name]" value="<?=$temp_lead['name']?>" <?=$input_design?> readonly>
<input type="text" name="customer[mobile]" value="<?=$temp_lead['mobile']?>" <?=$input_design?> readonly>
<input type="text" name="customer[alt_mobile]" placeholder="Alternate Mobile" <?=$input_design_optional?>>
<input type="text" name="customer[email]" value="<?=$temp_lead['email']?>" <?=$input_design?> readonly>

<textarea name="customer[permanent_address]" id="guarantor_permanent_address" placeholder="Permanent Address" <?=$input_textarea_design?>></textarea>
</div>

<div>
<h6 class="m-1">Customer's Document</h6>
<input type="text" name="customer[document_title]" placeholder="Document Title" <?=$input_design_optional?>>
<input type="file" name="document" <?=$input_design_optional?>>
<textarea name="customer[brief_note]" placeholder="Special Note" <?=$input_textarea_design?>>No Note</textarea>
</div>

<input type="hidden" name="temp_lead_id" value="<?=$_REQUEST['temp_lead_id']?>">
<input type="hidden" name="lead_source_id" value="<?=$temp_lead['source_id']?>">
</div>

<center>
<button class="btn btn-sm btn-subtle-success m-1">Create Customer Profile</button>
</center>
</div>

</form>

<?php
}
else
{
	if(getFieldValue('hidden','id',$_REQUEST['temp_lead_id'],'temp_leads',$con) == 1)
	echo "<div class='text-danger text-center fw-semibold'>Sorry! Email <span class='text-primary'>".$temp_lead['email']."</span> Already Exist</div><script>setTimeout(function(){window.history.back();},1000);</script>";
	else
	echo "<div class='text-danger text-center fw-semibold'>Sorry! Email <span class='text-primary'>".$temp_lead['email']."</span> Already Exist<br>If you want to change it then <a href='manage_temp_lead.php?id=".$temp_lead['id']."' class='text-decoration-none'>click here</a></div>";
}
?>

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
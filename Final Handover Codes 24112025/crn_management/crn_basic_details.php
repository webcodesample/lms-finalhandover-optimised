<form id="customer_form" action="update_customer_profile.php" method="post" enctype="multipart/form-data">
<input type="hidden" name="crn" value="<?=$crn['id']?>">

<div <?=$input_row_div_design?>>
<?=createinput('name',$crn['name'],$label_design_col1,$required_input_box_design)?>
<div class="d-flex">
<div <?=$label_design_col2?>>Type</div>
<select name="cust_type" id="cust_type" <?=$required_input_box_design?> onChange="showCompanyInput(this.value)">
<?=generateTypeDropdown($crn['cust_type'])?>
</select>
</div>
<?=createinput('company_name',$crn['company_name'],$label_design_col2,$required_input_box_design)?>
</div>

<div <?=$input_row_div_design?>>
<?=createinput('email',$crn['email'],$label_design_col1,$readonly_input_box_design)?>
<?=createinput('mobile',$crn['mobile'],$label_design_col2,$required_input_box_design)?>
<?=createinput('alt_mobile',$crn['alt_mobile'],$label_design_col2,$input_box_design)?>
</div>

<div <?=$input_row_div_design?>>
<?=createTextarea('permanent_address',$crn['permanent_address'],$label_design_col1,$required_textarea_design)?>
<?=createTextarea('brief_note',$crn['brief_note'],$label_design_col2,$required_textarea_design)?>
</div>

<center>
<button class="btn btn-sm btn-subtle-success m-1" onClick="return validateChanges()">Update Basic Details</button>
</center>

</form>

<script>
showCompanyInput(<?=$crn['cust_type']?>);

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
<script src="../js/validateInputChanges.js"></script>
<script>
function validateChanges()
{
	var inputs = <?=json_encode($crn)?>;
	return validateInputChanges(inputs);
}
</script>
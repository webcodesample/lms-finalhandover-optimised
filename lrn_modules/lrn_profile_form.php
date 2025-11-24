<?php
$hidden_inputs = "";
$hidden_input_keys = ['name','email','dob','cust_type','mobile','alt_mobile','current_address','permanent_address','brief_note'];
$comparable_lrn_data = [];

foreach($hidden_input_keys AS $key)
{
    $hidden_inputs .= "<input type='hidden' name='".$key."_old' id='".$key."_old' value='".$lrn[$key]."'>";
	$comparable_lrn_data[$key] = $lrn[$key];
}
?>

<form id="lrn_profile_form" action="update_lrn_profile.php" method="post">
<input type="hidden" name="lrn" value="<?=$_REQUEST["lrn"]?>">
<?=$hidden_inputs?>

<div <?=$input_row_div_design?>>
<?=createInput('name',$lrn['name'],$label_design_col1,$required_input_box_design,$field_visibility)?>
<div class="d-flex">
<div <?=$label_design_col2?>>Type</div>
<select name="cust_type" id="cust_type" <?=$required_input_box_design?> <?=$field_visibility?>>
<?=generateTypeDropdown($lrn['cust_type'])?>
</select>
</div>
</div>

<div <?=$input_row_div_design?>>
<?=createInput('email',$lrn['email'],$label_design_col1,$readonly_input_box_design,$field_visibility)?>
<?=createInput('dob',date('Y-m-d',$lrn['dob']),$label_design_col2,$required_input_box_design,$field_visibility,'date')?>
</div>

<div <?=$input_row_div_design?>>
<?=createInput('mobile',$lrn['mobile'],$label_design_col1,$required_input_box_design,$field_visibility)?>
<?=createInput('alt_mobile',$lrn['alt_mobile'],$label_design_col2,$input_box_design,$field_visibility)?>
</div>

<div <?=$input_row_div_design?>>
<?=createInput('current_address',$lrn['current_address'],$label_design_col1,$required_textarea_design,$field_visibility,'textarea')?>
<?=createInput('permanent_address',$lrn['permanent_address'],$label_design_col2,$required_textarea_design,$field_visibility,'textarea')?>
</div>

<div <?=$input_row_div_design?>>
<?=createInput('brief_note',$lrn['brief_note'],$label_design_col1,$required_textarea_design,$field_visibility,'textarea')?>
<?=createInput('updation_remark','',$label_design_col2,$required_textarea_design,$field_visibility,'textarea')?>
</div>

<center class="mt-3">
<input type="reset" class="btn btn-sm btn-subtle-danger rounded" data-bs-dismiss="modal" value="Cancel">
<input type="submit" onClick="return validateProfileChanges()" value="Update Profile" class="btn btn-subtle-success btn-sm <?=setBtnVisibilityClass($lrn_using_by_me)?>" <?=$field_visibility?>>
</center>

</form>

<script src="../js/validateInputChanges.js"></script>
<script>
function validateProfileChanges()
{
	var inputs = <?=json_encode($comparable_lrn_data)?>;
	return validateInputChanges(inputs);
}
</script>
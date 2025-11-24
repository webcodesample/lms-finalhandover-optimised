<?php
$hidden_inputs = "";
$hidden_input_keys = ['company_name','company_type','company_doi','company_email','company_mobile','company_turnover','company_address'];
$comparable_lrn_data = [];

foreach($hidden_input_keys AS $key)
{
    $hidden_inputs .= "<input type='hidden' name='".$key."_old' id='".$key."_old' value='".$lrn[$key]."'>";
    $comparable_lrn_data[$key] = $lrn[$key];
}
?>

<form id="lrn_company_form" action="update_lrn_company.php" method="post">
<input type="hidden" name="lrn" value="<?=$_REQUEST["lrn"]?>">
<?=$hidden_inputs?>

<div <?=$input_row_div_design?>>
<?=createInput('company_name',$lrn['company_name'],$label_design_col1,$required_input_box_design,$field_visibility)?>
<div class="d-flex">
<div <?=$label_design_col2?>>Type</div>
<select name="company_type" id="company_type" <?=$required_input_box_design?> <?=$field_visibility?>>
<?php
$company_type_options = "<option value=''>Company Type</option>";
$company_type_list = getRowsData('company_type_list',$con,'description','ASC');
while($company_type = mysqli_fetch_assoc($company_type_list))
{
    if($company_type['id'] == $lrn['company_type'])
    $company_type_options .= "<option value=".$company_type['id']." selected>".$company_type['description']."</option>";
    else
    $company_type_options .= "<option value=".$company_type['id'].">".$company_type['description']."</option>";
}
echo $company_type_options;
?>
</select>
</div>
</div>

<div <?=$input_row_div_design?>>
<?=createInput('company_doi',date('Y-m-d',$lrn['company_doi']),$label_design_col1,$required_input_box_design,$field_visibility,'date')?>
<?=createInput('company_turnover',$lrn['company_turnover'],$label_design_col2,$required_input_box_design,$field_visibility)?>
</div>

<div <?=$input_row_div_design?>>
<?=createInput('company_email',$lrn['company_email'],$label_design_col1,$required_input_box_design,$field_visibility)?>
<?=createInput('company_mobile',$lrn['company_mobile'],$label_design_col2,$required_input_box_design,$field_visibility)?>
</div>

<div <?=$input_row_div_design?>>
<?=createInput('company_address',$lrn['company_address'],$label_design_col1,$required_textarea_design,$field_visibility,'textarea')?>
<?=createInput('updation_remark','',$label_design_col2,$required_textarea_design,$field_visibility,'textarea')?>
</div>

<center class="mt-3">
<input type="reset" class="btn btn-sm btn-subtle-danger rounded" data-bs-dismiss="modal" value="Cancel">
<input type="submit" onClick="return validateCompanyChanges()" value="Update Company Detail" class="btn btn-subtle-success btn-sm <?=setBtnVisibilityClass($lrn_using_by_me)?>" <?=$field_visibility?>>
</center>

</form>

<script src="../js/validateInputChanges.js"></script>
<script>
function validateCompanyChanges()
{
	var inputs = <?=json_encode($comparable_lrn_data)?>;
	return validateInputChanges(inputs);
}
</script>
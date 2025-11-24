<?php
if($urn_using_by_me)
{
    $form_start = "<form id='lrn_profile_form' action='update_lrn_profile.php' method='post'>
                    <input type='hidden' name='lrn' value='".$_REQUEST['lrn']."'>";
    $form_end = "</form>";
}
else
{
    $form_start = "";
    $form_end = "";
}

$label_design_col1 = "class='py-2' style='width:100px;'";
$label_design_col2 = "class='py-2' style='width:100px;'";
$input_row_div_design = "class='d-flex flex-wrap justify-content-between fs-9 px-5'";

$hidden_inputs = "";
unset($lrn['id'],$lrn['lrn'],$lrn['updation_remark'],$lrn['datentime'],$lrn['updated_columns']);

foreach($lrn AS $key => $value)
{
    $hidden_inputs .= "<input type='hidden' name='".$key."_old' id='".$key."_old' value='".$value."'>";
}
?>

<?=$form_start?>
<?=$hidden_inputs?>

<div <?=$input_row_div_design?>>
<div class="d-flex">
<div <?=$label_design_col1?>>LRN</div>
<input type="text" <?=$disabled_input_red?> value="LA<?=$_REQUEST['lrn']?>">
</div>
<div class="d-flex">
<div <?=$label_design_col2?>>Current Status</div>
<input type="text" <?=$disabled_input_green?> value="<?=$current_status_description?>">
</div>
<div class="d-flex">
<div <?=$label_design_col2?>>Allocated ID</div>
<input type="text" <?=$disabled_input_green?> value="<?=$lrn_allocation_id?>">
</div>
</div>

<div <?=$input_row_div_design?>>
<?=createinput('name',$lrn['name'],$label_design_col1,$required_input_box_design,$field_visibility)?>
<?=createinput('email',$lrn['email'],$label_design_col2,$readonly_input_box_design,$field_visibility)?>
<?=createinput('dob',date('Y-m-d',$lrn['dob']),$label_design_col2,$required_input_box_design,$field_visibility,'date')?>
</div>

<div <?=$input_row_div_design?>>
<div class="d-flex">
<div <?=$label_design_col1?>>Type</div>
<select name="cust_type" id="cust_type" <?=$required_input_box_design?> <?=$field_visibility?>>
<?=generateTypeDropdown($lrn['cust_type'])?>
</select>
</div>
<?=createinput('mobile',$lrn['mobile'],$label_design_col2,$required_input_box_design,$field_visibility)?>
<?=createinput('alt_mobile',$lrn['alt_mobile'],$label_design_col2,$input_box_design,$field_visibility)?>
</div>

<div <?=$input_row_div_design?>>
<?=createTextarea('current_address',$lrn['current_address'],$label_design_col1,$required_textarea_design,$field_visibility)?>
<?=createTextarea('permanent_address',$lrn['permanent_address'],$label_design_col2,$required_textarea_design,$field_visibility)?>
<?=createTextarea('brief_note',$lrn['brief_note'],$label_design_col2,$required_textarea_design,$field_visibility)?>
</div>

<div <?=$input_row_div_design?>>
<?=createTextarea('updation_remark','',$label_design_col1,$required_textarea_design,$field_visibility)?>
</div>

<center class="my-3">
<input type="submit" onClick="return validateChanges()" value="Update Profile" class="btn btn-subtle-success btn-sm <?=setBtnVisibilityClass($urn_using_by_me)?>" <?=$field_visibility?>>
</center>

<?=$form_end?>

<script>
function validateChangess()
{
    let flag = false;

    let inputs = ['name','dob','cust_type','mobile','alt_mobile','current_address','permanent_address','brief_note'];

    for(i=0;i<inputs.length;i++)
    {
        if(inputs[i] == 'dob')
        {
            if($('#dob').val() !== '<?=date('Y-m-d',$lrn['dob'])?>')
            flag = true;
        }
        else if($('#'+inputs[i]).val() !== $('#'+inputs[i]+'_old').val())
        flag = true;
    }

    if(flag == false)
    alert('All values are same as old');

    return flag;
}
</script>
<script src="../js/validateInputChanges.js"></script>
<script>
function validateChanges()
{
	var inputs = <?=json_encode($lrn)?>;
	return validateInputChanges(inputs);
}
</script>
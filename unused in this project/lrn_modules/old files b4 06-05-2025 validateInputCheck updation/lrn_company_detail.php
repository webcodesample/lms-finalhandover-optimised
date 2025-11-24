<?php
if($urn_using_by_me)
{
    $form_start = "<form id='lrn_company_form' action='update_lrn_company.php' method='post'>
                    <input type='hidden' name='lrn' value='".$_REQUEST['lrn']."'>";
    $form_end = "</form>";
}
else
{
    $form_start = "";
    $form_end = "";
}

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
<?=createinput('company_name',$lrn['company_name'],$label_design_col1,$required_input_box_design,$field_visibility)?>
<div class="d-flex">
<div <?=$label_design_col2?>>Type</div>
<select name="company_type" id="company_type" <?=$required_input_box_design?> <?=$field_visibility?>>
<?php
$company_type_options = "<option value=''>Type</option>";
$company_type_list = getRowsData('company_type_list',$con);
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
<?=createinput('company_doi',date('Y-m-d',$lrn['company_doi']),$label_design_col2,$required_input_box_design,$field_visibility,'date')?>
</div>

<div <?=$input_row_div_design?>>
<?=createinput('company_email',$lrn['company_email'],$label_design_col1,$required_input_box_design,$field_visibility)?>
<?=createinput('company_mobile',$lrn['company_mobile'],$label_design_col2,$required_input_box_design,$field_visibility)?>
<?=createinput('company_turnover',$lrn['company_turnover'],$label_design_col2,$required_input_box_design,$field_visibility)?>
</div>

<div <?=$input_row_div_design?>>
<?=createTextarea('company_address',$lrn['company_address'],$label_design_col1,$required_textarea_design,$field_visibility)?>
<?=createTextarea('updation_remark','',$label_design_col2,$required_textarea_design,$field_visibility)?>
</div>

<center class="my-3">
<input type="submit" onClick="return validateChanges()" value="Update Company Detail" class="btn btn-subtle-success btn-sm <?=setBtnVisibilityClass($urn_using_by_me)?>" <?=$field_visibility?>>
</center>

<?=$form_end?>

<script>
function validateChanges()
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
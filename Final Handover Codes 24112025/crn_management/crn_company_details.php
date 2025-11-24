<?php
$where_con_array = ['crn' => $_REQUEST['crn']];

$crn_company = mysqli_fetch_assoc(getRowsDataCon('crn_company_details',$where_con_array,$con));
$company = ['mobile' => '','email' => '','doi' => 0,'annual_annual_turnover' => '','address' => '','type'=>0];
if($crn_company)
$company = $crn_company;
?>
<form id="customer_form" action="update_crn_company.php" method="post" enctype="multipart/form-data">
<input type="hidden" name="crn" value="<?=$company['crn']?>">

<div <?=$input_row_div_design?>>
<?=createinput('name',$company['name'],$label_design_col1,$required_input_box_design)?>
<div class="d-flex">
<div <?=$label_design_col2?>>Type</div>
<select name="type" id="type" <?=$required_input_box_design?>>
<?php
$company_type_options = "<option value=''>Type</option>";
$company_type_list = getRowsData('company_type_list',$con);
while($company_type = mysqli_fetch_assoc($company_type_list))
{
    if($company_type['id'] == $company['type'])
    $company_type_options .= "<option value=".$company_type['id']." selected>".$company_type['description']."</option>";
    else
    $company_type_options .= "<option value=".$company_type['id'].">".$company_type['description']."</option>";
}
echo $company_type_options;
?>
</select>
</div>
<?=createinput('doi',date('Y-m-d',$company['doi']),$label_design_col2,$required_input_box_design,'','date')?>
</div>

<div <?=$input_row_div_design?>>
<?=createinput('email',$company['email'],$label_design_col1,$required_input_box_design)?>
<?=createinput('mobile',$company['mobile'],$label_design_col2,$required_input_box_design)?>
<?=createinput('annual_turnover',$company['annual_turnover'],$label_design_col2,$required_input_box_design)?>
</div>

<div <?=$input_row_div_design?>>
<?=createTextarea('address',$company['address'],$label_design_col1,$required_textarea_design)?>
</div>

<center class="my-3">
<input type="submit" onClick="return validateChanges()" value="Update Company Detail" class="btn btn-subtle-success btn-sm">
</center>

</form>

<script src="../js/validateInputChanges.js"></script>
<script>
function validateChanges()
{
	var inputs = <?=json_encode($company)?>;
	return validateInputChanges(inputs);
}
</script>
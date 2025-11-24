<?php
if($lrn['company_type'] > 0)
$lrn_company_type = getFieldValue('description','id',$lrn['company_type'],'company_type_list',$con);
else
$lrn_company_type = 'Not Selected';
?>
<div class="d-flex my-3 bg-warning-subtle ps-2">
<h5 class="my-2">Company Detail</h5>
</div>
<div <?=$input_row_div_design?>>
<?=createinput('Name',$lrn['company_name'],$label_design_col1,$readonly_input_box_design,$field_visibility)?>
<?=createinput('Type',$lrn_company_type,$label_design_col2,$readonly_input_box_design,$field_visibility)?>
<?=createinput('DOI',date('d-m-Y',$lrn['company_doi']),$label_design_col1,$readonly_input_box_design,$field_visibility)?>
</div>

<div <?=$input_row_div_design?>>
<?=createinput('Email',$lrn['company_email'],$label_design_col1,$readonly_input_box_design,$field_visibility)?>
<?=createinput('Mobile',$lrn['company_mobile'],$label_design_col2,$readonly_input_box_design,$field_visibility)?>
<?=createinput('Annual Turnover',$lrn['company_turnover'],$label_design_col2,$readonly_input_box_design,$field_visibility)?>
</div>

<div <?=$input_row_div_design?>>
<?=createTextarea('company_address',$lrn['company_address'],$label_design_col1,$readonly_textarea_design,$field_visibility)?>
</div>

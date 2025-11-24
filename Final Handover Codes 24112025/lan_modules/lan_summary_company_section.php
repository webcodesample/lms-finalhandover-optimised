<?php
if($lan['company_type'] > 0)
$lrn_company_type = getFieldValue('description','id',$lan['company_type'],'company_type_list',$con);
else
$lrn_company_type = 'Not Selected';
?>
<div class="d-flex my-3 bg-warning-subtle ps-2">
<h5 class="my-2">Company Detail</h5>
</div>
<div <?=$input_row_div_design?>>
<?=createDisplayField('Name',$lan['company_name'],$label_design_col1,$readonly_input_box_design)?>
<?=createDisplayField('Type',$lrn_company_type,$label_design_col2,$readonly_input_box_design)?>
<?=createDisplayField('Incorporated On',date('d-m-Y',$lan['company_doi']),$label_design_col2,$readonly_input_box_design)?>
</div>

<div <?=$input_row_div_design?>>
<?=createDisplayField('Email',$lan['company_email'],$label_design_col1,$readonly_input_box_design)?>
<?=createDisplayField('Mobile',$lan['company_mobile'],$label_design_col2,$readonly_input_box_design)?>
<?=createDisplayField('Annual Turnover',$lan['company_turnover'],$label_design_col2,$readonly_input_box_design)?>
</div>

<div <?=$input_row_div_design?>>
<?=createDisplayField('Address',$lan['company_address'],$label_design_col1,$readonly_textarea_design,'textarea')?>
</div>

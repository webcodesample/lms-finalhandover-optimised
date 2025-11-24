<div class="d-flex my-3 bg-warning-subtle ps-2">
<h5 class="my-2">Customer Profile</h5>
<?=displaySummaryEditIcon('lrnProfileModal',$field_visibility);?>
</div>

<div <?=$input_row_div_design?>>
<?=createDisplayField('Name',$lrn['name'],$label_design_col1,$readonly_input_box_design)?>
<?=createDisplayField('Email',$lrn['email'],$label_design_col2,$readonly_input_box_design)?>
<?=createDisplayField('Date of Birth',date('d-m-Y',$lrn['dob']),$label_design_col2,$readonly_input_box_design)?>
</div>

<div <?=$input_row_div_design?>>
<div class="d-flex">
<?php
$customer_types = ['Individual','Corporate'];
?>
<?=createDisplayField('Type',$customer_types[$lrn['cust_type']-1],$label_design_col1,$readonly_input_box_design)?>
</div>
<?=createDisplayField('Mobile',$lrn['mobile'],$label_design_col2,$readonly_input_box_design)?>
<?=createDisplayField('Alt Mobile',$lrn['alt_mobile'],$label_design_col2,$input_box_design)?>
</div>

<div <?=$input_row_div_design?>>
<?=createDisplayField('Current Address',$lrn['current_address'],$label_design_col1,$readonly_textarea_design,'textarea')?>
<?=createDisplayField('Permanent Address',$lrn['permanent_address'],$label_design_col2,$readonly_textarea_design,'textarea')?>
<?=createDisplayField('Brief Note',$lrn['brief_note'],$label_design_col2,$readonly_textarea_design,'textarea')?>
</div>
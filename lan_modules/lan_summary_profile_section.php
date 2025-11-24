<div class="d-flex my-3 bg-warning-subtle ps-2">
<h5 class="my-2">Customer Profile</h5>
</div>

<div <?=$input_row_div_design?>>
<?=createDisplayField('Name',$lan['name'],$label_design_col1,$readonly_input_box_design)?>
<?=createDisplayField('Email',$lan['email'],$label_design_col2,$readonly_input_box_design)?>
<?=createDisplayField('Date of Birth',date('d-m-Y',$lan['dob']),$label_design_col2,$readonly_input_box_design)?>
</div>

<div <?=$input_row_div_design?>>
<div class="d-flex">
<?php
$customer_types = ['Individual','Corporate'];
?>
<?=createDisplayField('Type',$customer_types[$lan['cust_type']-1],$label_design_col1,$readonly_input_box_design)?>
</div>
<?=createDisplayField('Mobile',$lan['mobile'],$label_design_col2,$readonly_input_box_design)?>
<?=createDisplayField('Alt Mobile',$lan['alt_mobile'],$label_design_col2,$input_box_design)?>
</div>

<div <?=$input_row_div_design?>>
<?=createDisplayField('Current Address',$lan['current_address'],$label_design_col1,$readonly_textarea_design,'textarea')?>
<?=createDisplayField('Permanent Address',$lan['permanent_address'],$label_design_col2,$readonly_textarea_design,'textarea')?>
<?=createDisplayField('Brief Note',$lan['brief_note'],$label_design_col2,$readonly_textarea_design,'textarea')?>
</div>
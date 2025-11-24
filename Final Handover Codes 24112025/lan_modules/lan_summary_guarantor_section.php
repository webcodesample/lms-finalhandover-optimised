<div class="d-flex my-3 bg-warning-subtle ps-2">
<h5 class="my-2">Guarantor Detail</h5>
</div>

<?php
if($lan['guarantor_id'] > 0)
{
?>

<div <?=$input_row_div_design?>>
<?=createDisplayField('Name',$guarantor['name'],$label_design_col1,$readonly_input_box_design)?>
<?=createDisplayField('Email',$guarantor['email'],$label_design_col2,$readonly_input_box_design)?>
<?=createDisplayField('Mobile',$guarantor['mobile'],$label_design_col2,$readonly_input_box_design)?>
</div>

<div <?=$input_row_div_design?>>
<?=createDisplayField('Current Address',$guarantor['current_address'],$label_design_col1,$readonly_textarea_design,'textarea')?>
<?=createDisplayField('Permanent Address',$guarantor['permanent_address'],$label_design_col2,$readonly_textarea_design,'textarea')?>
</div>

<?php } ?>
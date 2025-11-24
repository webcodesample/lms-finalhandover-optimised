<div class="d-flex my-3 bg-warning-subtle ps-2">
<h5 class="my-2">Guarantor Detail</h5>
</div>

<div <?=$input_row_div_design?>>
<?=createinput('name',$guarantor['name'],$label_design_col1,$readonly_input_box_design,$field_visibility)?>
<?=createinput('email',$guarantor['email'],$label_design_col2,$readonly_input_box_design,$field_visibility)?>
<?=createinput('mobile',$guarantor['mobile'],$label_design_col2,$readonly_input_box_design,$field_visibility)?>
</div>

<div <?=$input_row_div_design?>>
<?=createTextarea('permanent_address',$guarantor['permanent_address'],$label_design_col1,$readonly_textarea_design,$field_visibility)?>
<?=createTextarea('current_address',$guarantor['current_address'],$label_design_col2,$readonly_textarea_design,$field_visibility)?>
</div>
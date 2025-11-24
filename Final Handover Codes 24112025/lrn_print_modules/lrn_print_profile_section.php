<div class="d-flex my-3 bg-warning-subtle ps-2">
<h5 class="my-2">Customer Profile</h5>
</div>

<div <?=$input_row_div_design?>>
<?=createinput('name',$lrn['name'],$label_design_col1,$readonly_input_box_design,$field_visibility)?>
<div class="d-flex">
<?php
$customer_types = ['Individual','Corporate'];
?>
<?=createinput('type',$customer_types[$lrn['cust_type']-1],$label_design_col2,$readonly_input_box_design,$field_visibility)?>
</div>
<?=createinput('dob',$lrn['dob'],$label_design_col2,$readonly_input_box_design,$field_visibility)?>
</div>

<div <?=$input_row_div_design?>>
<?=createinput('email',$lrn['email'],$label_design_col1,$readonly_input_box_design,$field_visibility)?>
<?=createinput('mobile',$lrn['mobile'],$label_design_col1,$readonly_input_box_design,$field_visibility)?>
<?=createinput('alt_mobile',$lrn['alt_mobile'],$label_design_col2,$input_box_design,$field_visibility)?>
</div>

<div class="d-flex gap-5">
<div>

<div <?=$input_row_div_design?>>
<?=createTextarea('permanent_address',$lrn['permanent_address'],$label_design_col1,$readonly_textarea_design,$field_visibility)?>
<?=createTextarea('current_address',$lrn['current_address'],$label_design_col2,$readonly_textarea_design,$field_visibility)?>
</div>

<div <?=$input_row_div_design?>>
<?=createTextarea('brief_note',$lrn['brief_note'],$label_design_col1,$readonly_textarea_design,$field_visibility)?>
</div>

</div>

<div class="d-flex rounded-1 border border-secondary-subtle mx-5 mt-2 justify-content-center align-items-center fs-9" style="height:200px; width:170px;">Custoemr Photo</div>

</div>
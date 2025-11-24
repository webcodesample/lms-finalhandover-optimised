<div class="d-flex my-3 bg-warning-subtle ps-2">
<h5 class="my-2">Bank Account Detail</h5>
</div>

<div <?=$input_row_div_design?>>
<?=createinput('bank_name',$bank['bank_name'],$label_design_col1,$readonly_input_box_design,$field_visibility)?>
<?=createinput('account_number',$bank['account_number'],$label_design_col2,$readonly_input_box_design,$field_visibility)?>
<?=createinput('Bank IFSC',$bank['ifsc'],$label_design_col2,$readonly_input_box_design,$field_visibility)?>
</div>
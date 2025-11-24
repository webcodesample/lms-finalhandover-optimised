<div class="d-flex my-3 bg-warning-subtle ps-2">
<h5 class="my-2">Bank Account Detail</h5>
<?=displaySummaryEditIcon('lrnBankModal',$field_visibility);?>
</div>

<div <?=$input_row_div_design?>>
<?=createDisplayField('Bank Name',$bank['bank_name'],$label_design_col1,$readonly_input_box_design)?>
<?=createDisplayField('Account Number',$bank['account_number'],$label_design_col2,$readonly_input_box_design)?>
<?=createDisplayField('IFSC',$bank['ifsc'],$label_design_col2,$readonly_input_box_design)?>
</div>
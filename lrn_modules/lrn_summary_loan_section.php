<div class="d-flex my-3 bg-warning-subtle ps-2">
<h5 class="my-2">Loan Detail</h5>
<?=displaySummaryEditIcon('lrnLoanModal',$field_visibility);?>
</div>

<div <?=$input_row_div_design?>>
<?=createDisplayField('Product',$product,$label_design_col1,$readonly_input_box_design)?>
<?=createDisplayField('Amount',$lrn['required_loan_amount'],$label_design_col2,$readonly_input_box_design)?>
<?=createDisplayField('Introducer',$introducer,$label_design_col2,$readonly_input_box_design)?>
</div>
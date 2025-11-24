<div class="d-flex my-3 bg-warning-subtle ps-2">
<h5 class="my-2">Loan Detail</h5>
</div>

<div <?=$input_row_div_design?>>
<?=createDisplayField('Product',$product,$label_design_col1,$readonly_input_box_design)?>
<?=createDisplayField('Approved Amount',$lan['approved_loan_amount'],$label_design_col2,$readonly_input_box_design)?>
<?=createDisplayField('Payment Frequency',$lan['payment_frequency'],$label_design_col2,$readonly_input_box_design)?>
</div>

<div <?=$input_row_div_design?>>
<?=createDisplayField('Interest Rate',$lan['roi'].'% '.$lan['payment_frequency'],$label_design_col1,$readonly_input_box_design)?>
<?=createDisplayField('Loan Tenure',$lan['loan_tenure'].' '.str_replace('ly','s',$lan['payment_frequency']),$label_design_col2,$readonly_input_box_design)?>
<?=createDisplayField('Introducer',$introducer.' - '.$introducer_code,$label_design_col2,$readonly_input_box_design)?>
</div>
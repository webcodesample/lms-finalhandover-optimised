<div class="d-flex my-3 bg-warning-subtle ps-2">
<h5 class="my-2">Approved Loan Detail</h5>
</div>

<?php
$loan_tenure_description = $lrn['loan_tenure']." ".str_replace('ly','s',$lrn['payment_frequency']);
?>

<div class='ps-2'>
Your <span class="py-2 fw-semibold text-primary"><?=getFieldValue('description','id',$lrn['product_id'],'product_list',$con)?></span> of amount <span class="py-2 fw-semibold text-primary"><?=$lrn['approved_loan_amount']?>/- Only @ <?=$lrn['roi']?>% rate of interest <?=$lrn['payment_frequency']?></span> has been approved for <span class="py-2 fw-semibold text-primary"><?=$loan_tenure_description?></span>
</div>
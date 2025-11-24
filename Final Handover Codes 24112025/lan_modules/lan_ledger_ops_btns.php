<div class="d-flex justify-content-end gap-1">
    <button class="btn btn-sm btn-subtle-warning p-1" data-bs-toggle="modal" data-bs-target="#viewLANRequestModal" title="LAN Request List" <?=$editMode?>>LAN Request</button>
    <?php
    $approval_date = getFieldValue('approval_date','lan',$lan['lan'],'dispatch_list',$con);
    //echo date('d-m-Y h:i:s A',strtotime('+1 '.str_replace('ly','s',$lan['payment_frequency']), $approval_date));
    //if((strtotime('today') > strtotime('03-06-2025')) && (strtotime('today') < strtotime('15-07-2025')))
    if(strtotime('today') > strtotime('+1 '.str_replace('ly','s',$lan['payment_frequency']), $approval_date))
    {
        echo '<button class="btn btn-sm btn-subtle-secondary p-1" data-bs-toggle="modal" data-bs-target="#loanExtensionModal" title="Extend Loan Period" '.$editMode.'>Extension</button>';
    }
    ?>
    <button class="btn btn-sm btn-subtle-primary p-1" data-bs-toggle="modal" data-bs-target="#applyWaiverModal" title="Apply Waiver" <?=$editMode?>>Waiver</button>
    <button class="btn btn-sm btn-subtle-info p-1" data-bs-toggle="modal" data-bs-target="#loanTopupModal" title="Add Topup Amount Loan" <?=$editMode?>>Topup</button>
    <button class="btn btn-sm btn-subtle-success p-1" data-bs-toggle="modal" data-bs-target="#loanPartPaymentModal" title="Make Part Payment" <?=$editMode?>>Part Payment</button>
    <button class="btn btn-sm btn-subtle-danger p-1" data-bs-toggle="modal" data-bs-target="#loanUpdateROIModal" title="Change Interest Rate" <?=$editMode?>>Update ROI</button>
    <button class="btn btn-sm btn-subtle-success p-1" data-bs-toggle="modal" data-bs-target="#loanUpdateCreditLimitModal" title="Update credit Limit" <?=$editMode?>>Credit Limit</button>
</div>
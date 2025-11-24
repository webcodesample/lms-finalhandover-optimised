<form action="manageLANPayment.php" method="post">
<input type="hidden" name="lan" value="<?=$_REQUEST['lan']?>">
<input type="hidden" name="action" id="action">
<div class="d-flex justify-content-between align-items-center mb-2">
    <h5 class="text-info pt-2">Repayment Schedule</h5>

    <div class="d-flex justify-content-end gap-2">
    <input type="date" name="transaction_date" id="transaction_date" class="form-control form-control-sm w-auto" max="<?=date('Y-m-d')?>" value="<?=date('Y-m-d')?>" title="Transaction Date" required disabled>
    <button class="btn btn-sm btn-subtle-warning d-none" id="unpaidBtn" <?=$editMode?>>Delete Payment</button>
    <button class="btn btn-sm btn-subtle-info d-none" id="paidBtn" <?=$editMode?>>Receive Payment</button>
    </div>
</div>

<div>
<table class="table table-sm table-bordered table-hover fs-9">
    <thead class="table-info text-center">
        <tr>
            <th rowspan='2' valign='middle'>#</th>
            <th colspan='5'>Due Detail</th>
            <th colspan='2'>Received Detail</th>
            <th rowspan='2' valign='middle'>Status</th>
        </tr>
        <tr>
            <th>Date</th>
            <th>Principal</th>
            <th>Interest</th>
            <th>Other Charges</th>
            <th>Total</th>
            <th>Amount</th>
            <th>Date</th>
        </tr>
    </thead>
    <tbody>

<?php
$i = 0;
$balance = 0;
$principal_sum_total = 0;
$interest_sum_total = 0;
$other_charges_sum_total = 0;
$due_amount_sum_total = 0;
$received_amount_total = 0;
//$repayment_schedule_list = mysqli_query($con,"SELECT *, GROUP_CONCAT(id SEPARATOR ', ') AS all_id FROM repayment_schedule_list WHERE lan = ".$lan['lan']." GROUP BY due_date ORDER BY due_date ASC");
$repayment_schedule_list = mysqli_query($con,"SELECT *, SUM(principal) as principal_sum, SUM(interest) as interest_sum, SUM(other_charges) as other_charges_sum, SUM(due_amount) as due_amount_sum, SUM(collected_amount) as collected_amount_sum, GROUP_CONCAT(id SEPARATOR ', ') AS all_id FROM repayment_schedule_list WHERE lan = ".$lan['lan']." GROUP BY due_date,collected_date,status ORDER BY due_date ASC");
while($repayment_schedule = mysqli_fetch_assoc($repayment_schedule_list))
{
    $i++;
    $received_date = "N/A";
    $status = "<span class='fw-semibold text-danger'>Unpaid</span>";
    $checkClass = "paid";
    $checkBorderClass = "border-info-subtle";
    $rowBgColor = "";

    if($repayment_schedule['status'] == 1)
    {
        $status = "<span class='fw-semibold text-success'>Paid</span>";
        $checkClass = "unpaid";
        $checkBorderClass = "border-danger-subtle";
        $rowBgColor = "bg-warning-subtle";
    }
    else if($repayment_schedule['status'] == 2)
    {
        $status = "<span class='fw-semibold text-primary'>Partial Paid</span>";
        $checkClass = "semipaid";
        $checkBorderClass = "border-warning-subtle";
        $rowBgColor = "bg-danger-subtle";
    }

    if($repayment_schedule['collected_date'] > 0)
    $received_date = date('d-M-Y', $repayment_schedule['collected_date']);

    echo "<tr class='text-end pe-2 ".$rowBgColor."'>
        <td class='ps-2 text-start'><input type='checkbox' class='form-check-input me-1 ".$checkBorderClass." ".$checkClass."' value='".$repayment_schedule['all_id']."' onClick='enableCheckOnly(&quot;".$checkClass."&quot;)' name='payment_id_list[]' ".$editMode.">".$i."</td>
        <td class='text-center'>".date('d-M-Y', $repayment_schedule['due_date'])."</td>
        <td>".$repayment_schedule['principal_sum']."</td>
        <td>".$repayment_schedule['interest_sum']."</td>
        <td>".$repayment_schedule['other_charges_sum']."</td>
        <td>".$repayment_schedule['due_amount_sum']."</td>
        <td>".$repayment_schedule['collected_amount_sum']."</td>
        <td class='text-center'>".$received_date."</td>
        <td class='text-center'>".$status."</td>
        </tr>";

    $principal_sum_total += $repayment_schedule['principal_sum'];
    $interest_sum_total += $repayment_schedule['interest_sum'];
    $other_charges_sum_total += $repayment_schedule['other_charges_sum'];
    $due_amount_sum_total += $repayment_schedule['due_amount_sum'];
    $received_amount_total += $repayment_schedule['collected_amount_sum'];
}

if($i == 0)
echo "<tr><td colspan='6' class='text-danger text-center fw-bold'>No Transaction</td></tr>";
else
echo "<tr class='bg-info-subtle'>
    <th colspan='2' class='text-center'>Total</th>
    <td class='text-end pe-1 fw-semibold'>".$principal_sum_total."</td>
    <td class='text-end pe-1 fw-semibold'>".$interest_sum_total."</td>
    <td class='text-end pe-1 fw-semibold'>".$other_charges_sum_total."</td>
    <td class='text-end pe-1 fw-semibold'>".$due_amount_sum_total."</td>
    <td class='text-end pe-1 fw-semibold'>".$received_amount_total."</td>
    <td colspan='2'></td>
    </tr>";
?>
</tbody>
</table>
<span class="text-danger fw-semibold fs-9">*Other Charges (Processing Fee,Penal Cahrges,Late Payment Charges etc...)</span>
</div>
</form>

<script>
function enableCheckOnly(className)
{
    let checkedCount = $('.'+className+':checked').length;
    $('.paid').prop('disabled',false);
    $('.unpaid').prop('disabled',false);
    $('#paidBtn').addClass('d-none');
    $('#unpaidBtn').addClass('d-none');
    $('#transaction_date').prop('disabled',true);

    if(checkedCount > 0)
    {
        if(className == 'paid')
        {
            $('.unpaid').prop('disabled',true);
            $('#paidBtn').removeClass('d-none');
            $('#unpaidBtn').addClass('d-none');
            $('#action').val('receivePayment');
            $('#transaction_date').prop('disabled',false);
        }
        else
        {
            $('.paid').prop('disabled',true);
            $('#unpaidBtn').removeClass('d-none');
            $('#paidBtn').addClass('d-none');
            $('#action').val('deletePayment');
            $('#transaction_date').prop('disabled',true);
        }
    }
}
</script>
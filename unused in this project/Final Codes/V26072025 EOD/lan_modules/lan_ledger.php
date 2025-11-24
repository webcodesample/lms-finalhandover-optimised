<div class="d-flex justify-content-between align-items-center mb-2">
    <h5 class="text-info pt-2">Ledger Transactions</h5>
    
    <?php
    if(in_array($_SESSION['login_type'],[1,3,7,8]))
    include_once("lan_ledger_ops_btns.php");
    else
    {
        $requestMode = "";
        $where_clause = " WHERE request_for = ".$_REQUEST['lan']." AND status = 0";

        if(getRowCountMultiCol($where_clause,'customer_request_list',$con) > 0)
        $requestMode = "disabled";

        echo '<div>
                <button class="btn btn-sm btn-subtle-info p-1" data-bs-toggle="modal" data-bs-target="#viewLANRequestModal" title="View LAN Request">My Request</button>
                <button class="btn btn-sm btn-subtle-warning p-1" data-bs-toggle="modal" data-bs-target="#lanRequestModal" title="Create LAN Request" '.$requestMode.'>Create Request</button>
            </div>';
    }
    ?>
</div>

<div>
<table class="table table-sm table-bordered table-hover table-striped fs-9">
    <thead class="table-info text-center">
        <tr>
            <th>#</th>
            <th>Date</th>
            <th>Remark</th>
            <th>Debit</th>
            <th>Credit</th>
            <th>Balance</th>
        </tr>
    </thead>
    <tbody>

<?php
$i = 0;
$balance = 0;
$ledger_transactions = mysqli_query($con,"SELECT * FROM lan_ledger_transactions WHERE lan = ".$lan['lan']." AND date <= ".strtotime('01-01-2050')." ORDER BY date,id ASC");
while($ledger_transaction = mysqli_fetch_assoc($ledger_transactions))
{
    $i++;

    $debit = 0;
    $credit = 0;
    $debit_display = '';
    $credit_display = '';

    if($ledger_transaction['type'] == 1)
    $credit = $ledger_transaction['amount'];

    if($ledger_transaction['type'] == 0)
    $debit = $ledger_transaction['amount'];

    $balance = $balance + $credit - $debit;

    if($debit > 0)
    $debit_display = $debit;

    if($credit > 0)
    $credit_display = $credit;

    echo "<tr>
        <td class='ps-2'>".$i."</td>
        <td>".date('d-M-Y', $ledger_transaction['date'])."</td>
        <td>".$ledger_transaction['remark']."</td>
        <td class='text-danger fw-semibold text-end pe-2'>".$debit_display."</td>
        <td class='text-success fw-semibold text-end pe-2'>".$credit_display."</td>
        <td>".$balance."</td>
        </tr>";
}

if($i == 0)
echo "<tr><td colspan='6' class='text-danger text-center fw-bold'>No Transaction</td></tr>";
?>

</tbody>
</table>
</div>

<?php
if(in_array($_SESSION['login_type'],[1,3,7,8]))
{
    include_once("modals/updateLANRequestModal.php");
    include_once("modals/viewLANRequestModal.php");
    include_once("modals/loanExtensionModal.php");
    include_once("modals/loanTopupModal.php");
    include_once("modals/applyWaiverModal.php");
    include_once("modals/loanPartPaymentModal.php");
    include_once("modals/loanUpdateROIModal.php");
    include_once("modals/loanUpdateCreditLimitModal.php");
}
else
{
    include_once("modals/lanRequestModal.php");
    include_once("../lan_management/modals/viewLANRequestModal.php");
}
?>
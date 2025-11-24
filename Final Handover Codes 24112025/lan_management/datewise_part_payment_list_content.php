<div class="d-flex justify-content-between mb-2">
<h5>Part Payment List On <?=$_REQUEST['date']?></h5>
<form action="approveDispatch.php" method="post">
<button type="submit" id="dispatchBtn" title="Dispatch Loan" class="btn btn-sm btn-subtle-danger p-0" onClick="return confirm('are you sure to approve dispatch?')" disabled>
<span class="text-danger mx-1" data-feather="check" style="height: 20px; width: 20px;"></span>
</button>
</div>

<table class="table table-sm table-hover table-bordered fs-9">

<thead class="table-info text-center">
<tr>
<th>#</th>
<th>LAN</th>
<th>LRN</th>
<th>CRN</th>
<th>Name</th>
<th>Due Amount</th>
<th>Paid Amount</th>
<th>Due Balance</th>
<th>Due Date</th>
</tr>
</thead>

<tbody>

<?php
$i = 0;

while($rcvd_payment = mysqli_fetch_assoc($rcvd_payment_list))
{
	$i++;

	$lan_data = getLatestUpdateRow('lan',$rcvd_payment['lan'],'lan_audit_history',$con);

	if($lan_data['cust_type'] == 1)
	$name = $lan_data['name'];
	else
	$name = $lan_data['company_name'];

	$data = mysqli_fetch_assoc(mysqli_query($con,"SELECT *,SUM(collected_amount) AS total_collection, SUM(due_amount) AS due_total FROM repayment_schedule_list WHERE collected_date < ".$payment_date." AND lan = ".$rcvd_payment['lan']." AND due_date = ".$rcvd_payment['due_date']));

	$due_on_payment_date = $data['due_total'] - $data['total_collection'];
	$due_balance_on_payment_date = $due_on_payment_date - $rcvd_payment['collected_amount'];

	echo "<tr>
		<td class='ps-2'><input type='checkbox' name='dispatchLAN[]' class='form-check-input me-1 dispatchLAN d-none' value='".$rcvd_payment['lan']."' onClick='validateCheckCount()'>".$i."</td>
		<td>".ucwords($rcvd_payment['lan'])."</td>
		<td>".ucwords($rcvd_payment['lrn'])."</td>
		<td>".ucwords($rcvd_payment['crn'])."</td>
		<td>".ucwords($name)."</td>
		<td class='text-danger fw-semibold'>".$due_on_payment_date."</td>
		<td class='text-success fw-semibold'>".$rcvd_payment['collected_amount']."</td>
		<td class='text-danger fw-semibold'>".$due_balance_on_payment_date."</td>
		<td>".date('d-m-Y',$rcvd_payment['due_date'])."</td>
		</tr>";
}

if($i == 0)
echo "<tr><td colspan='9' class='text-center text-danger bg-danger-subtle fw-semibold'>No Payment List Available</td></tr>";
?>

</tbody>
</table>
</form>
<?php
include_once("footer_copyright.php");
?>

<script>
function validateCheckCount()
{
	let checkedCount = $('.dispatchLAN:checked').length;

	if(checkedCount > 0)
	$('#dispatchBtn').prop('disabled',false);
	else
	$('#dispatchBtn').prop('disabled',true);
}
</script>

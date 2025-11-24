<div class="d-flex justify-content-between mb-2">
<h5>Missed Payment List On <?=$_REQUEST['date']?></h5>
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
<th>Collected Amount</th>
<th>Due Balance</th>
</tr>
</thead>

<tbody>

<?php
$i = 0;

while($missed_payment = mysqli_fetch_assoc($missed_payment_list))
{
	$i++;

	$lan_data = getLatestUpdateRow('lan',$missed_payment['lan'],'lan_audit_history',$con);

	if($lan_data['cust_type'] == 1)
	$name = $lan_data['name'];
	else
	$name = $lan_data['company_name'];

	echo "<tr>
		<td class='ps-2'><input type='checkbox' name='dispatchLAN[]' class='form-check-input me-1 d-none dispatchLAN' value='".$missed_payment['lan']."' onClick='validateCheckCount()'>".$i."</td>
		<td>".ucwords($missed_payment['lan'])."</td>
		<td>".ucwords($missed_payment['lrn'])."</td>
		<td>".ucwords($missed_payment['crn'])."</td>
		<td>".$name."</td>
		<td class='text-danger fw-semibold'>".$missed_payment['due_amount']."</td>
		<td class='text-success fw-semibold'>".$missed_payment['collected_amount']."</td>
		<td class='text-danger fw-semibold'>".$missed_payment['due_amount']-$missed_payment['collected_amount']."</td>
		</tr>";
}

if($i == 0)
echo "<tr><td colspan='9' class='text-center text-danger bg-danger-subtle fw-semibold'>No LAN Available for dispatch</td></tr>";
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

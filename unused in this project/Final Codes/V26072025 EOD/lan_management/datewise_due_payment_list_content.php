<div class="d-flex justify-content-between mb-2">
<h5>Due Payment List On <?=$_REQUEST['date']?></h5>
<form action="rcvdLANPayment.php" method="post">
<input type="hidden" name="return_url" value="datewise_due_payment_list.php?date=<?=$_REQUEST['date']?>">
<button type="submit" id="dispatchBtn" title="Received Payment" class="btn btn-sm btn-subtle-danger p-0" onClick="return confirm('are you sure to approve LAN Payment?')" disabled>
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
</tr>
</thead>

<tbody>

<?php
$i = 0;

while($due_payment = mysqli_fetch_assoc($due_payment_list))
{
	$i++;

	$lan_data = getLatestUpdateRow('lan',$due_payment['lan'],'lan_audit_history',$con);

	if($lan_data['cust_type'] == 1)
	$name = $lan_data['name'];
	else
	$name = $lan_data['company_name'];

	echo "<tr>
		<td class='ps-2'><input type='checkbox' name='duePaymentList[]' class='form-check-input me-1 dispatchLAN' value='".$due_payment['id']."' onClick='validateCheckCount()'>".$i."</td>
		<td>".ucwords($due_payment['lan'])."</td>
		<td>".ucwords($due_payment['lrn'])."</td>
		<td>".ucwords($due_payment['crn'])."</td>
		<td>".ucwords($name)."</td>
		<td>".$due_payment['due_amount']."</td>
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

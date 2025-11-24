<table class="table table-sm table-bordered table-striped table-hover fs-9">

<thead class="table-info text-center">
<th>#</th>
<th>URN</th>
<th>URN Fee</th>
<th>Paid To</th>
<th>Commission Amount</th>
<th>Transaction ID</th>
<th>Date & Time</th>
<th>Status/Remark</th>
</thead>

<tbody>

<?php

$payment_list = getRowsData('comission_paid_history',$con);

$i = 0;
while($payment = mysqli_fetch_assoc($payment_list))
{
	$i++;

	if($payment['comission_paid'])
		$comission_status = "<span class='text-success'>Transfer To Wallet</span>";
	else
		$comission_status = "<span class='text-danger'>Pending</span>";

	echo "<tr>
		<td class='ps-2'>".$i."</td>
		<td>".getFieldValue('urn','id',$payment['lead_id'],'leads_details',$con)."</td>
		<td>".$payment['lead_amount']."</td>
		<td>".$payment['comission_paid_to']."</td>
		<td>".$payment['comission_amount']."</td>
		<td>".$payment['transaction_id']."</td>
		<td>".date('d-m-Y h:i:s A',$payment['datentime'])."</td>
		<td>".$comission_status."</td>
		</tr>";
}

if($i == 0)
{
	echo "<tr><td colspan='8' class='text-center text-danger fw-bold'>Commission Payment History Not Available</td></tr>";
}
?>

</tbody>
</table>
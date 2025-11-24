<div class="d-flex justify-content-between mb-2">
<h5>Part Payment List</h5>
</div>

<table class="table table-sm table-hover table-bordered fs-9">

<thead class="table-info text-center">
<tr>
<th>#</th>
<th>Payment Date</th>
<th>LAN Count</th>
<th>Received Amount</th>
<th>Action</th>
</tr>
</thead>

<tbody>

<?php
$i = 0;

while($rcvd_payment = mysqli_fetch_assoc($rcvd_payment_list))
{
	$i++;

	$date = date('d-m-Y',$rcvd_payment['collected_date']);
	$balance_due = $rcvd_payment['total_due'] - $rcvd_payment['total_collection'];

	echo "<tr>
		<td class='px-1'>".$i."</td>
		<td class='text-center'>".$date."</td>
		<td class='text-center px-1'>".$rcvd_payment['lan_count']."</td>
		<td class='text-end px-1'>".$rcvd_payment['total_collection']."</td>
		<td class='text-center px-1'><a href='datewise_part_payment_list.php?date=".$date."'>View List</a></td>	
		</tr>";
}

if($i == 0)
echo "<tr><td colspan='9' class='text-center text-danger bg-danger-subtle fw-semibold'>No Received Payment List Available</td></tr>";
?>

</tbody>
</table>

<?php
include_once("footer_copyright.php");
?>
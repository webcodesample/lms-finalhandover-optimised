<div class="d-flex justify-content-between mb-2">
<h5>Due Payment List</h5>
</div>

<table class="table table-sm table-hover table-bordered fs-9">

<thead class="table-info text-center">
<tr>
<th>#</th>
<th>Due Date</th>
<th>LAN Count</th>
<th>Total Due Amount</th>
<th>Collected Amount</th>
<th>Balance Due Amount</th>
<th>Action</th>
</tr>
</thead>

<tbody>

<?php
$i = 0;

while($due_payment = mysqli_fetch_assoc($due_payment_list))
{
	$i++;

	$date = date('d-m-Y',$due_payment['due_date']);
	$balance_due = $due_payment['total_due'] - $due_payment['total_collection'];

	echo "<tr>
		<td class='px-1'>".$i."</td>
		<td class='text-center'>".$date."</td>
		<td class='text-center px-1'>".$due_payment['lan_count']."</td>
		<td class='text-end px-1'>".$due_payment['total_due']."</td>
		<td class='text-end px-1'>".$due_payment['total_collection']."</td>
		<td class='text-end px-1'>".$balance_due."</td>
		<td class='text-center px-1'><a href='datewise_due_payment_list.php?date=".$date."'>View List</a></td>	
		</tr>";
}

if($i == 0)
echo "<tr><td colspan='9' class='text-center text-danger bg-danger-subtle fw-semibold'>No LAN Available for dispatch</td></tr>";
?>

</tbody>
</table>

<?php
include_once("footer_copyright.php");
?>
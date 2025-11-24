<h5 class="text-danger p-2 text-center">LRNwise Activity History</h5>
<table class="table table-sm table-hover table-bordered fs-9">

<thead class="table-info text-center">
<tr>
<th>#</th>
<th>Date</th>
<th>Time</th>
<th>LRN</th>
<th>Comment</th>
</tr>
</thead>

<tbody>

<?php
$i = 0;

while($lrn_activity = mysqli_fetch_assoc($lrn_activity_list))
{
	$i++;

	echo "<tr>
			<td class='ps-2'>".$i."</td>
			<td>".date('d-m-Y',$lrn_activity['datentime'])."</td>
			<td>".date('h:i:s A',$lrn_activity['datentime'])."</td>
			<td>".$lrn_activity['lrn']."</td>
			<td>".$lrn_activity['comment']."</td>
		</tr>";
}

if($i == 0)
echo "<tr><td colspan='5' class='text-center fw-bold text-danger'>No Activity</td></tr>";
?>

</tbody>
</table>
<h5 class="text-danger p-2 text-center">LANwise Activity History</h5>
<table class="table table-sm table-hover table-bordered fs-9">

<thead class="table-info text-center">
<tr>
<th>#</th>
<th>Date</th>
<th>Time</th>
<th>LAN</th>
<th>Comment</th>
</tr>
</thead>

<tbody>

<?php
$i = 0;

while($lan_activity = mysqli_fetch_assoc($lan_activity_list))
{
	$i++;

	echo "<tr>
			<td class='ps-2'>".$i."</td>
			<td>".date('d-m-Y',$lan_activity['datentime'])."</td>
			<td>".date('h:i:s A',$lan_activity['datentime'])."</td>
			<td>".$lan_activity['lan']."</td>
			<td>".$lan_activity['comment']."</td>
		</tr>";
}

if($i == 0)
echo "<tr><td colspan='5' class='text-center fw-bold text-danger'>No Activity</td></tr>";
?>

</tbody>
</table>
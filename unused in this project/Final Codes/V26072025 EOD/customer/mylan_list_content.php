<h5 class="mb-3">My LAN List</h5>

<table class="table table-sm table-bordered table-hover fs-9">

<thead class="table-info text-center">
<th>#</th>
<th>LAN</th>
<th>LRN</th>
<th>Amount</th>
<th>ROI</th>
<th>Frequency</th>
<th>Tenure</th>
<th>Date & Time</th>
<th>Status</th>
</thead>

<tbody>

<?php
$i = 0;
while($lan = mysqli_fetch_assoc($lan_list))
{
	$i++;
	$rowBgColorClass = "";

	if($lan['status_id'] == 4)
	$rowBgColorClass = "class='bg-success-subtle'";
	else if(in_array($lan['status_id'],[6,7,8]))
	$rowBgColorClass = "class='bg-danger-subtle'";

	echo "<tr>
			<td class='ps-2'>".$i."</td>
			<td><a href='view_lan.php?lan=".$lan['lan']."' class='text-decoration-none'>".$lan['lan']."</a></td>
			<td><a href='view_lrn.php?lrn=".$lan['lrn']."' class='text-decoration-none'>LA".$lan['lrn']."</a></td>
			<td class='pe-2 text-end'>".$lan['approved_loan_amount']."</td>
			<td class='pe-2 text-end'>".$lan['roi']."%</td>
			<td>".$lan['payment_frequency']."</td>
			<td class='ps-1'>".$lan['loan_tenure']." ".str_replace('ly','s',$lan['payment_frequency'])."</td>
			<td>".date('d-m-Y h:i:s A', $lan['datentime'])."</td>
			<td>".$lan['updation_remark']."</td>
		</tr>";
}
?>

</tbody>
</table>
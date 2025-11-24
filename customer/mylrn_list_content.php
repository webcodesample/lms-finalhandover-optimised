<h5 class="mb-3">My LRN List</h5>

<table class="table table-sm table-bordered table-hover fs-9">

<thead class="table-info text-center">
<th>#</th>
<th>LRN</th>
<th>Date & Time</th>
<th>Status</th>
</thead>

<tbody>

<?php
$i = 0;
while($lrn = mysqli_fetch_assoc($lrn_list))
{
	$i++;
	$rowBgColorClass = "";

	if($lrn['status_id'] == 4)
	$rowBgColorClass = "class='bg-success-subtle'";
	else if(in_array($lrn['status_id'],[6,7,8]))
	$rowBgColorClass = "class='bg-danger-subtle'";

	echo "<tr ".$rowBgColorClass.">
		<td class='ps-2'>".$i."</td>
		<td><a href='view_lrn.php?lrn=".$lrn['lrn']."' class='text-decoration-none'>CA".$lrn['lrn']."</a></td>
		<td>".date('d-m-Y h:i:s A', $lrn['datentime'])."</td>
		<td>".getFieldValue('description','id',$lrn['status_id'],'lead_status_list',$con)."</td>
		</tr>";
}
?>

</tbody>
</table>
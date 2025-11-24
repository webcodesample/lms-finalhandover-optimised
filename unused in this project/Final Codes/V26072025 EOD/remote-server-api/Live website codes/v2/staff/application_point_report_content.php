<h5 class="mb-5">Application Point Wise URN Count Report</h5>
<table class="table table-sm table-bordered table-hover fs-9">

<thead class="table-warning text-center">
<th>#</th>
<th>Application Point</th>
<th>Type</th>
<th>URN Count</th>
<th>Applied</th>
<th>URN Rejected</th>
<th>Visa Rejected</th>
<th>Deleted</th>
<th>Complete</th>
</thead>

<tbody>

<?php
$i = 0;
while($application_point = mysqli_fetch_assoc($application_point_list))
{
	$i++;

	if($application_point['type'] == 'i')
		$application_point_type = 'Intermediary';
	else if($application_point['type'] == 'u')
		$application_point_type = 'University';

	echo "<tr class='text-center'>
		<td>".$i."</td>
		<td class='text-start'>".ucwords($application_point['name'])."</td>
		<td class='text-start'>".$application_point_type."</td>
		<td>".getRowCount('application_point_id',$application_point['id'],'leads_details',$con)."</td>
		<td>".getAPURNCount($application_point['id'],'Applied',$con)."</td>
		<td class='text-danger'>".getAPURNCount($application_point['id'],'URN Rejected',$con)."</td>
		<td class='text-danger'>".getAPURNCount($application_point['id'],'Visa Rejected',$con)."</td>
		<td class='text-danger'>".getAPURNCount($application_point['id'],'Deleted',$con)."</td>
		<td class='text-success'>".getAPURNCount($application_point['id'],'Complete',$con)."</td>
		</tr>";
}
?>

</tbody>

</table>

<?php include_once("footer_copyright.php"); ?>
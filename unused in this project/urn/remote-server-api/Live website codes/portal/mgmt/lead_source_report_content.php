<h5 class="mb-5">Source Wise Lead Count Report</h5>
<table class="table table-sm table-bordered table-hover fs-9">

<thead class="table-warning text-center">
<th>#</th>
<th>Source</th>
<th>URN Count</th>
<th>New</th>
<th>Applied</th>
<th>URN Rejected</th>
<th>Visa Rejected</th>
<th>Deleted</th>
<th>Complete</th>
<th>Conversion Rate</th>
</thead>

<tbody>

<?php
$i = 0;
while($lead_source = mysqli_fetch_assoc($lead_source_list))
{
	$i++;

	$total_urn_count = getRowCount('source_id',$lead_source['id'],'leads_details',$con);
	$completed_urn_count = sourceLeadCount($lead_source['id'],'Complete',$con);

	if($completed_urn_count)
		$conversion_rate = ($completed_urn_count/$total_urn_count) * 100;
	else
		$conversion_rate = 0;

	echo "<tr class='text-center'>
		<td>".$i."</td>
		<td class='text-start'>".$lead_source['description']."</td>
		<td>".$total_urn_count."</td>
		<td>".sourceLeadCount($lead_source['id'],'New',$con)."</td>
		<td>".sourceLeadCount($lead_source['id'],'Applied',$con)."</td>
		<td class='text-danger'>".sourceLeadCount($lead_source['id'],'URN Rejected',$con)."</td>
		<td class='text-danger'>".sourceLeadCount($lead_source['id'],'Visa Rejected',$con)."</td>
		<td class='text-danger'>".sourceLeadCount($lead_source['id'],'Deleted',$con)."</td>
		<td class='text-success'>".$completed_urn_count."</td>
		<td class='text-success'>".$conversion_rate."%</td>
		</tr>";
}
?>

</tbody>

</table>

<?php include_once("footer_copyright.php"); ?>
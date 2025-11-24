<h5 class="mb-5">Sales Person Wise URN Report</h5>
<table class="table table-sm table-bordered table-hover fs-9">

<thead class="table-warning text-center">
<th>#</th>
<th>Name</th>
<th>ID</th>
<th>URN Count</th>
<th>New</th>
<th>Applied</th>
<th>URN Rejected</th>
<th>Visa Rejected</th>
<th>Deleted</th>
<th>Complete</th>
<th>Win %</th>
</thead>

<tbody>

<?php
$i = 0;
while($sales_person = mysqli_fetch_assoc($sales_person_list))
{
	$i++;
	$total_urn_count = getRowCount('allocated_id','SP'.$sales_person['id'],'leads_details',$con);
	$completed_urn_count = getAgentURNCount($sales_person['id'],'Complete',$con);
	if($total_urn_count)
	$win_percentage = round(($completed_urn_count/$total_urn_count) * 100);
	else
	$win_percentage = 0;

	echo "<tr class='text-center'>
		<td>".$i."</td>
		<td class='text-start'>".ucwords($sales_person['name'])."</td>
		<td>SP".$sales_person['id']."</td>
		<td>".$total_urn_count."</td>
		<td>".getSPURNCount($sales_person['id'],'New',$con)."</td>
		<td>".getSPURNCount($sales_person['id'],'Applied',$con)."</td>
		<td class='text-danger'>".getSPURNCount($sales_person['id'],'URN Rejected',$con)."</td>
		<td class='text-danger'>".getSPURNCount($sales_person['id'],'Visa Rejected',$con)."</td>
		<td class='text-danger'>".getSPURNCount($sales_person['id'],'Deleted',$con)."</td>
		<td class='text-success'>".$completed_urn_count."</td>
		<td class='text-success'>".$win_percentage."%</td>
		</tr>";
}
?>

</tbody>

</table>

<?php include_once("footer_copyright.php"); ?>
<h5 class="mb-5">Agent Wise URN Report</h5>
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
while($agent = mysqli_fetch_assoc($agent_list))
{
	$i++;
	$total_urn_count = getRowCountDistinct('lead_id','allocated_id','SA'.$agent['id'],'lead_allocation_list',$con);
	$completed_urn_count = getAgentURNCount($agent['id'],'Complete',$con);
	if($total_urn_count)
	$win_percentage = ($completed_urn_count/$total_urn_count) * 100;
	else
	$win_percentage = 0;

	if($agent['type'] == 1)
		$name = $agent['company_name'];
	else
		$name = $agent['name'];

	echo "<tr class='text-center'>
		<td>".$i."</td>
		<td class='text-start'>".ucwords($name)."</td>
		<td>SA".(100+$agent['id'])."</td>
		<td>".$total_urn_count."</td>
		<td>".getAgentURNCount($agent['id'],'New',$con)."</td>
		<td>".getAgentURNCount($agent['id'],'Applied',$con)."</td>
		<td class='text-danger'>".getAgentURNCount($agent['id'],'URN Rejected',$con)."</td>
		<td class='text-danger'>".getAgentURNCount($agent['id'],'Visa Rejected',$con)."</td>
		<td class='text-danger'>".getAgentURNCount($agent['id'],'Deleted',$con)."</td>
		<td class='text-success'>".$completed_urn_count."</td>
		<td class='text-success'>".$win_percentage."%</td>
		</tr>";
}
?>

</tbody>

</table>

<?php include_once("footer_copyright.php"); ?>
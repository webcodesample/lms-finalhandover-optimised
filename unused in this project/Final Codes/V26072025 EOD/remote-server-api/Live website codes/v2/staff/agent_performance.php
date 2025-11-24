<h5 class="mb-5">Performance Report</h5>
<table class="table table-sm table-bordered table-hover fs-9">

<thead class="table-warning text-center">
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
	$total_urn_count = getRowCount('allocated_id','SA'.$_REQUEST['agent_id'],'leads_details',$con);
	$completed_urn_count = getAgentURNCount($_REQUEST['agent_id'],'Complete',$con);
	if($total_urn_count)
	$win_percentage = round(($completed_urn_count/$total_urn_count) * 100);
	else
	$win_percentage = 0;

	if($agent['type'] == 1)
		$name = $agent['company_name'];
	else
		$name = $agent['name'];

	echo "<tr class='text-center'>
		<td>".$total_urn_count."</td>
		<td>".getAgentURNCount($_REQUEST['agent_id'],'New',$con)."</td>
		<td>".getAgentURNCount($_REQUEST['agent_id'],'Applied',$con)."</td>
		<td class='text-danger'>".getAgentURNCount($_REQUEST['agent_id'],'URN Rejected',$con)."</td>
		<td class='text-danger'>".getAgentURNCount($_REQUEST['agent_id'],'Visa Rejected',$con)."</td>
		<td class='text-danger'>".getAgentURNCount($_REQUEST['agent_id'],'Deleted',$con)."</td>
		<td class='text-success'>".$completed_urn_count."</td>
		<td class='text-success'>".$win_percentage."%</td>
		</tr>";
?>

</tbody>

</table>

<?php include_once("footer_copyright.php"); ?>
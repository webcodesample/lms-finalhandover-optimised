<h5 class="mb-5">Lead Source Wise Report</h5>

<div class="d-flex justify-content-end">
<button class="btn btn-sm btn-subtle-danger me-2" onClick="printData('Lead Source Report')">
<span data-feather="printer" style="height: 20px; width: 20px;"></span>
</button>
<?php setGoBack("leads.php"); ?>
</div>

<div id="myPrintableDiv" class="mt-5">
<table class="table table-sm table-bordered table-hover fs-9">

<thead class="table-warning text-center">
<tr>
<th rowspan="2" class="align-middle">#</th>
<th rowspan="2" class="align-middle">Source</th>
<th colspan="5">Leads Count / Conversion Rate / URN Count</th>
<th colspan="7">URN Status / Completion Rate</th>
</tr>
<tr>
<th>Total</th>
<th>Genuine</th>
<th>Fake</th>
<th>Conversion Rate</th>
<th>URN Count</th>
<th>New</th>
<th>Applied</th>
<th>URN Rejected</th>
<th>Visa Rejected</th>
<th>Deleted</th>
<th>Complete</th>
<th>Completion Rate</th>
</tr>
</thead>

<tbody>

<?php
$i = 0;
while($lead_source = mysqli_fetch_assoc($lead_source_list))
{
	$i++;

	$total_urn_count = getRowCount('source_id',$lead_source['id'],'leads_details',$con);
	$completed_urn_count = sourceLeadCount($lead_source['id'],'Complete',$con);
	$total_temp_leads_by_source = getRowCount('source_id',$lead_source['id'],'temp_leads',$con);

	if($total_urn_count)
		$conversion_rate = round(($total_urn_count/$total_temp_leads_by_source) * 100);
	else
		$conversion_rate = 0;

	if($completed_urn_count)
		$completion_rate = round(($completed_urn_count/$total_urn_count) * 100);
	else
		$completion_rate = 0;

	$where_con_array_temp_leads_genuine = ['source_id' => $lead_source['id'],
									'status' => 1,];
	$sourcewiseGenuineLeads_count =	getRowCountMultiCol(setWhereClause($where_con_array_temp_leads_genuine),'temp_leads',$con);

	$where_con_array_temp_leads_fake = ['source_id' => $lead_source['id'],
									'status' => 2,];
	$sourcewiseFakeLeads_count =	getRowCountMultiCol(setWhereClause($where_con_array_temp_leads_fake),'temp_leads',$con);

	echo "<tr class='text-center'>
		<td>".$i."</td>
		<td class='text-start'>".$lead_source['description']."</td>
		<td>".$total_temp_leads_by_source."</td>
		<td>".$sourcewiseGenuineLeads_count."</td>
		<td class='text-danger'>".$sourcewiseFakeLeads_count."</td>
		<td class='text-success'>".$conversion_rate."%</td>
		<td>".$total_urn_count."</td>
		<td>".sourceLeadCount($lead_source['id'],'New',$con)."</td>
		<td>".sourceLeadCount($lead_source['id'],'Applied',$con)."</td>
		<td class='text-danger'>".sourceLeadCount($lead_source['id'],'URN Rejected',$con)."</td>
		<td class='text-danger'>".sourceLeadCount($lead_source['id'],'Visa Rejected',$con)."</td>
		<td class='text-danger'>".sourceLeadCount($lead_source['id'],'Deleted',$con)."</td>
		<td class='text-success'>".$completed_urn_count."</td>
		<td class='text-success'>".$completion_rate."%</td>
		</tr>";
}
?>

</tbody>

</table>
</div>
<?php include_once("footer_copyright.php"); ?>
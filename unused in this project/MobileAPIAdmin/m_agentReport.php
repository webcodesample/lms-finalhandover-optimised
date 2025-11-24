<?php
include_once("common_include.php");

$agent_list = getRowsData('agent_list',$con);

$i = 0;
$rowdata = [];

while($agent = mysqli_fetch_assoc($agent_list))
{
	$i++;
	$agent['rowindex'] = $i;

	$total_urn_count = getRowCount('allocated_id','SA'.$agent['id'],'leads_details',$con);
	$completed_urn_count = getAgentURNCount($agent['id'],'Complete',$con);
	if($total_urn_count)
	$win_percentage = round(($completed_urn_count/$total_urn_count) * 100);
	else
	$win_percentage = 0;

	if($agent['type'] == 1)
		$name = $agent['company_name'];
	else
		$name = $agent['name'];

	$agent['display_name'] = $name;
	$agent['display_id'] = 'SA'.$agent['id'];
	$agent['total_urn_count'] = $total_urn_count;
	$agent['new_urn_count'] = getAgentURNCount($agent['id'],'New',$con);
	$agent['applied_urn_count'] = getAgentURNCount($agent['id'],'Applied',$con);
	$agent['rejected_urn_count'] = getAgentURNCount($agent['id'],'URN Rejected',$con);
	$agent['visa_rejected_urn_count'] = getAgentURNCount($agent['id'],'Visa Rejected',$con);
	$agent['deleted_urn_count'] = getAgentURNCount($agent['id'],'Deleted',$con);
	$agent['completed_urn_count'] = $completed_urn_count;
	$agent['win_percent'] = $win_percentage;
	$rowdata[] = $agent;
}

echo json_encode($rowdata);
?>
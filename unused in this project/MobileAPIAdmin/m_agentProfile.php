<?php
include_once("common_include.php");

//$agent_id = $_REQUEST['agent_id'];

$where_con_array = [ 'id' => $_REQUEST['agent_id'], ];
$agent = mysqli_fetch_assoc(getRowsDataCon('agent_list',$where_con_array,$con));

$total_urn_count = getRowCount('allocated_id','SA'.$agent['id'],'leads_details',$con);
$completed_urn_count = getAgentURNCount($agent['id'],'Complete',$con);
if($total_urn_count)
$win_percentage = round(($completed_urn_count/$total_urn_count) * 100);
else
$win_percentage = 0;

$agent['total_urn_count'] = $total_urn_count;
$agent['new_urn_count'] = getAgentURNCount($agent['id'],'New',$con);
$agent['applied_urn_count'] = getAgentURNCount($agent['id'],'Applied',$con);
$agent['rejected_urn_count'] = getAgentURNCount($agent['id'],'URN Rejected',$con);
$agent['visa_rejected_urn_count'] = getAgentURNCount($agent['id'],'Visa Rejected',$con);
$agent['deleted_urn_count'] = getAgentURNCount($agent['id'],'Deleted',$con);
$agent['completed_urn_count'] = $completed_urn_count;
$agent['win_percent'] = $win_percentage;

$agent['other_urn_count'] = $total_urn_count - ($completed_urn_count+$agent['new_urn_count']+$agent['applied_urn_count']
+$agent['rejected_urn_count']+$agent['visa_rejected_urn_count']+$agent['deleted_urn_count']);


echo json_encode($agent);
?>

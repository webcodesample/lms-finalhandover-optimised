<?php
include_once("common_include.php");

$where_con_array = [ 'id' => $_REQUEST['salesperson_id'], ];
$sales_person = mysqli_fetch_assoc(getRowsDataCon('sales_person_list',$where_con_array,$con));

$total_urn_count = getRowCount('allocated_id','SP'.$sales_person['id'],'leads_details',$con);
$completed_urn_count = getSPURNCount($sales_person['id'],'Complete',$con);
if($total_urn_count)
$win_percentage = round(($completed_urn_count/$total_urn_count) * 100);
else
$win_percentage = 0;
		
$sales_person['total_urn_count'] = $total_urn_count;
$sales_person['new_urn_count'] = getSPURNCount($sales_person['id'],'New',$con);
$sales_person['applied_urn_count'] = getSPURNCount($sales_person['id'],'Applied',$con);
$sales_person['rejected_urn_count'] = getSPURNCount($sales_person['id'],'URN Rejected',$con);
$sales_person['visa_rejected_urn_count'] = getSPURNCount($sales_person['id'],'Visa Rejected',$con);
$sales_person['deleted_urn_count'] = getSPURNCount($sales_person['id'],'Deleted',$con);
$sales_person['completed_urn_count'] = $completed_urn_count;
$sales_person['win_percent'] = $win_percentage;
$sales_person['other_urn_count'] = $total_urn_count - ($completed_urn_count+$sales_person['new_urn_count']+$sales_person['applied_urn_count']
+$sales_person['rejected_urn_count']+$sales_person['visa_rejected_urn_count']+$sales_person['deleted_urn_count']);

echo json_encode($sales_person);
?>

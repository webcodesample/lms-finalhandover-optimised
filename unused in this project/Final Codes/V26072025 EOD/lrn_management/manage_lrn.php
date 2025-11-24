<?php
include_once("common_include.php");

$tabs_array = ['summary','documents','communication_history','audit_history'];

if(isset($_REQUEST['tab']))
$requested_tab = $_REQUEST['tab'];
else
$requested_tab = 'summary';

$lead_allocation_count = getRowCount('lrn',$_REQUEST['lrn'],'lrn_allocation_list',$con);

if($lead_allocation_count > 0)
{
    $allocated_id = getLatestUpdate('allocated_id','lrn',$_REQUEST['lrn'],'lrn_allocation_list',$con);
    if(substr($allocated_id,0,2) == 'SA')
    $lrn_allocation_id = $allocated_id." - ".getFieldValue('name','id',substr($allocated_id,2),'agent_list',$con);
    else if(substr($allocated_id,0,2) == 'SP')
    $lrn_allocation_id = $allocated_id." - ".getFieldValue('name','id',substr($allocated_id,2),'sales_person_list',$con);
}
else
$lrn_allocation_id = "Not Allocated";

//LRN Status for Comparision as LRN reached at its final status
$finalise_status_array = ['Approved','Deleted','LRN Rejected','Customer Rejected'];

//get lrn call back already exist for future or not
$callback_search_query = "SELECT * FROM callback_list WHERE lrn = ".$_REQUEST['lrn']." AND callback_datentime > ".strtotime('now');
$callback_search_result = mysqli_query($con,$callback_search_query);
if(mysqli_num_rows($callback_search_result) > 0)
    $callback_exist_flag = 1;
else
    $callback_exist_flag = 0;

include_once("content_layout.php");
?>

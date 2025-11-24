<?php
include_once("common_include.php");

$current_alloted_staff_name = "";

$profile_active = "";
$documents_active = "";
$history_active = "";
$calls_active = "";
$audit_active = "";
$additional_details_active = "";
$academic_details_active = "";
$communication_history_active = "";

$profile_show = "";
$documents_show = "";
$history_show = "";
$calls_show = "";
$audit_show = "";
$communication_history_show = "";
$additional_details_show = "";
$academic_details_show = "";

if(isset($_REQUEST['tab']))
{
    if($_REQUEST['tab'] == 'profile')
    {
        $profile_active = "active";
        $profile_show = "show active";
    }
    else if($_REQUEST['tab'] == 'documents')
    {
        $documents_active = "active";
        $documents_show = "show active";
    }
    else if($_REQUEST['tab'] == 'history')
    {
        $history_active = "active";
        $history_show = "show active";
    }
    else if($_REQUEST['tab'] == 'communication')
    {
        $communication_history_active = "active";
        $communication_history_show = "show active";
    }
    else if($_REQUEST['tab'] == 'audit')
    {
        $audit_active = "active";
        $audit_show = "show active";
    }
    else if($_REQUEST['tab'] == 'academic')
    {
        $academic_details_active = "active";
        $academic_details_show = "show active";
    }
    else if($_REQUEST['tab'] == 'additional')
    {
        $additional_details_active = "active";
        $additional_details_show = "show active";
    }
}
else
{
    $profile_active = "active";
    $profile_show = "show active";
}

$lead_allocation_count = getRowCount('lead_id',$_REQUEST['lead_id'],'lead_allocation_list',$con);

if($lead_allocation_count > 0)
{
    $allocated_id = getLatestUpdate('allocated_id','lead_id',$_REQUEST['lead_id'],'lead_allocation_list',$con);
    if(substr($allocated_id,0,2) == 'SA')
    $lead_allocation_id = $allocated_id." - ".getFieldValue('name','id',substr($allocated_id,2),'agent_list',$con);
    else if(substr($allocated_id,0,2) == 'SP')
    $lead_allocation_id = $allocated_id." - ".getFieldValue('name','id',substr($allocated_id,2),'sales_person_list',$con);
}
else
$lead_allocation_id = "Not Allocated";

//Lead Status for Comparision as lead reached at its final status
$finalise_status_array = ['Deleted','Complete','Pending','Fee Paid'];

//get urn call back already exist for future or not
$callback_search_query = "SELECT * FROM callback_list WHERE lead_id = ".$_REQUEST['lead_id']." AND callback_datentime > ".strtotime('now');
$callback_search_result = mysqli_query($con,$callback_search_query);
if(mysqli_num_rows($callback_search_result) > 0)
    $callback_exist_flag = 1;
else
    $callback_exist_flag = 0;

include_once("content_layout.php");
?>

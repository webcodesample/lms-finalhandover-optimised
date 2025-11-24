<?php
include_once("common_include.php");

$current_alloted_staff_name = "";

$profile_active = "";
$documents_active = "";
$history_active = "";
$calls_active = "";
$audit_active = "";

$profile_show = "";
$documents_show = "";
$history_show = "";
$calls_show = "";
$audit_show = "";

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
    else if($_REQUEST['tab'] == 'calls')
    {
        $calls_active = "active";
        $calls_show = "show active";
    }
    else if($_REQUEST['tab'] == 'audit')
    {
        $audit_active = "active";
        $audit_show = "show active";
    }
}
else
{
    $profile_active = "active";
    $profile_show = "show active";
}

$lead_allocation_count = getRowCount('lead_id',$_REQUEST['lead_id'],'lead_allocation_list',$con);

if($lead_allocation_count > 0)
$lead_allocation_id = getLatestUpdate('allocated_id','lead_id',$_REQUEST['lead_id'],'lead_allocation_list',$con);
else
$lead_allocation_id = "Not Allocated";

include_once("content_layout.php");
?>

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

/*if(getRowCount('lead_id',$_REQUEST['lead_id'],'lead_staff_relation',$con))
{
    $current_alloted_staff_id = getLatestUpdate('staff_id','lead_id',$_REQUEST['lead_id'],'lead_staff_relation',$con);
    $current_alloted_staff_name = getFieldvalue('name','id',$current_alloted_staff_id,'staff_list',$con);
}*/

include_once("content_layout.php");
?>

<?php
include_once("common_include.php");

$current_alloted_staff_name = "";

$profile_active = "";
$documents_active = "";
$history_active = "";
$calls_active = "";
$audit_active = "";
$academic_details_active = "";
$additional_details_active = "";

$profile_show = "";
$documents_show = "";
$history_show = "";
$calls_show = "";
$audit_show = "";
$academic_details_show = "";
$additional_details_show = "";


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

include_once("content_layout.php");
?>

<?php
include_once("common_include.php");

$lead_status_active = "";
$country_active = "";
$predefined_documents_active = "";
$lead_sources_active = "";

if(isset($_REQUEST['tab']) && $_REQUEST['tab'] == 'country')
{
	$country_active = "active";
	$requested_tab = $_REQUEST['tab'];
}
else if(isset($_REQUEST['tab']) && $_REQUEST['tab'] == 'lead_sources')
{
	$lead_sources_active = "active";
	$requested_tab = $_REQUEST['tab'];
}
else if(isset($_REQUEST['tab']) && $_REQUEST['tab'] == 'predefined_documents')
{
	$predefined_documents_active = "active";
	$requested_tab = $_REQUEST['tab'];
}
else
{
	$lead_status_active = "active";
	$requested_tab = "lead_status";
}

include_once("content_layout.php");
?>
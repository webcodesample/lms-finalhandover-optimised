<?php
include_once("common_include.php");

if(isset($_REQUEST['tab']))
$requested_tab = $_REQUEST['tab'];
else
$requested_tab = 'lead_status';

$tabs_array = ['lead_status','lead_sources','predefined_documents','predefined_actions'];

include_once("content_layout.php");
?>
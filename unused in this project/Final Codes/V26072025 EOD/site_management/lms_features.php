<?php
include_once("common_include.php");

if(isset($_REQUEST['tab']))
$requested_tab = $_REQUEST['tab'];
else
$requested_tab = 'processing_fee_rate';

$tabs_array = ['processing_fee_rate','company_type','predefined_documents'];

include_once("content_layout.php");
?>
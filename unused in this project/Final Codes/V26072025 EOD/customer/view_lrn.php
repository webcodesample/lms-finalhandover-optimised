<?php
include_once("common_include.php");

$tabs_array = ['summary','documents','audit_history'];

if(isset($_REQUEST['tab']))
$requested_tab = $_REQUEST['tab'];
else
$requested_tab = 'summary';

//LRN Status for Comparision as LRN reached at its final status
$finalise_status_array = ['Approved','Deleted','LRN Rejected','Customer Rejected'];

include_once("content_layout.php");
?>

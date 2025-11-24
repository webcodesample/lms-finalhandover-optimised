<?php
include_once("common_include.php");

$tabs_array = ['summary','documents','audit_history','ledger','repayment_schedule'];

if(isset($_REQUEST['tab']))
$requested_tab = $_REQUEST['tab'];
else
$requested_tab = 'summary';

$editMode = "disabled";

include_once("content_layout.php");
?>

<?php
include_once("common_include.php");

$_REQUEST['dob'] = strtotime($_REQUEST['dob']);
$inputNames = generateInputNamesArray();
$updated_columns = generateUpdatedColumns($inputNames);

recordLRNActivityHistory($con);
recordLRNAuditHistory($updated_columns,$con);

//create email history
lrnupdationEmailHistory('Customer Profile Update',$_REQUEST['lrn'],$con);

header("Location:manage_lrn.php?lrn=".$_REQUEST['lrn']);
?>
<?php
include_once("common_include.php");
$inputNames = generateInputNamesArray();
$updated_columns = generateUpdatedColumns($inputNames);
$_REQUEST = array_merge($_REQUEST,extractIdFromInputs($inputNames));
recordLRNActivityHistory($con);
recordLRNAuditHistory($updated_columns,$con);

//create email history
lrnupdationEmailHistory('Loan Detail Update',$_REQUEST['lrn'],$con);

header("Location:manage_lrn.php?lrn=".$_REQUEST['lrn']);
?>
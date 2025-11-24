<?php
include_once("common_include.php");

$_REQUEST['company_doi'] = strtotime($_REQUEST['company_doi']);

$inputNames = generateInputNamesArray();
$updated_columns = generateUpdatedColumns($inputNames);

recordLRNActivityHistory($con);
recordLRNAuditHistory($updated_columns,$con);

//create email history
lrnupdationEmailHistory('Company Detail Update',$_REQUEST['lrn'],$con);

header("Location:manage_lrn.php?lrn=".$_REQUEST['lrn']);
?>
<?php
include_once("common_include.php");

if($_REQUEST['bank_account_old'] == 0)
$_REQUEST['updation_remark'] = "Bank Account Added";
else
$_REQUEST['updation_remark'] = "Bank Account Updated";

$inputNames = generateInputNamesArray();
$updated_columns = generateUpdatedColumns($inputNames);
recordLRNActivityHistory($con);
recordLRNAuditHistory($updated_columns,$con);

//create email history
lrnupdationEmailHistory('Bank Account Update',$_REQUEST['lrn'],$con);

header("Location:manage_lrn.php?lrn=".$_REQUEST['lrn']);
?>
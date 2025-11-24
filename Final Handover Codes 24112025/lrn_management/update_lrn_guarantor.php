<?php
include_once("common_include.php");

if($_REQUEST['guarantor_id_old'] == 0)
$_REQUEST['updation_remark'] = "Guarantor Added";
else
$_REQUEST['updation_remark'] = "Guarantor Updated";

$inputNames = generateInputNamesArray();
$updated_columns = generateUpdatedColumns($inputNames);

recordLRNActivityHistory($con);
recordLRNAuditHistory($updated_columns,$con);

//create email history
lrnupdationEmailHistory('Guarantor Update',$_REQUEST['lrn'],$con);

header("Location:manage_lrn.php?lrn=".$_REQUEST['lrn']);
?>
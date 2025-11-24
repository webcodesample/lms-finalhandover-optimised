<?php
include_once("common_include.php");

$where_con_array = [ 'id' => $_REQUEST['bank']];
deleteData('bank_accounts_list',$where_con_array,$con);
deleteUploadedFile('../bank_proofs/','bankproof_'.$_REQUEST['bank']);

header("Location: manage_crn.php?crn=".$_REQUEST['crn']."&tab=bank_accounts");
?>
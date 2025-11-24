<?php
include_once("common_include.php");
//include_once("generateRepaymentSchedule.php");
//include_once("generateLANLedger.php");
//print_r($_REQUEST);
createLoanExtensionLedger($_REQUEST['lan'],$_REQUEST['extensionROI'],$_REQUEST['extensionPeriod'],$con);
createExtensionRepaymentSchedule($_REQUEST['lan'],$_REQUEST['extensionROI'],$_REQUEST['extensionPeriod'],$con);
header("Location: manage_lan.php?lan=".$_REQUEST['lan']."&tab=ledger");
?>
<?php
include_once("common_include.php");
//print_r($_REQUEST);

$_REQUEST['datentime'] = strtotime('now');

insertData('customer_request_list',$_REQUEST,$con);
header("Location: view_lan.php?lan=".$_REQUEST['request_for']."&tab=ledger");
?>
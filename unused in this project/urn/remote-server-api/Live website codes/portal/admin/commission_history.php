<?php
include_once("common_include.php");

$payment_tab = "";
$income_tab = "";

if(isset($_REQUEST['type']) && $_REQUEST['type'] == 'payment')
{
	$payment_tab = "active";
	$type = $_REQUEST['type'];
}
else 
{
	$income_tab = "active";
	$type = "income";
}

include_once("content_layout.php");
?>
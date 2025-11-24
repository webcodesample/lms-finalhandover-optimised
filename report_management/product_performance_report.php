<?php
include_once("common_include.php");

$where_clause = "";
$product_name = "All";

if(isset($_REQUEST['product_id']))
{
	$where_clause = "WHERE product_id = ".$_REQUEST['product_id'];
	$product_name = getFieldvalue('description','id',$_REQUEST['product_id'],'product_list',$con);
}

$lan_audit_list = mysqli_query($con,"SELECT MAX(id) AS lan_audit_id FROM lan_audit_history ".$where_clause." GROUP BY lan ORDER BY datentime DESC");

include_once("content_layout.php");
?>
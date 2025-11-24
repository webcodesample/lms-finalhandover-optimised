<?php
include_once("common_include.php");

$recent_chat_tab = "";
$staff_tab = "";
$customer_tab = "";

if(isset($_REQUEST['tab']) && $_REQUEST['tab'] == 'bs')
{
	$staff_tab = "active";
	$chat_list_query = "SELECT CONCAT('BS',id) AS chat_id FROM staff_list WHERE role_type != 7 AND id != ".$_SESSION['userid'];
}
else if(isset($_REQUEST['tab']) && $_REQUEST['tab'] == 'cr')
{
	$customer_tab = "active";
	$chat_list_query = "SELECT CONCAT('CR',id) AS chat_id FROM customers_list";
}
else
{
	$recent_chat_tab = "active";
	//$chat_list_query = "SELECT DISTINCT REPLACE(CONCAT(sender_id, receiver_id),'CS','') AS chat_id FROM `chat_history` WHERE `sender_id` = 'CS' OR `receiver_id` = 'CS'";	
	$chat_list_query = "SELECT DISTINCT REGEXP_REPLACE(CONCAT(sender_id, receiver_id),'CS|".$_SESSION['user_ref_id']."','') AS chat_id FROM `chat_history` WHERE `sender_id` IN ('CS','".$_SESSION['user_ref_id']."') OR `receiver_id` IN ('CS','".$_SESSION['user_ref_id']."')";	
}

$chat_list = mysqli_query($con, $chat_list_query);
include_once("content_layout.php");
?>
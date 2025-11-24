<?php
include_once("common_include.php");

$recent_chat_tab = "";
$agent_tab = "";
$staff_tab = "";
$sales_person_tab = "";
$student_tab = "";

if(isset($_REQUEST['tab']) && $_REQUEST['tab'] == 'bs')
{
	$staff_tab = "active";
	$query = "SELECT CONCAT('BS',id) AS chat_id FROM staff_list WHERE role_type != 7";
}
else if(isset($_REQUEST['tab']) && $_REQUEST['tab'] == 'st')
{
	$student_tab = "active";
	$query = "SELECT CONCAT('ST',student_id) AS chat_id FROM leads_details WHERE allocated_id = '".$_SESSION['user_ref_id']."'";
}
else
{
	$recent_chat_tab = "active";
	$query = "SELECT DISTINCT REPLACE(CONCAT(sender_id, receiver_id),'".$_SESSION['user_ref_id']."','') AS chat_id FROM `chat_history` WHERE `sender_id` = '".$_SESSION['user_ref_id']."' OR `receiver_id` = '".$_SESSION['user_ref_id']."'";	
}

$result = mysqli_query($con, $query);


include_once("content_layout.php");
?>
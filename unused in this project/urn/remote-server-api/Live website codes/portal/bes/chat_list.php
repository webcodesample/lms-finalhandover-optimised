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
else if(isset($_REQUEST['tab']) && $_REQUEST['tab'] == 'sa')
{
	$agent_tab = "active";
	$query = "SELECT CONCAT('SA',id) AS chat_id FROM agent_list";
}
else if(isset($_REQUEST['tab']) && $_REQUEST['tab'] == 'sp')
{
	$sales_person_tab = "active";
	$query = "SELECT CONCAT('SP',id) AS chat_id FROM sales_person_list";
}
else if(isset($_REQUEST['tab']) && $_REQUEST['tab'] == 'st')
{
	$student_tab = "active";
	$query = "SELECT CONCAT('ST',id) AS chat_id FROM students";
}
else
{
	$recent_chat_tab = "active";
	$query = "SELECT DISTINCT REPLACE(CONCAT(sender_id, receiver_id),'".$_SESSION['staff_ref_id']."','') AS chat_id FROM `chat_history` WHERE `sender_id` = '".$_SESSION['staff_ref_id']."' OR `receiver_id` = '".$_SESSION['staff_ref_id']."'";	
}

$result = mysqli_query($con, $query);


include_once("content_layout.php");
?>
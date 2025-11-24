<?php
include_once("common_include.php");

if(isset($_REQUEST['chat_with']) && $_REQUEST['chat_with'] == 'CS')
{
	$where_clause = " WHERE cust_id = '".$_SESSION['user_ref_id']."' AND status = 0";
	if(getRowCountMultiCol($where_clause,'chat_sessions_list',$con) == 0)
	mysqli_query($con,"INSERT INTO chat_sessions_list SET cust_id = '".$_SESSION['user_ref_id']."', started_on = ".strtotime('now').", updated_on = ".strtotime('now'));
}
else
header("Location: ../mydashboard/dashboard.php");

include_once("content_layout.php");
?>
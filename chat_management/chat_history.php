<?php
include_once("common_include.php");

if(isset($_REQUEST['chat_with']) && $_REQUEST['chat_with'] !== '')
{
	if(substr($_REQUEST['chat_with'],0,2) == 'CR')
	{
		if(getRowCount('cust_id',$_REQUEST['chat_with'],'chat_sessions_list',$con) > 0)
		{
			if(getFieldValue('staff_id','cust_id',$_REQUEST['chat_with'],'chat_sessions_list',$con) == '')
			mysqli_query($con,"UPDATE chat_sessions_list SET staff_id = '".$_SESSION['user_ref_id']."' WHERE cust_id = '".$_REQUEST['chat_with']."'");
			else if(getFieldValue('staff_id','cust_id',$_REQUEST['chat_with'],'chat_sessions_list',$con) !== $_SESSION['user_ref_id'])
			header("Location: chat_list.php");
		}
		else
		header("Location: chat_list.php");
	}
	else if(substr($_REQUEST['chat_with'],0,2) !== 'BS')
	header("Location: chat_list.php");
}
else
header("Location: ../mydashboard/dashboard.php");


include_once("content_layout.php");
?>
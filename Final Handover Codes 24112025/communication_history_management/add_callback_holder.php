<?php
include_once("common_include.php");

if(getFieldValue('hold_by','id',$_REQUEST['callback_id'],'callback_list',$con) == '')
{
	$where_con_array = [ 'id' => $_REQUEST['callback_id'],];
	$callback_data = [	'hold_by' => $_SESSION['user_ref_id'],	];
	updateData('callback_list',$callback_data,$where_con_array,$con);
}

if(getFieldValue('hold_by','id',$_REQUEST['callback_id'],'callback_list',$con) == $_SESSION['user_ref_id'])
header("Location:update_callback.php?callback_id=".$_REQUEST['callback_id']);
else
header("Location:callback_list.php?tab=today");
?>
<?php
date_default_timezone_set("Asia/Calcutta");
include_once("set_con.php");

if(substr($_REQUEST['chat_with'],0,2) == 'CR')
$_REQUEST['logged_user'] = 'CS';

if(substr($_REQUEST['logged_user'],0,2) == 'CR')
$_REQUEST['chat_with'] = 'CS';

if($_REQUEST['chat_msg'] != '')
{
	$chat_data = [
				'message' => $_REQUEST['chat_msg'],
				'message_type' => 0,
				'sender_id' => $_REQUEST['logged_user'],
				'receiver_id' => $_REQUEST['chat_with'],
				'datentime' => strtotime('now'),
			];

	insertData('chat_history',$chat_data,$con);
	$flag_insert_chat_record = 1;
}

if(isset($_FILES['chatImage']))
{
	$chat_file_name = $_REQUEST['logged_user'].'_'.$_REQUEST['chat_with'].'_'.strtotime('now').'.'.pathinfo($_FILES['chatImage']['name'], PATHINFO_EXTENSION);
	$chat_data = [
				'message' => $chat_file_name,
				'message_type' => 1,
				'sender_id' => $_REQUEST['logged_user'],
				'receiver_id' => $_REQUEST['chat_with'],
				'datentime' => strtotime('now'),
			];

	insertData('chat_history',$chat_data,$con);

	$upload_folder = "../chat_files/images/";
	move_uploaded_file($_FILES['chatImage']['tmp_name'], $upload_folder.$chat_file_name);
	$flag_insert_chat_record = 1;
}

echo $flag_insert_chat_record;
?>
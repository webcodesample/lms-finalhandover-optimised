<?php
include_once("common_include.php");

$chat_data = [
				'message' => $_REQUEST['chat_msg'],
				'sender_id' => $_SESSION['staff_ref_id'],
				'receiver_id' => $_REQUEST['chat_with'],
				'datentime' => strtotime('now'),
			];

insertData('chat_history',$chat_data,$con);

header("Location:chat_history.php?chat_with=".$_REQUEST['chat_with']);

?>
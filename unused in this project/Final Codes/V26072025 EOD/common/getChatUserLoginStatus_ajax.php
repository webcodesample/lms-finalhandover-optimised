<?php
date_default_timezone_set("Asia/Calcutta");
include_once("set_con.php");

echo checkUserOnlineStatus($_REQUEST['chat_with'],$con);
?>
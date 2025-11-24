<?php
include_once("common_include.php");
mysqli_query($con,"UPDATE chat_sessions_list SET staff_id = '' WHERE staff_id = '".$_SESSION['user_ref_id']."' AND cust_id = '".$_REQUEST['cust_id']."'");
header("Location: chat_list.php");
?>
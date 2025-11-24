<?php
include_once("common_include.php");
mysqli_query($con,"DELETE FROM chat_sessions_list WHERE cust_id = '".$_SESSION['user_ref_id']."'");
header("Location: myaccount.php");
?>
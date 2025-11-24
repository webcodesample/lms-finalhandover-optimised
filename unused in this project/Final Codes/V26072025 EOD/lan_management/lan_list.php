<?php
include_once("common_include.php");

validateLoginType($_SESSION['login_type']);

$lan_list = mysqli_query($con, "SELECT * FROM dispatch_list WHERE status = 1 ORDER BY approval_datentime DESC");

include_once("content_layout.php");
?>
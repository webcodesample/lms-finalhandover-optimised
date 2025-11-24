<?php
include_once("common_include.php");

validateLoginType($_SESSION['login_type']);

$dispatch_list = mysqli_query($con, "SELECT approval_date, count(*) AS lan_count FROM dispatch_list WHERE status = 0 GROUP BY approval_date ORDER BY approval_date DESC");

include_once("content_layout.php");
?>
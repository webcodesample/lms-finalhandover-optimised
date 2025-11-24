<?php
include_once("common_include.php");

validateLoginType($_SESSION['login_type']);

$view_result = getRowsData('university_list',$con,'name','ASC');

include_once("content_layout.php");
?>
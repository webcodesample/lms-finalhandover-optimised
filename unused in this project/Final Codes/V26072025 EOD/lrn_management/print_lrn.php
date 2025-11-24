<?php
include_once("common_include.php");

$lrn_info = getLatestUpdateRow('lrn',$_REQUEST['lrn'],'lrn_audit_history',$con);

include_once("content_layout.php");
?>
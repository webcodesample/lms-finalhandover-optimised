<?php
include_once("common_include.php");

$country_name = getFieldValue('name','id',$_REQUEST['country_id'],'country_list',$con);
$currency_name = getFieldValue('currency','id',$_REQUEST['country_id'],'country_list',$con);

include_once("content_layout.php");
?>
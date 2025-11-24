<?php
include_once("common_include.php");
$where_con_array = ['id'=>$_REQUEST['id']];

if(!isset($_REQUEST['contact_person']))
$_REQUEST['contact_person'] = '';

updateData('introducer_list',$_REQUEST,$where_con_array,$con);
header("Location: manage.php?id=".$_REQUEST['id']);
?>
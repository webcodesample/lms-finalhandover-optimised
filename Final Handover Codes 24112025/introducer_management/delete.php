<?php
include_once("common_include.php");

$where_con_array = [ 'id' => $_REQUEST['id']];
deleteData('introducer_list',$where_con_array,$con);
deleteUploadedFile('../introducer_documents/','*_'.$_REQUEST['id']);

header("Location: list.php");
?>
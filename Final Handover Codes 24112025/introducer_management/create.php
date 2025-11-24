<?php
include_once("common_include.php");

//print_r($_REQUEST); print_r($_FILES); die();

$introducer_id = insertData('introducer_list',$_REQUEST,$con);
uploadFile($_FILES['introducer_document'],$_REQUEST['document_title'].'_'.$introducer_id,'../introducer_documents/');
header("Location: list.php");
?>
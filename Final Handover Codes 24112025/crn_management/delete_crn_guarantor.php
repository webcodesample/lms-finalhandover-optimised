<?php
include_once("common_include.php");

$where_con_array = [ 'id' => $_REQUEST['guarantor']];
deleteData('guarantor_list',$where_con_array,$con);
deleteUploadedFile('../guarantor_documents/','*_'.$_REQUEST['guarantor']);

header("Location: manage_crn.php?crn=".$_REQUEST['crn']."&tab=guarantor_list");
?>
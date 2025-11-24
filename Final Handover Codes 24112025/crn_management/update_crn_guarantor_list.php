<?php
include_once("common_include.php");

//print_r($_REQUEST); print_r($_FILES); die();

$guarantor_id = insertData('guarantor_list',$_REQUEST,$con);

uploadFile($_FILES['guarantor_document'],$_REQUEST['document_title'].'_'.$guarantor_id,'../guarantor_documents/');

header("Location:../crn_management/manage_crn.php?crn=".$_REQUEST['crn']."&tab=guarantor_list");
?>
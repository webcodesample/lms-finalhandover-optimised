<?php
include_once("common_include.php");
//print_r($_REQUEST); print_r($_FILES); die();
uploadFile($_FILES['crn_document'],$_REQUEST['document_title'],'../crn_documents/'.$_REQUEST['crn'].'/');
header("Location:../crn_management/manage_crn.php?crn=".$_REQUEST['crn']."&tab=documents");
?>
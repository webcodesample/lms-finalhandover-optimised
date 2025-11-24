<?php
//include_once("document_upload_form.php");
include_once("uploaded_document_list.php");

if(in_array($_SESSION['login_type'],array(1,2,3,8,7)))
{
    include_once("deleted_document_list.php");  
    include_once("../modal_boxes/lrn_document_deletion_modal.php");
}
?>


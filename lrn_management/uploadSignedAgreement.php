<?php
include_once("common_include.php");

$urn_folder = "../lrn/la".$_REQUEST['lrn']."/";

//upload new file to urn folder
$newfilename = 'signed_agreement_'.strtotime('now').'.'.pathinfo($_FILES['signed_agreement']['name'], PATHINFO_EXTENSION);
move_uploaded_file($_FILES['signed_agreement']['tmp_name'], $urn_folder.$newfilename);

//insert into lrn_document_upload_history
recordLRNDocUploadHistory($newfilename,$con);

$_REQUEST['updation_remark'] = 'Customer Signed Agreement Uploaded';

recordLRNActivityHistory($con);
recordLRNAuditHistory([],$con);

//create email history
//urnupdationEmailHistory('Document Upload',$urn_latest_info['lead_id'],$urn_latest_info['student_email'],$con);

header("Location: manage_lrn.php?lrn=".$_REQUEST['lrn']);
?>
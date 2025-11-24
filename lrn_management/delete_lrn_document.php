<?php
include_once("common_include.php");

//print_r($_REQUEST);

$where_con_array = [ 'id' => $_REQUEST['uploaded_document_id'],];

$deleted_document_data = [
							'is_deleted' => 1,
							'deleted_by' => $_SESSION['user_ref_id'],
							'deletion_datentime' => strtotime('now'),
							'deletion_remark' => $_REQUEST['document_deletion_remark'],
						];

updateData('lrn_document_upload_history',$deleted_document_data,$where_con_array,$con);

header("Location: manage_lrn.php?lrn=".$_REQUEST['lrn']."&tab=documents");
?>
<?php
include_once("common_include.php");

$data_array = [
				'name' => $_REQUEST['document_name'],
				'uploaded_file_name' => $_REQUEST['upload_file_name'],
				'is_required' => $_REQUEST['is_required'],
			];

$where_con_array = [ 'id' => $_REQUEST['document_id'] ];

updateData('document_list',$data_array,$where_con_array,$con);

header("Location:portal_settings.php?tab=predefined_documents");
?>
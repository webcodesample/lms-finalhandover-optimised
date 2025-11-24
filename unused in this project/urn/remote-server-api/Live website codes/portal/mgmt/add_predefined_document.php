<?php
include_once("common_include.php");

$data_array = [
				'name' => $_REQUEST['document_name'],
				'uploaded_file_name' => $_REQUEST['upload_file_name']
			];

insertData('document_list',$data_array,$con);

header("Location:portal_settings.php?tab=predefined_documents");
?>
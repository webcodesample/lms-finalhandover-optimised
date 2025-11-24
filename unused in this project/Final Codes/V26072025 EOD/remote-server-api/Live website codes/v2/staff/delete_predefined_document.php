<?php
include_once("common_include.php");

$where_con_array = [ 'id' => $_REQUEST['id'] ];

deleteData('document_list',$where_con_array,$con);

header("Location:portal_settings.php?tab=predefined_documents");
?>

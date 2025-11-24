<?php
include_once("common_include.php");

$data_array = [
				'description' => $_REQUEST['company_type'],
			];

insertData('company_type_list',$data_array,$con);

header("Location:lms_features.php?tab=company_type");
?>
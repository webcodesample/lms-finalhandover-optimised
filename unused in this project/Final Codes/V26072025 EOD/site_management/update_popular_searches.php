<?php
include_once("common_include.php");

$where_con_array = [ 'id' => $_REQUEST['subject_id'] ];

$data_array = [
			'name' => $_REQUEST['subject_name'],
		];

updateData('subject_list',$data_array,$where_con_array,$con);

header("Location:edit_subject.php?subject_id=".$_REQUEST['subject_id']);
?>
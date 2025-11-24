<?php
include_once("common_include.php");

if(isset($_REQUEST['action_perfom']))
{
	$data = [
				'name' => $_REQUEST['university_name'],
				'region' => $_REQUEST['region'],
				'country_id' => $_REQUEST['country']
			];
	$insert_query = "INSERT INTO university_list SET ".setCRUDData($data);
	$insert_result = mysqli_query($con,$insert_query);

	$action_perform_msg = "University Added Successfuly";
}

include_once("content_layout.php");
?>
<?php
include_once("common_include.php");

if(isset($_REQUEST['action_perfom']))
{
	$data = [
				'name' => $_REQUEST['university_name'],
				'region' => $_REQUEST['region'],
				'country_id' => $_REQUEST['country']
			];
	$update_query = "UPDATE university_list SET ".setCRUDData($data)." WHERE id = '".$_REQUEST['id']."'";
	$update_result = mysqli_query($con,$update_query);

	$action_perform_msg .= "<h6 class='text-success'>University Updated Successfuly</h6>";
}

//fetch country info as per requested id
$view_query = "SELECT * FROM university_list WHERE id = '".$_REQUEST['id']."'";
$view_result = mysqli_query($con, $view_query);
$university = mysqli_fetch_assoc($view_result);

include_once("content_layout.php");
?>
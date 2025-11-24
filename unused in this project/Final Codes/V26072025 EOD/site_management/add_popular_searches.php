<?php
include_once("common_include.php");


if(isset($_REQUEST['action_perfom']))
{
	$data = [
				'description' => $_REQUEST['popular_search_description'],
			];

	$where_con = [
				'description' => $_REQUEST['popular_search_description'],
			];

	if(getRowCountMultiCol(setWhereClause($where_con),'popular_search',$con))
	{
		$msg = "<center><div class='text-danger fw-bold mt-1'>Search Keyword Already Exist</div></center>";
	}
	else
	{
		$newfilename = strtolower($_REQUEST['popular_search_description']).'.'.pathinfo($_FILES['display_image']['name'], PATHINFO_EXTENSION);
		move_uploaded_file($_FILES['display_image']['tmp_name'], "../uploads/keyword_images/".$newfilename);
		$data['image_path'] = $newfilename;
		$insert_query = "INSERT INTO popular_search SET ".setCRUDData($data);
		$insert_result = mysqli_query($con,$insert_query);
		$msg = "<center><div class='text-success fw-bold mt-1'>Search Keyword Added Succesfuly</div></center>";
	}

	echo $msg;
}

include_once("content_layout.php");
?>
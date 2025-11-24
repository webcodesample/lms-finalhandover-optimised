<?php
include_once("common_include.php");

if(isset($_REQUEST['action_perform']))
{
	$data = [
				'description' => $_REQUEST['popular_search_description'],
			];

	$update_query = "UPDATE popular_search SET ".setCRUDData($data)." WHERE id = ".$_REQUEST['id'];
	$update_result = mysqli_query($con,$update_query);
	$msg = "<center><div class='text-success fw-bold mt-1'>Seacrh Keyword Updated Succesfuly</div></center>";
	echo $msg;
}

$where_con = [
			'id' => $_REQUEST['id'],
			];

$query_view_subject = "SELECT * FROM popular_search".setWhereClause($where_con);
$result_view_subject = mysqli_query($con, $query_view_subject);
$search_keyword = mysqli_fetch_assoc($result_view_subject);

include_once("content_layout.php");
?>
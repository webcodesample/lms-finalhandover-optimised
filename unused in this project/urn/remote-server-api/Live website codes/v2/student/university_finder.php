<?php
include_once("common_include.php");

if(checkIsRequested('country_id'))
{
	$where_con = [
				'country_id' => $_REQUEST['country_id'],
				];

	$query_view_university = "SELECT * FROM university_list".setWhereClause($where_con);
	$result_view_university = mysqli_query($con, $query_view_university);
	$total_row_view_university = mysqli_num_rows($result_view_university);
	$university_list_heading = "Total Universities from ".strtoupper(getFieldValue('name','id',$_REQUEST['country_id'],'country_list',$con))." : ".$total_row_view_university;
}
else
{
	$total_row_view_university = 0;
	$university_list_heading = "";
}

include_once("content_layout.php");
?>


<?php
include_once("common_include.php");
$where_con = 1;

if(isset($_REQUEST['action_perform']))
{
	if(isset($_REQUEST['keyword']) && $_REQUEST['keyword'])
	$where_con .= " AND description LIKE '%".$_REQUEST['keyword']."%'";
}

$view_query = "SELECT * FROM popular_search WHERE ".$where_con." ORDER BY description ASC";
$view_result = mysqli_query($con, $view_query);
$total_rows = mysqli_num_rows($view_result);
$number_of_pages = ceil($total_rows/$nrpp);

//set page offset as per page index
if(checkIsRequested('page_index'))
$page_offset = $default_page_offset + ($nrpp*($_REQUEST['page_index']-1));
else
$page_offset = $default_page_offset;

//query to get course list on requested(get/post) page index
$view_query_per_page = "SELECT * FROM popular_search WHERE ".$where_con." ORDER BY description ASC";
$view_result_per_page = mysqli_query($con, $view_query_per_page);

include_once("content_layout.php");
?>
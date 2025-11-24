<?php
include_once("common_include.php");

$delete_query = "DELETE FROM popular_search WHERE id = '".$_REQUEST['id']."'";
$delete_result = mysqli_query($con,$delete_query);

unlink("../uploads/keyword_images/".$_REQUEST['image']);

header("Location: view_popular_searches.php");
?>
<?php
include_once("common_include.php");

$lrn_list = mysqli_query($con,"SELECT * FROM lrn_list GROUP BY crn ORDER BY crn ASC");//getRowsData('lrn_list',$con);

include_once("content_layout.php");
?>
<?php
include_once("common_include.php");

//$where_con_array = [ 'crn' => $_SESSION['userid']];
$lrn_list = "SELECT lrn FROM lrn_list WHERE crn = ".$_SESSION['userid'];
$maxId_subQuery = "SELECT MAX(id) AS id FROM lan_audit_history AR JOIN (".$lrn_list.") LRN ON AR.lrn = LRN.lrn GROUP BY lan";
$lan_list = mysqli_query($con,"SELECT * FROM lan_audit_history LAH JOIN (".$maxId_subQuery.") MAXIDS ON LAH.id = MAXIDS.id ORDER BY datentime DESC"); //getRowsDataCon('lan_list',$where_con_array,$con);

include_once("content_layout.php");
?>
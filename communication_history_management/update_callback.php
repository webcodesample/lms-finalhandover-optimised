<?php
include_once("common_include.php");

$query = "SELECT * FROM callback_list WHERE id = ".$_REQUEST['callback_id'];
$callback = mysqli_fetch_assoc(mysqli_query($con,$query));

$callback_urn = getFieldValue('urn','id',$callback['lead_id'],'leads_details',$con);

$latest_urn_audit_data = getLatestUpdateRow('lead_id',$callback['lead_id'],'urn_audit_history',$con);



include_once("content_layout.php");
?>


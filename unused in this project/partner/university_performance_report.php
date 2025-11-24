<?php
include_once("common_include.php");

$university_list = getRowsData('university_list',$con);

$query = "SELECT COUNT(*) AS total FROM leads_details AS LD JOIN lead_status_list AS LSL ON LSL.id = LD.status_id WHERE LSL.description = 'Complete' AND LD.allocated_id = '".$_SESSION['user_ref_id']."'";
$completed_urn_count = mysqli_fetch_assoc(mysqli_query($con,$query));

include_once("content_layout.php");
?>
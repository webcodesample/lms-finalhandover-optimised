<?php
include_once("common_include.php");

$where_clause = "";
$where_clause_lead_count = "";

if(isset($_REQUEST['start_date']) && isset($_REQUEST['end_date']) && $_REQUEST['start_date'] && $_REQUEST['end_date'])
{
	$where_clause .= " AND LD.datentime > ".strtotime($_REQUEST['start_date'])." AND LD.datentime < ".strtotime($_REQUEST['end_date']);
	$where_clause_lead_count .= " WHERE datentime > ".strtotime($_REQUEST['start_date'])." AND datentime < ".strtotime($_REQUEST['end_date']);
}

$university_list = getRowsData('university_list',$con);

$query = "SELECT COUNT(*) AS total FROM leads_details AS LD JOIN lead_status_list AS LSL ON LSL.id = LD.status_id WHERE LSL.description = 'Complete'".$where_clause;
$completed_urn_count = mysqli_fetch_assoc(mysqli_query($con,$query));

include_once("content_layout.php");
?>
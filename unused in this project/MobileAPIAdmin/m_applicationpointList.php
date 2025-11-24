<?php
include_once("common_include.php");

$where_con = "WHERE 1 ";

if(isset($_REQUEST['type']) && $_REQUEST['type'])
{
	$where_con .= " AND type = '".$_REQUEST['type']."'";
}

if(isset($_REQUEST['name']) && $_REQUEST['name'])
{
	$where_con .= " AND name LIKE '%".$_REQUEST['name']."%'";
}

if(isset($_REQUEST['contact_person_name']) && $_REQUEST['contact_person_name'])
{
	$where_con .= " AND contact_person_name LIKE '%".$_REQUEST['contact_person_name']."%'";
}

if(isset($_REQUEST['mobile']) && $_REQUEST['mobile'])
{
	$where_con .= " AND mobile LIKE '%".$_REQUEST['mobile']."%'";
}

if(isset($_REQUEST['email']) && $_REQUEST['email'])
{
	$where_con .= " AND email LIKE '%".$_REQUEST['email']."%'";
}

$query = "SELECT * FROM application_point_list ".$where_con." ORDER BY name ASC";
$application_point_list = mysqli_query($con, $query);

$i = 0;
$rowdata = [];

while($row = mysqli_fetch_assoc($application_point_list))
{
	$i++;
	$row['rowindex'] = $i;
	$rowdata[] = $row;
}

echo json_encode($rowdata);
?>
<?php
include_once("common_include.php");

$where_con = "WHERE hidden = 0";

//if(in_array($_SESSION['login_type'],array(4,6)))
//$where_con .= " AND creator_id = ".$_SESSION['userid']." AND creator_type = ".$_SESSION['login_type'];

$orderby_clause = " ORDER BY TL.datentime DESC";

if(isset($_REQUEST['name']) && $_REQUEST['name'])
{
	$where_con .= " AND name LIKE '%".$_REQUEST['name']."%'";
}

if(isset($_REQUEST['mobile']) && $_REQUEST['mobile'])
{
	$where_con .= " AND mobile LIKE '%".$_REQUEST['mobile']."%'";
}

if(isset($_REQUEST['email']) && $_REQUEST['email'])
{
	$where_con .= " AND email LIKE '%".$_REQUEST['email']."%'";
}

if(isset($_REQUEST['source']) && $_REQUEST['source'])
{
	$where_con .= " AND description LIKE '%".$_REQUEST['source']."%'";
}

$query = "SELECT *, TL.id AS lead_id FROM temp_leads AS TL JOIN lead_sources_list AS LSL ON TL.source_id = LSL.id ".$where_con.$orderby_clause;
$rows_list = mysqli_query($con,$query);

$i = 0;
$rowdata = [];

while($row = mysqli_fetch_assoc($rows_list))
{
	$i++;
	$row['rowindex'] = $i;
	$row['datentime'] = date('d/m/Y', $row['datentime']);

	if($row['creator_type'] == 1 || $row['creator_type'] == 3 || $row['creator_type'] == 8)
	$row['created_by'] = getFieldValue('name','id',$row['creator_id'],'staff_list',$con);
	else if($row['creator_type'] == 4)
	$row['created_by'] = getFieldValue('name','id',$row['creator_id'],'agent_list',$con);
	if($row['creator_type'] == 6)
	$row['created_by'] = getFieldValue('name','id',$row['creator_id'],'sales_person_list',$con);

	$row['creator_type'] = getFieldValue('description','id',$row['creator_type'],'login_type_list',$con);
	$rowdata[] = $row;
}

echo json_encode($rowdata);
?>
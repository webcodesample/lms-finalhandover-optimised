<?php
include_once("common_include.php");

$orderby_clause = " ORDER BY name ASC";

if(isset($_REQUEST['status']) && $_REQUEST['status'] == 0)
{
	$where_con = "WHERE status = ".$_REQUEST['status'];
}
else
{
	$where_con = "WHERE status = 1 ";
}


if(isset($_REQUEST['id']) && $_REQUEST['id'])
{
	$id .= $_REQUEST['id'];
	$where_con .= " AND id = ".substr($_REQUEST['id'],2);
}

if(isset($_REQUEST['name']) && $_REQUEST['name'])
{
	$where_con .= " AND name LIKE '%".$_REQUEST['name']."%'";
}

if(isset($_REQUEST['mobile']) && $_REQUEST['mobile'])
{
	$where_con .= " AND mobile LIKE '%".$_REQUEST['mobile']."%'";
}

if(isset($_REQUEST['whatsapp']) && $_REQUEST['whatsapp'])
{
	$where_con .= " AND whatsapp LIKE '%".$_REQUEST['whatsapp']."%'";
}

if(isset($_REQUEST['email']) && $_REQUEST['email'])
{
	$where_con .= " AND email LIKE '%".$_REQUEST['email']."%'";
}

$query = "SELECT * FROM sales_person_list ".$where_con.$orderby_clause;
$salesperson_list = mysqli_query($con, $query);

$i = 0;
$rowdata = [];

while($row = mysqli_fetch_assoc($salesperson_list))
{
	$i++;

	$row['rowindex'] = $i;
	$rowdata[] = $row;
}

echo json_encode($rowdata);
?>
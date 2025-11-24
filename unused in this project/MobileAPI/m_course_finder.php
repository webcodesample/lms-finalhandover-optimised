<?php
include_once("common_include.php");

$where_con = 1;
$orderby_clause = " ORDER BY CL.name ASC LIMIT 2000";

if(isset($_REQUEST['course']) && $_REQUEST['course'])
	$where_con .= " AND CL.name LIKE '%".$_REQUEST['course']."%'";

if(isset($_REQUEST['fee']) && $_REQUEST['fee']>0)
	$where_con .= " AND CL.fee < '".$_REQUEST['fee']."'";

if(isset($_REQUEST['coursetype']) && $_REQUEST['coursetype'])
	$where_con .= " AND CL.type LIKE '%".$_REQUEST['coursetype']."%'";

if(isset($_REQUEST['countryid']) && $_REQUEST['countryid']>0)
	$where_con .= " AND UL.country_id = '".$_REQUEST['countryid']."'";

if(isset($_REQUEST['universityid']) && $_REQUEST['universityid']>0)
	$where_con .= " AND CL.university_id = '".$_REQUEST['universityid']."'";

if(isset($_REQUEST['uniname']) && $_REQUEST['uniname'])
	$where_con .= " AND UL.name LIKE '%".$_REQUEST['uniname']."%'";

$query = "SELECT *, UL.name AS university_name, CL.name AS course_name, CL.id AS course_id FROM course_list AS CL JOIN university_list AS UL ON CL.university_id = UL.id WHERE ".$where_con.$orderby_clause;
$result = mysqli_query($con, $query);

$i = 0;
$rowdata = [];

while($row = mysqli_fetch_assoc($result))
{
	$i++;
	$row['rowindex'] = $i;

	if(isset($_REQUEST['student_id']) && $_REQUEST['student_id'])
	{
		$row['favStatus'] = checkWishlisted($row['course_id'], $_REQUEST['student_id'],$con);
	}

	$rowdata[] = $row;
}

echo json_encode($rowdata);
?>
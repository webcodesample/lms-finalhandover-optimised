<?php
include_once("common_include.php");

$where_con_array = [ 'student_id' => $_REQUEST['student_id']];

$wishlist = getRowsDataCon('student_wishlist',$where_con_array,$con);

$i = 0;
$rowdata = [];

while($mywishlist = mysqli_fetch_assoc($wishlist))
{
	//$where_con_array = [ 'id' => $mywishlist['course_id']];
	$where_con = " cl.id = '".$mywishlist['course_id']."'";
	$query = "SELECT *, cl.id AS course_id, ul.name AS university_name, cl.name AS course_name FROM course_list AS cl join university_list AS ul ON cl.university_id = ul.id WHERE ".$where_con." ORDER BY cl.university_id ASC";
	$result = mysqli_query($con, $query);

	while($row = mysqli_fetch_assoc($result))
	{
		$i++;
		$row['rowindex'] = $i;
		$rowdata[] = $row;
	}
}

echo json_encode($rowdata);
?>

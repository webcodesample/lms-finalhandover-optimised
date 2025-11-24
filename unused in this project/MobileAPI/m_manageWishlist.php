<?php
include_once("common_include.php");

$jsonData = file_get_contents('php://input'); // Read raw POST data from the incoming request body

$data = json_decode($jsonData, true); // Decode the JSON data into a PHP array

$query = "select count(*) AS total from student_wishlist where student_id = ".$data['student_id'];
$wishlist_count = mysqli_fetch_assoc(mysqli_query($con,$query));

$where_con_array = [
						'course_id' => $data['course_id'],
						'student_id' => $data['student_id']
						];

$count = getRowCountMultiCol(setWhereClause($where_con_array),'student_wishlist',$con);

if($count > 0)
deleteData('student_wishlist',$where_con_array,$con);
else
{
	if($wishlist_count['total'] > 4)
	{
		echo json_encode(array('wishlist_count' => $wishlist_count['total']));
	}
	else
	{
		$data_array = $where_con_array;
		insertData('student_wishlist',$data_array,$con);
	}
}


?>
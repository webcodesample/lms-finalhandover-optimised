<?php
include_once("common_include.php");

$where_con_array = [
					'course_id' => $_REQUEST['course'],
					'student_id' => $_SESSION['userid']
					];
deleteData('student_wishlist',$where_con_array,$con);

header("Location:".$_REQUEST['backto'].".php");
?>
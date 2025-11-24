<?php
include_once("common_include.php");

$data_array = [
					'course_id' => $_REQUEST['course'],
					'student_id' => $_SESSION['userid']
					];
insertData('student_wishlist',$data_array,$con);

header("Location:".$_REQUEST['backto'].".php");
?>
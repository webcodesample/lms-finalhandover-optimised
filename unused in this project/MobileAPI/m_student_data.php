<?php
include_once("common_include.php");

$loged_user_where_con = [ 'id' => $_REQUEST['student_id']];
$loged_user_ref_id = 'ST'.$_REQUEST['student_id'];
$loged_user = mysqli_fetch_assoc(getRowsDataCon('students',$loged_user_where_con,$con));
$loged_user['profile_pic'] = str_replace('../','http://campus-abroad.co.in/v3/',getProfilePic($loged_user_ref_id));
$loged_user['dob'] = date('d-m-Y',$loged_user['dob']);

echo json_encode($loged_user);
?>

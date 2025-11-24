<?php
include_once("common_include.php");

$where_con_array = [ 'student_id' => $_REQUEST['student_id']];

$urn_list = getRowsDataCon('leads_details',$where_con_array,$con);

$i = 0;
$rowdata = [];

while($row = mysqli_fetch_assoc($urn_list))
{
	$i++;
	$row['rowindex'] = $i;
	$row['course_name'] = getFieldValue('name','id',$row['course_id'],'course_list',$con);
	$university_id = getFieldValue('university_id','id',$row['course_id'],'course_list',$con);
	$row['university_name'] = getFieldValue('name','id',$university_id,'university_list',$con);
	$rowdata[] = $row;
}

echo json_encode($rowdata);
?>
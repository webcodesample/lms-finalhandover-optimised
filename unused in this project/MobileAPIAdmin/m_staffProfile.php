<?php
include_once("common_include.php");

$where_con_array = [ 'id' => $_REQUEST['staff_id'], ];
$staff = mysqli_fetch_assoc(getRowsDataCon('staff_list',$where_con_array,$con));

echo json_encode($staff);
?>

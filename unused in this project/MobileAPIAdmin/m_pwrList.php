<?php
include_once("common_include.php");

$where_con = "WHERE status = 0 ";

$query = "SELECT * FROM withdrawl_request_list ".$where_con." ORDER BY req_datentime DESC";
$application_point_list = mysqli_query($con, $query);

$i = 0;
$rowdata = [];

while($row = mysqli_fetch_assoc($application_point_list))
{
	$i++;
	$row['rowindex'] = $i;

	if(getFieldValue('holder_type','id',$row['wallet_id'],'wallet_list',$con) == 4)
	{
		$holder_id_prefix = 'SA';
		$holder_tbl = 'agent_list';
	}
	else
	{
		$holder_id_prefix = 'SP';
		$holder_tbl = 'sales_person_list';
	}

	$holder_id = getFieldValue('holder_id','id',$row['wallet_id'],'wallet_list',$con);
	$row['holder_id'] = $holder_id_prefix.$holder_id;
	$row['holder_name'] = getFieldValue('name','id',$holder_id,$holder_tbl,$con);

	$row['req_datentime'] = date('d-M-Y h:i:s A', $row['req_datentime']);

	$rowdata[] = $row;
}

echo json_encode($rowdata);
?>
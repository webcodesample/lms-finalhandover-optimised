<?php
include_once("common_include.php");

$where_con_array = [ 'lead_id' => $_REQUEST['leadid']];
$orderby_clause = " ORDER BY datentime DESC";

$activity_history = getRowsDataCon('leads_activity_history',$where_con_array,$con,$orderby_clause);

$i = 0;
$rowdata = [];

while($row = mysqli_fetch_assoc($activity_history))
{
	$i++;
	$row['rowindex'] = $i;
	$row['date'] = date('d-M-Y',$row['datentime']);
	$row['time'] = date('h:i:s A',$row['datentime']);
	$row['status'] = strtoupper(getFieldValue('description','id',$row['status_id'],'lead_status_list',$con));

	if(substr($row['activity_by'],0,2) == 'BS')
	$row['updated_by'] = getFieldValue('name','id',substr($row['activity_by'],2),'staff_list',$con)." - ".$row['activity_by'];
	else if(substr($row['activity_by'],0,2) == 'SA')
	$row['updated_by'] = getFieldValue('name','id',substr($row['activity_by'],2),'agent_list',$con)." - ".$row['activity_by'];
	else if(substr($row['activity_by'],0,2) == 'SP')
	$row['updated_by'] = getFieldValue('name','id',substr($row['activity_by'],2),'sales_person_list',$con)." - ".$row['activity_by'];
	else if(substr($row['activity_by'],0,2) == 'ST')
	$row['updated_by'] = getFieldValue('name','id',substr($row['activity_by'],2),'students',$con)." - Portal User";

	$rowdata[] = $row;
}

echo json_encode($rowdata);
?>
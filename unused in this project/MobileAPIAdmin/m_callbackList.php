<?php
include_once("common_include.php");

$orderby_clause = " ORDER BY callback_datentime DESC";

//condition array as per day criteria
if(isset($_REQUEST['callback_status']) && $_REQUEST['callback_status'] == 'past')
{
	$where_con_array = [ ("callback_datentime <". strtotime('today'))];
}
else if(isset($_REQUEST['callback_status']) && $_REQUEST['callback_status'] == 'today')
{
	$where_con_array = [ ("callback_datentime >". strtotime('today')),("callback_datentime <". strtotime('tomorrow'))];
}
else if(isset($_REQUEST['callback_status']) && $_REQUEST['callback_status'] == 'future')
{
	$where_con_array = [ ("callback_datentime >". strtotime('tomorrow'))];
}

$callback_list = getRowsDataConAdvance('callback_list',$where_con_array,$con,$orderby_clause);

$i = 0;
$rowdata = [];

while($row = mysqli_fetch_assoc($callback_list))
{
	$i++;

	if($i < 11)
	{
		$row['rowindex'] = $i;
		$row['urn'] = getFieldValue('urn','id',$row['lead_id'],'leads_details',$con);
		$row['name'] = getLatestUpdate('student_name','lead_id',$row['lead_id'],'urn_audit_history',$con);
		$row['mobile'] = getLatestUpdate('student_mobile','lead_id',$row['lead_id'],'urn_audit_history',$con);
		$row['mobile_alt'] = getLatestUpdate('student_mobile_alt','lead_id',$row['lead_id'],'urn_audit_history',$con);
		$row['callback_datentime'] = date('d-m-Y, h:i A', $row['callback_datentime']);
		$row['updation_datentime'] = date('d-m-Y, h:i A', $row['updation_datentime']);
		$rowdata[] = $row;
	}
}

echo json_encode($rowdata);
?>

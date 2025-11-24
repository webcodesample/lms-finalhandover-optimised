<?php
include_once("common_include.php");

$where_con = "WHERE 1 ";

if(isset($_REQUEST['urn']) && $_REQUEST['urn'])
$where_con .= " AND LD.urn = ".$_REQUEST['urn'];

if(isset($_REQUEST['mobile']) && $_REQUEST['mobile'])
$where_con .= " AND UAH.student_mobile LIKE '%".$_REQUEST['mobile']."%'";

if(isset($_REQUEST['name']) && $_REQUEST['name'])
$where_con .= " AND UAH.student_name LIKE '%".$_REQUEST['name']."%'";

if(isset($_REQUEST['email']) && $_REQUEST['email'])
$where_con .= " AND UAH.student_email LIKE '%".$_REQUEST['email']."%'";

$comp_query = "SELECT MAX(id) AS audit_id FROM urn_audit_history GROUP BY lead_id";

//$query = "SELECT *, LD.id AS lead_id FROM leads_details AS LD JOIN students AS ST ON LD.student_id = ST.id ".$where_con." ORDER BY datentime DESC";
$query = "SELECT * FROM urn_audit_history AS UAH JOIN (".$comp_query.") AS MI ON UAH.id = MI.audit_id JOIN leads_details AS LD ON UAH.lead_id = LD.id ".$where_con." ORDER BY UAH.datentime DESC";
$urn_list = mysqli_query($con, $query); //getRowsData('leads_details',$con);

$i = 0;
$rowdata = [];

while($row = mysqli_fetch_assoc($urn_list))
{
	$row['urn_status'] = getFieldValue('description','id',$row['status_id'],'lead_status_list',$con);
	
	if($row['urn_status'] !== 'Deleted')
	{
		$i++;
		$row['rowindex'] = $i;
		if($row['course_id'] > 0)
		{
			$row['course_name'] = getFieldValue('name','id',$row['course_id'],'course_list',$con);
			$university_id = getFieldValue('university_id','id',$row['course_id'],'course_list',$con);
			$row['university_name'] = getFieldValue('name','id',$university_id,'university_list',$con);
		}
		else
		{
			$row['course_name'] = '';
			$row['university_name'] = '';
		}

		$lead_allocated_id = $row['allocated_id'];//getFieldValue('allocated_id','id',$row['lead_id'],'leads_details',$con);
	
		if($lead_allocated_id)
		{
			if(substr($lead_allocated_id,0,2) == 'SP')
			$row['allocated_to'] = getFieldValue('name','id',substr($lead_allocated_id,2),'sales_person_list',$con);
			else if(substr($lead_allocated_id,0,2) == 'SA')
			$row['allocated_to'] = getFieldValue('name','id',substr($lead_allocated_id,2),'agent_list',$con);
		}

		$rowdata[] = $row;
	}
}

echo json_encode($rowdata);
?>
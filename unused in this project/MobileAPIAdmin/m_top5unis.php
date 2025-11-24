<?php
include_once("common_include.php");

$where_clause = "";

$current_date_month = date('m',strtotime('now'));
$current_date_year = date('Y',strtotime('now'));

$current_week_start = getWeekStart();
$current_week_end = getWeekEnd();

if(isset($_REQUEST['performance_by']))
{
    if($_REQUEST['performance_by'] == "weekly")
    {
        $where_clause .= " WHERE LD.datentime > ".$current_week_start." AND LD.datentime < ".$current_week_end;
    }
    else if($_REQUEST['performance_by'] == "monthly")
    {
        $current_month_start = mktime(0,0,0,$current_date_month,1,$current_date_year);
        $current_month_end = mktime(0,0,0,$current_date_month+1,1,$current_date_year);
        $where_clause .= " WHERE LD.datentime > ".$current_month_start." AND LD.datentime < ".$current_month_end;
    }
    else if($_REQUEST['performance_by'] == "yearly")
    {
        $current_year_start = mktime(0,0,0,1,1,$current_date_year);
        $current_year_end = mktime(0,0,0,1,1,$current_date_year+1);
        $where_clause .= " WHERE LD.datentime > ".$current_year_start." AND LD.datentime < ".$current_year_end;
    }
}

//query to get requested university urn list & count
$query = "SELECT COUNT(*) AS lead_count,university_id FROM leads_details AS LD JOIN course_list AS CL ON LD.course_id = CL.id".$where_clause." GROUP BY university_id ORDER BY lead_count DESC LIMIT 0,5";
$university_list = mysqli_query($con,$query);

$i = 0;
$rowdata = [];

while($row = mysqli_fetch_assoc($university_list))
{
    $i++;
    $row['rowindex'] = $i;

    $row['uni_name'] = getFieldValue('name','id',$row['university_id'],'university_list',$con);

    //query to get requested university completed urn list & count
	$university_completed_urn_query = "SELECT *,LD.id AS lead_id FROM leads_details AS LD JOIN course_list AS CL ON LD.course_id = CL.id JOIN lead_status_list AS LSL ON LSL.id = LD.status_id WHERE 1 AND LSL.description = 'Complete' AND CL.university_id = ".$row['university_id'];
	$university_completed_urn_result = mysqli_query($con,$university_completed_urn_query);
	$university_completed_urn_count = mysqli_num_rows($university_completed_urn_result);

    //default value of revenue as earning from application point
	$total_earned_revenue = 0;

    while($university_completed_urn = mysqli_fetch_assoc($university_completed_urn_result))
	{
		$where_con_array = [ 'lead_id' => $university_completed_urn['lead_id'], ];

        //revenue calculation
		$income_detail = mysqli_fetch_assoc(getRowsDataCon('income_history',$where_con_array,$con));
		$total_earned_revenue += $income_detail['comission_amount'];
	}

    $row['total_earned_revenue'] = $total_earned_revenue;
    $row['completed_urn_count'] = $university_completed_urn_count;

    $rowdata[] = $row;
}

echo json_encode($rowdata);
?>
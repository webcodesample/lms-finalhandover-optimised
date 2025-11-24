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
        $where_clause .= " WHERE datentime > ".$current_week_start." AND datentime < ".$current_week_end;
    }
    else if($_REQUEST['performance_by'] == "monthly")
    {
        $current_month_start = mktime(0,0,0,$current_date_month,1,$current_date_year);
        $current_month_end = mktime(0,0,0,$current_date_month+1,1,$current_date_year);
        $where_clause .= " WHERE datentime > ".$current_month_start." AND datentime < ".$current_month_end;
    }
    else if($_REQUEST['performance_by'] == "yearly")
    {
        $current_year_start = mktime(0,0,0,1,1,$current_date_year);
        $current_year_end = mktime(0,0,0,1,1,$current_date_year+1);
        $where_clause .= " WHERE datentime > ".$current_year_start." AND datentime < ".$current_year_end;
    }
}

$query = "SELECT COUNT(*) AS lead_count,source_id FROM `temp_leads`".$where_clause." GROUP BY source_id ORDER BY lead_count DESC LIMIT 0,5";
$source_lead_count_list = mysqli_query($con, $query);

$i = 0;
$rowdata = [];

while($row = mysqli_fetch_assoc($source_lead_count_list))
{
    $i++;
    $row['rowindex'] = $i;

    $row['source_name'] = getFieldValue('description','id',$row['source_id'],'lead_sources_list',$con);
    $rowdata[] = $row;
}

echo json_encode($rowdata);
?>
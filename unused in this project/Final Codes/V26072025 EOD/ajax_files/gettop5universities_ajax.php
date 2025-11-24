<?php
include_once("../livesearch/con_ajax.php");
include_once("../common/function.php");
session_start();

$where_clause = " WHERE 1";
$where_clause_inner = "";

$current_date_month = date('m',strtotime('now'));
$current_date_year = date('Y',strtotime('now'));

$current_week_start = getWeekStart();
$current_week_end = getWeekEnd();

if($_SESSION['login_type'] == 4 || $_SESSION['login_type'] == 6)
{
    $where_clause .= " AND LD.allocated_id = '".$_SESSION['user_ref_id']."'";
    $where_clause_inner .= " AND LD.allocated_id = '".$_SESSION['user_ref_id']."'";
}


if($_REQUEST['university_performance_by'] == "weekly")
{
    $where_clause .= " AND LD.datentime > ".$current_week_start." AND LD.datentime < ".$current_week_end;
}
else if($_REQUEST['university_performance_by'] == "monthly")
{
    $current_month_start = mktime(0,0,0,$current_date_month,1,$current_date_year);
    $current_month_end = mktime(0,0,0,$current_date_month+1,1,$current_date_year);
    $where_clause .= " AND LD.datentime > ".$current_month_start." AND LD.datentime < ".$current_month_end;
}
else if($_REQUEST['university_performance_by'] == "yearly")
{
    $current_year_start = mktime(0,0,0,1,1,$current_date_year);
    $current_year_end = mktime(0,0,0,1,1,$current_date_year+1);
    $where_clause .= " AND LD.datentime > ".$current_year_start." AND LD.datentime < ".$current_year_end;
}

//query to get requested university urn list & count
$query = "SELECT COUNT(*) AS lead_count,university_id FROM leads_details AS LD JOIN course_list AS CL ON LD.course_id = CL.id".$where_clause." GROUP BY university_id ORDER BY lead_count DESC LIMIT 0,5";
$university_list = mysqli_query($con,$query);

$display_table = "<table class='table table-sm table-borderless table-hover w-auto fs-9'>
                    <thead class='table-info'>
                    <tr class='sticky-top'>
                    <th></th>
                    <th></th>
                    <th>Total URN</th>
                    <th>Completed URN</th>
                    <th>Revenue Generated</th>
                    </tr>
                    </thead>
                    <tbody>";

$i = 0;
while($university = mysqli_fetch_assoc($university_list))
{
    $i++;
    $university_name = getFieldValue('name','id',$university['university_id'],'university_list',$con);

    //query to get requested university completed urn list & count
	$university_completed_urn_query = "SELECT *,LD.id AS lead_id FROM leads_details AS LD JOIN course_list AS CL ON LD.course_id = CL.id JOIN lead_status_list AS LSL ON LSL.id = LD.status_id WHERE 1 AND LSL.description = 'Complete' AND CL.university_id = ".$university['university_id'].$where_clause_inner;
	$university_completed_urn_result = mysqli_query($con,$university_completed_urn_query);
	$university_completed_urn_count = mysqli_num_rows($university_completed_urn_result);

    //default value of revenue as earning from application point
	$total_earned_revenue = 0;

    while($university_completed_urn = mysqli_fetch_assoc($university_completed_urn_result))
	{
		$where_con_array = [ 'lead_id' => $university_completed_urn['lead_id'], ];

        if($_SESSION['login_type'] == 4 || $_SESSION['login_type'] == 6)
        {
		    //revenue calculation
		    $income_detail = mysqli_fetch_assoc(getRowsDataCon('comission_paid_history',$where_con_array,$con));
		    $total_earned_revenue += $income_detail['comission_amount'];
        }
        else
        {
		    //revenue calculation
		    $income_detail = mysqli_fetch_assoc(getRowsDataCon('income_history',$where_con_array,$con));
		    $total_earned_revenue += $income_detail['comission_amount'];
        }
	}

    
    $display_table .=  "<tr>
                        <th>".$i.".</th>
                        <td>".$university_name."</td>
                        <td class='text-primary fw-bold'>".$university['lead_count']."</td>
                        <td class='text-success fw-bold'>".$university_completed_urn_count."</td>
                        <td class='text-info fw-bold'>".$total_earned_revenue."</td>
                        </tr>";
}

$display_table .= "</tbody>
                    </table>";

echo $display_table;

?>
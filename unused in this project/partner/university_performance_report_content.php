<h5 class="mb-5">University Wise Performance Report</h5>

<div class="d-flex justify-content-end">
<button class="btn btn-sm btn-subtle-danger me-2" onClick="printData('University Wise Performance Report')">
<span data-feather="printer" style="height: 20px; width: 20px;"></span>
</button>
<?php setGoBack("leads.php"); ?>
</div>

<div id="myPrintableDiv" class="mt-5">

<h5 class="text-info mb-1">Total URN : <?=getRowCount('allocated_id',$_SESSION['user_ref_id'],'leads_details',$con)?></h5>
<h5 class="text-success mb-3">Completed URN : <?=$completed_urn_count['total']?></h5>

<table class="table table-sm table-bordered table-hover fs-9">

<thead class="table-warning text-center">
<tr>
<th rowspan="2" class="align-middle">#</th>
<th rowspan="2" class="align-middle">University Name</th>
<th colspan="3">URN Count</th>
<th colspan="3">Revenue</th>
</tr>
<tr>
<th>Total</th>
<th>Completed</th>
<th>Completion Rate(%)</th>
<th>Generated</th>
<th>Received</th>
<th>Outstanding</th>
</tr>
</thead>

<tbody>

<?php
$i = 0;
while($university = mysqli_fetch_assoc($university_list))
{
	$i++;

	//query to get requested university urn list & count
	$university_urn_query = "SELECT * FROM leads_details AS LD JOIN course_list AS CL ON LD.course_id = CL.id WHERE CL.university_id = ".$university['id']." AND LD.allocated_id = '".$_SESSION['user_ref_id']."'";
	$university_urn_result = mysqli_query($con,$university_urn_query);
	$total_urn_count = mysqli_num_rows($university_urn_result);

	if($total_urn_count > 0)
	{
		//query to get requested university completed urn list & count
		$university_completed_urn_query = "SELECT *,LD.id AS lead_id FROM leads_details AS LD JOIN course_list AS CL ON LD.course_id = CL.id JOIN lead_status_list AS LSL ON LSL.id = LD.status_id WHERE LSL.description = 'Complete' AND CL.university_id = ".$university['id']." AND LD.allocated_id = '".$_SESSION['user_ref_id']."'";
		$university_completed_urn_result = mysqli_query($con,$university_completed_urn_query);
		$university_completed_urn_count = mysqli_num_rows($university_completed_urn_result);

		$conversion_percetage = round((($university_completed_urn_count/$total_urn_count)*100),2);

		//default value of revenue as earning from application point
		$total_earned_revenue = 0;
		$total_received_revenue = 0;
		
		while($university_completed_urn = mysqli_fetch_assoc($university_completed_urn_result))
		{
			$where_con_array = [ 'lead_id' => $university_completed_urn['lead_id'], ];

			//revenue calculation
			$income_detail = mysqli_fetch_assoc(getRowsDataCon('comission_paid_history',$where_con_array,$con));
			$total_earned_revenue += $income_detail['comission_amount'];
			if($income_detail['comission_paid'])
			{
				$total_received_revenue += $income_detail['comission_amount'];
			}
		}

		//outstanding revenue & payment calculation
		$total_outstanding_revenue = $total_earned_revenue - $total_received_revenue;

		echo "<tr>
			<td class='ps-2'>".$i."</td>
			<td>".$university['name']."</td>
			<td>".$total_urn_count."</td>
			<td class='text-success'>".$university_completed_urn_count."</td>
			<td class='text-success'>".$conversion_percetage."</td>
			<td class='text-primary'>".$total_earned_revenue."</td>
			<td class='text-success'>".$total_received_revenue."</td>
			<td class='text-danger'>".$total_outstanding_revenue."</td>
			</tr>";
	}
}
?>

</tbody>

</table>
</div>
<?php include_once("footer_copyright.php"); ?>
<?php
$start_date = "";
$end_date = "";

if(isset($_REQUEST['start_date']) && isset($_REQUEST['end_date']) && $_REQUEST['start_date'] && $_REQUEST['end_date'])
{
	$start_date = $_REQUEST['start_date'];
	$end_date = $_REQUEST['end_date'];
}
?>

<h5 class="mb-5">University Wise Performance Report</h5>

<div class="d-flex justify-content-end">
<button class="btn btn-sm btn-subtle-danger me-2" onClick="printData('University Wise Performance Report')">
<span data-feather="printer" style="height: 20px; width: 20px;"></span>
</button>
<?php setGoBack("leads.php"); ?>
</div>

<div id="myPrintableDiv" class="mt-5">

<div class="d-flex justify-content-between">

<div>
<h5 class="text-info mb-1">Total URN : <?=getRowCountMultiCol($where_clause_lead_count,'leads_details',$con)?></h5>
<h5 class="text-success mb-3">Completed URN : <?=$completed_urn_count['total']?></h5>
</div>

<form method="post">
<div class="d-flex ms-5">
<input type="date" name="start_date" class="form-control form-control-sm mb-3 mx-2" style="width:200px;" value="<?=$start_date?>" required>
<input type="date" name="end_date" class="form-control form-control-sm mb-3 mx-2" style="width:200px;" value="<?=$end_date?>" required>
<button type="submit" class="btn btn-sm btn-subtle-danger mb-3 p-1">
<span class="text-danger" data-feather="search" style="height: 20px; width: 20px;"></span>
</button>
</form>
</div>

</div>

<table class="table table-sm table-bordered table-hover fs-9">

<thead class="table-warning text-center">
<tr>
<th rowspan="2" class="align-middle">#</th>
<th rowspan="2" class="align-middle">University Name</th>
<th colspan="3">URN Count</th>
<th colspan="3">Revenue</th>
<th colspan="3">Commission</th>
</tr>
<tr>
<th>Total</th>
<th>Completed</th>
<th>Completion Rate(%)</th>
<th>Generated</th>
<th>Received</th>
<th>Outstanding</th>
<th>Payable</th>
<th>Paid</th>
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
	$university_urn_query = "SELECT * FROM leads_details AS LD JOIN course_list AS CL ON LD.course_id = CL.id WHERE CL.university_id = ".$university['id'].$where_clause;
	$university_urn_result = mysqli_query($con,$university_urn_query);
	$total_urn_count = mysqli_num_rows($university_urn_result);

	if($total_urn_count > 0)
	{
		//query to get requested university completed urn list & count
		$university_completed_urn_query = "SELECT *,LD.id AS lead_id FROM leads_details AS LD JOIN course_list AS CL ON LD.course_id = CL.id JOIN lead_status_list AS LSL ON LSL.id = LD.status_id WHERE LSL.description = 'Complete' AND CL.university_id = ".$university['id'].$where_clause;
		$university_completed_urn_result = mysqli_query($con,$university_completed_urn_query);
		$university_completed_urn_count = mysqli_num_rows($university_completed_urn_result);

		$conversion_percetage = round((($university_completed_urn_count/$total_urn_count)*100),2);

		//default value of revenue as earning from application point
		$total_earned_revenue = 0;
		$total_received_revenue = 0;
		
		//default value of commission as payment to sales agent/sales person
		$total_payable_commission = 0;
		$total_paid_commission = 0;

		while($university_completed_urn = mysqli_fetch_assoc($university_completed_urn_result))
		{
			$where_con_array = [ 'lead_id' => $university_completed_urn['lead_id'], ];

			//revenue calculation
			$income_detail = mysqli_fetch_assoc(getRowsDataCon('income_history',$where_con_array,$con));
			$total_earned_revenue += $income_detail['comission_amount'];
			if($income_detail['comission_rcvd'])
			{
				$total_received_revenue += $income_detail['comission_amount'];
			}

			//commission payment calculation
			$payment_detail = mysqli_fetch_assoc(getRowsDataCon('comission_paid_history',$where_con_array,$con));
			$total_payable_commission += $payment_detail['comission_amount'];
			if($payment_detail['comission_paid'])
			{
				$total_paid_commission += $payment_detail['comission_amount'];
			}
		}

		//outstanding revenue & payment calculation
		$total_outstanding_revenue = $total_earned_revenue - $total_received_revenue;
		$total_outstanding_commission = $total_payable_commission - $total_paid_commission;

		echo "<tr>
			<td class='ps-2'>".$i."</td>
			<td>".$university['name']."</td>
			<td>".$total_urn_count."</td>
			<td class='text-success'>".$university_completed_urn_count."</td>
			<td class='text-success'>".$conversion_percetage."</td>
			<td class='text-primary'>".$total_earned_revenue."</td>
			<td class='text-success'>".$total_received_revenue."</td>
			<td class='text-danger'>".$total_outstanding_revenue."</td>
			<td class='text-primary'>".$total_payable_commission."</td>
			<td class='text-success'>".$total_paid_commission."</td>
			<td class='text-danger'>".$total_outstanding_commission."</td>
			</tr>";
	}
}
?>

</tbody>

</table>
</div>
<?php include_once("footer_copyright.php"); ?>
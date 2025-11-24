<h5 class="mb-5">Customer Wise Report</h5>

<div class="d-flex justify-content-end">
<button class="btn btn-sm btn-subtle-danger me-2" onClick="printData('Customer Wise Report')">
<span data-feather="printer" style="height: 20px; width: 20px;"></span>
</button>
<?php setGoBack("leads.php"); ?>
</div>

<div id="myPrintableDiv" class="mt-5">
<table class="table table-sm table-bordered table-hover fs-9">

<thead class="table-warning text-center">
<tr>
<th rowspan="2" class="align-middle">#</th>
<th colspan="3">Customer Info</th>
<th colspan="6">LRN Count</th>
<th colspan="4">LAN Info</th>
</tr>
<tr>
<th>CRN</th>
<th>Name</th>
<th>Credit Limit</th>
<th>Total</th>
<th>New</th>
<th>LRN Rejected</th>
<th>Customer Rejected</th>
<th>Deleted</th>
<th>Approved</th>
<th>Count</th>
<th>Disbursed Amount</th>
<th>Received Amount</th>
<th>Due Amount</th>
</tr>
</thead>

<tbody>

<?php
$i = 0;
while($lrn = mysqli_fetch_assoc($lrn_list))
{
	$i++;

	$customer_name = getFieldValue('name','id',$lrn['crn'],'customers_list',$con);
	$customer_credit_limit = getFieldValue('credit_limit','id',$lrn['crn'],'customers_list',$con);
	$approved_lrn_list = getCrnLrnList($lrn['crn'],$con);	

	$total_lrn_count = getRowCount('crn',$lrn['crn'],'lrn_list',$con);
	
	echo "<tr class='text-center'>
		<td>".$i."</td>
		<td class='text-start'>".$lrn['crn']."</td>
		<td class='text-start ps-2'><a class='text-decoration-none' title='View Customer LRN List' href='../crn_management/manage_crn.php?crn=".$lrn['crn']."&tab=lrn_list'>".$customer_name."</a></td>
		<td class='text-primary'>".$customer_credit_limit."</td>
		<td>".$total_lrn_count."</td>
		<td>".crnLrnCount($lrn['crn'],'New',$con)."</td>
		<td class='text-danger'>".crnLrnCount($lrn['crn'],'LRN Rejected',$con)."</td>
		<td class='text-danger'>".crnLrnCount($lrn['crn'],'Customer Rejected',$con)."</td>
		<td class='text-danger'>".crnLrnCount($lrn['crn'],'Deleted',$con)."</td>
		<td class='text-success'>".crnLrnCount($lrn['crn'],'Approved',$con)."</td>";

	if(crnLrnCount($lrn['crn'],'Approved',$con) > 0)
	echo "<td class='text-success'>".crnLrnCount($lrn['crn'],'Approved',$con)."</td>
		<td class='text-primary'>".getAllLanDisbursedAmount($approved_lrn_list,$con)."</td>
		<td class='text-success'>".getAllLanReceivedAmount($lrn['crn'],$con)."</td>
		<td class='text-danger'>".getAllLanDisbursedAmount($approved_lrn_list,$con)-getAllLanReceivedAmount($lrn['crn'],$con)."</td>
		</tr>";
	else
	echo "<td colspan='4' class='text-danger text-center'>No LAN Generated</td>
		</tr>";
}

function crnLrnCount($crn,$status_description,$con)
{
	$query = "SELECT * FROM lrn_list AS LL JOIN lead_status_list AS LSL ON LL.status_id = LSL.id WHERE LSL.description = '".$status_description."' AND LL.crn = ".$crn;
	$result = mysqli_query($con, $query);
	return mysqli_num_rows($result);
}

function getCrnLrnList($crn,$con)
{
	if(getRowCountMultiCol(' WHERE status_id = 4 AND crn = '.$crn,'lrn_list',$con) > 0)
	return mysqli_fetch_assoc(mysqli_query($con,"SELECT GROUP_CONCAT(lrn SEPARATOR ', ') AS all_lrns FROM lrn_list WHERE crn = ".$crn." AND status_id = 4 GROUP BY crn"))['all_lrns'];
	else
	return "zero";
}

function getAllLanDisbursedAmount($approved_lrn_list,$con)
{
	$amount = 0;
	if($approved_lrn_list !== 'zero')
	{
		$approved_lrn_array = explode(',',$approved_lrn_list);
		foreach($approved_lrn_array AS $lrnValue)
		{
			$amount += getLatestUpdateRow('lrn',$lrnValue,'lan_audit_history',$con)['approved_loan_amount'];
		}
	}
	return $amount;
}

function getAllLanReceivedAmount($crn,$con)
{
	return mysqli_fetch_assoc(mysqli_query($con,"SELECT SUM(amount) AS rcvd_amount FROM lan_ledger_transactions WHERE remark = 'Customer Payment Received' AND crn = ".$crn))['rcvd_amount'];
}
?>

</tbody>

</table>
</div>
<?php include_once("footer_copyright.php"); ?>
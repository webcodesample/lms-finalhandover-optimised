<h5 class="mb-5">Product Wise Report : <?=$product_name?></h5>

<div class="d-flex justify-content-end">
<button class="btn btn-sm btn-subtle-danger me-2" onClick="printData('Product Wise Report : <?=$product_name?>')">
<span data-feather="printer" style="height: 20px; width: 20px;"></span>
</button>
<?php setGoBack("leads.php"); ?>
</div>

<div id="myPrintableDiv" class="mt-5">
<table class="table table-sm table-bordered table-hover fs-9">

<thead class="table-warning text-center">
<tr>
<th rowspan="2" class="align-middle">#</th>
<th rowspan="2" class="align-middle">Product</th>
<th colspan="4">LAN Info</th>
</tr>
<tr>
<th>LAN</th>
<th>Disbursed Amount</th>
<th>Received Amount</th>
<th>Due Amount</th>
</tr>
</thead>

<tbody>

<?php
$i = 0;
while($lan_audit = mysqli_fetch_assoc($lan_audit_list))
{
	$i++;

	$lan = mysqli_fetch_assoc(mysqli_query($con,"SELECT * FROM lan_audit_history WHERE id = ".$lan_audit['lan_audit_id']));
	$product_name = getFieldValue('description','id',$lan['product_id'],'product_list',$con);

	echo "<tr class='text-center'>
		<td>".$i."</td>
		<td class='text-start ps-2'><a href='?product_id=".$lan['product_id']."'>".$product_name."</a></td>
		<td><a class='text-decoration-none' title='View LAN Ledger' href='../lan_management/manage_lan.php?lan=".$lan['lan']."&tab=ledger'>".$lan['lan']."</a></td>
		<td class='text-primary'>".$lan['approved_loan_amount']."</td>
		<td class='text-success'>".getLanReceivedAmount($lan['lan'],$con)."</td>
		<td class='text-danger'>".$lan['approved_loan_amount']-getLanReceivedAmount($lan['lan'],$con)."</td>
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
		foreach($approved_lrn_array AS $lanValue)
		{
			$amount += getLatestUpdateRow('lrn',$lanValue,'lan_audit_history',$con)['approved_loan_amount'];
		}
	}
	return $amount;
}

function getLanReceivedAmount($lan,$con)
{
	return mysqli_fetch_assoc(mysqli_query($con,"SELECT SUM(amount) AS rcvd_amount FROM lan_ledger_transactions WHERE remark = 'Customer Payment Received' AND lan = ".$lan))['rcvd_amount'];
}
?>

</tbody>

</table>
</div>
<?php include_once("footer_copyright.php"); ?>
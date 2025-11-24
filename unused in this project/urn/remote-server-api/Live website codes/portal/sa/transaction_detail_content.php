<div class="d-flex justify-content-between mb-3">
<h5 class="mt-2">Transaction Details</h5>
<?php setGoBack("mywallet.php"); ?>
</div>

<table class="table table-sm table-hover table-bordered fs-9">

<thead class="table-warning text-center">
<th>#</th>
<th>Amount</th>
<th>Request Date</th>
<th>Approval Date</th>
<th>Transaction ID</th>
<th>Transaction Date</th>
<th>Transaction Proof</th>
</thead>

<tbody>

<?php
$i = 0;

while($transaction = mysqli_fetch_assoc($transaction_list))
{
	$i++;

	$transaction_proof_array = explode(',',$transaction['proof_file_name']);
	$transaction_proof_link = "";

	for($j=0;$j<count($transaction_proof_array);$j++)
	{
		if($j == 0)
		$transaction_proof_link .= "<a class='text-decoration-none link-success' href='../transaction_proofs/".$transaction_proof_array[$j]."' target='_blank'>".$transaction_proof_array[$j]."</a>";
		else
		$transaction_proof_link .= ", <a class='text-decoration-none link-success' href='../transaction_proofs/".$transaction_proof_array[$j]."' target='_blank'>".$transaction_proof_array[$j]."</a>";
	}

	echo "<tr>
		<td class='ps-2'>".$i."</td>
		<td>".$transaction['amount']."</td>
		<td>".date('d-m-Y h:i:s A',$transaction['req_datentime'])."</td>
		<td>".date('d-m-Y h:i:s A',$transaction['approval_datentime'])."</td>
		<td>".$transaction['transaction_id']."</td>
		<td>".date('d-m-Y h:i:s A',$transaction['transaction_datentime'])."</td>
		<td>".$transaction_proof_link."</td>
		</tr>";	
}
?>

</tbody>

</table>

<?php include_once("footer_copyright.php") ?>
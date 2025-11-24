<div class="d-flex justify-content-between mb-3">
<h5 class="mt-2">Transaction Details</h5>
<?php setGoBack("commission_history.php"); ?>
</div>

<table class="table table-sm table-hover table-bordered fs-9">

<thead class="table-warning text-center">
<th>#</th>
<th>Amount</th>
<th>Approval Date</th>
<th>Approved By</th>
<th>Transaction ID</th>
<th>Transaction Date</th>
<th>Transaction Proof</th>
</thead>

<tbody>

<?php
$i = 0;

while($income = mysqli_fetch_assoc($income_list))
{
	$i++;

	$income_proof_array = explode(',',$income['transaction_proof_file_name']);
	$income_proof_link = "";

	for($j=0;$j<count($income_proof_array);$j++)
	{
		if($j == 0)
		$income_proof_link .= "<a class='text-decoration-none link-success' href='../income_proofs/".$income_proof_array[$j]."' target='_blank'>".$income_proof_array[$j]."</a>";
		else
		$income_proof_link .= ", <a class='text-decoration-none link-success' href='../income_proofs/".$income_proof_array[$j]."' target='_blank'>".$income_proof_array[$j]."</a>";
	}

	if($income['entry_done_by'] == $_SESSION['user_ref_id'])
		$approved_by ="You";
	else
		$approved_by = $income['entry_done_by'];

	echo "<tr>
		<td class='ps-2'>".$i."</td>
		<td>".$income['comission_amount']."</td>
		<td>".date('d-m-Y h:i:s A',$income['entry_datentime'])."</td>
		<td>".$approved_by."</td>
		<td>".$income['transaction_id']."</td>
		<td>".date('d-m-Y h:i:s A',$income['datentime'])."</td>
		<td>".$income_proof_link."</td>
		</tr>";	
}
?>

</tbody>

</table>

<?php include_once("footer_copyright.php") ?>
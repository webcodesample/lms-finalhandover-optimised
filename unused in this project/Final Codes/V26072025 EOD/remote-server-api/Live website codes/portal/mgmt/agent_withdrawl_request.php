<form action="approve_withdrawl_request.php" method="post" enctype="multipart/form-data">
<input type="hidden" name="wallet_id" value="<?=$wallet_id?>">
<input type="hidden" name="agent_id" value="<?=$_REQUEST['agent_id']?>">

<div class="d-flex justify-content-between mb-3">
<h5 class="mt-2 text-nowrap">Pending Withdrawl Request</h5>
<div class="d-flex">
<input type="text" class="form-control form-control-sm m-1" name="transaction_id" placeholder="UTR/Transaction ID" style="width:150px;" required>
<input type="datetime-local" class="form-control form-control-sm m-1" name="transaction_datentime" style="width:180px;" required>
<input type="file" class="form-control form-control-sm m-1" name="payment_proof[]" accept=".jpg,.jpeg,.pdf" style="width:225px;" multiple required>
<button type="submit" onClick="return validateWRSelection()" class="btn btn-sm btn-subtle-danger m-1 text-nowrap">Approve Withdrawl</button>
</div>
</div>

<table class="table table-sm table-hover table-bordered fs-9">

<thead class="table-warning text-center">
<th>#</th>
<th>Amount</th>
<th>Request Date</th>
</thead>

<tbody>

<?php
$wallet_id = getFieldvalue('id','holder_id',$_REQUEST['agent_id'],'wallet_list',$con);

$wallet_where_con_array = [ 'wallet_id' => $wallet_id, 'status' => 0];

if(getRowCountMultiCol(setWhereClause($wallet_where_con_array),'withdrawl_request_list',$con))
{
	$i = 0;
	$withdrawl_request_list = getRowsDataCon('withdrawl_request_list',$wallet_where_con_array,$con);

	while($pending_request = mysqli_fetch_assoc($withdrawl_request_list))
	{
		$i++;
		echo "<tr>
			<td class='ps-2'><input type='checkbox' class='form-check-input' value='".$pending_request['id']."' name='withdrawl_request[]'> ".$i."</td>
			<td>".$pending_request['amount']."</td>
			<td>".date('d-m-Y h:i:s A', $pending_request['req_datentime'])."</td>
			</tr>";
	}
}
else {
	echo "<tr><td colspan='3' class='text-center'><span class='fw-bold text-danger'>No Pending Request</span></td></tr>";
}

?>

</tbody>
</table>

</form>

<?php include_once("footer_copyright.php"); ?>
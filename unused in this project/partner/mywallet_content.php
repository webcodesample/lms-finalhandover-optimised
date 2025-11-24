<div class="d-flex justify-content-between">
<div class="d-flex">
<h5 class="m-1 mb-3">My Wallet History</h5>
<span class="text-primary m-1 fw-bold">Balance : <?=$wallet_current_balance?></span>
</div>
<div>
<span class="text-success m-1 fw-bold">Withdrawable : <?=$withdrwable_balance?></span>
<?php
if($wallet_current_balance)
{
?>
<input type="button" id="request_withdrawal_btn" class="btn btn-sm btn-warning m-1 px-1 py-1" data-bs-toggle="modal" data-bs-target="#withdrawlRequest" value="Request Withdrawal">
<?php
}
?>
</div>
</div>

<table class="table table-sm table-bordered table-hover fs-9">

<thead class="table-info text-center">
<tr>
<th>#</th>
<th>Date</th>
<th>Description</th>
<th>Transaction ID</th>
<th>Earning</th>
<th>Withdrawl</th>
<th>Balance</th>
<th>Action</th>
</tr>
</thead>

<tbody>

<?php
$i = 0;
$wallet_balance = getFieldValue('balance','id',$wallet_id,'wallet_list',$con);

 while($wallet_transaction = mysqli_fetch_assoc($wallet_transactions))
 {
	 $i++;

	 if($wallet_transaction['transaction_type'] == 111)
		$remark_suffix = "";
	 else if($wallet_transaction['transaction_type'] == 0)
		$remark_suffix = " <a href='transaction_detail.php?transaction_id=".$wallet_transaction['transaction_id']."' class='link-success text-decoration-none'>".$wallet_transaction['transaction_id']."</a>";
	 else if($wallet_transaction['transaction_type'] == 1)
		$remark_suffix = " <span class='text-success'>".$wallet_transaction['transaction_id']."</span>";

	 echo "<tr>
		<td class='ps-2'>".$i."</td>
		<td nowrap>".date('d-m-Y', $wallet_transaction['transaction_date'])."</td>
		<td>".$wallet_transaction['transaction_remark']."</td>
		<td>".$remark_suffix."</td>";

	if($wallet_transaction['transaction_type'] == 0)
	{
		echo "<td></td>
			<td nowrap>".$wallet_transaction['transaction_amount']."</td>";
		//calculate wallet balance after transaction
		$wallet_balance_new = $wallet_balance + $wallet_transaction['transaction_amount'];
	}
	else if($wallet_transaction['transaction_type'] == 1)
	{
		echo "<td nowrap>".$wallet_transaction['transaction_amount']."</td>
			<td></td>";
		//calculate wallet balance after transaction
		$wallet_balance_new = $wallet_balance - $wallet_transaction['transaction_amount'];
	}
	else
	{
		echo "<td>0.00</td>
			<td>0.00</td>";
		$wallet_balance_new = $wallet_balance;
	}

	echo "<td>".number_format($wallet_balance,2,'.','')."</td>";

	if($wallet_transaction['transaction_type'] == 111 || $wallet_transaction['transaction_type'] == 1)
	{
		echo "<td></td>";
	}
	else
	{
		echo "<td nowrap>
			<button class='btn btn-sm p-0 bg-light' onClick='showIframe(&quot;transaction_proof.php?transaction_id=".$wallet_transaction['transaction_id']."&quot;)' data-bs-toggle='modal' data-bs-target='#transactionProof'>
			  <span data-feather='eye' style='height:20px;' class='text-primary'></span>
			</button>
			</td>";
	}
	echo "</tr>";

	//update wallet balance after transaction
	$wallet_balance = $wallet_balance_new;
 }
?>
</tbody>

</table>

<?php
include_once("withdrawl_request_modal.php");
include_once("transaction_proof_modal.php");
?>

<?php include_once("footer_copyright.php"); ?>
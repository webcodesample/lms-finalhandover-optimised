<?php
 $wallet_where_con_array = [ 'wallet_id' => $wallet_id];

 $wallet_transactions = getRowsDataCon('wallet_history',$wallet_where_con_array,$con);
 $wallet_current_balance = getFieldValue('balance','id',$wallet_id,'wallet_list',$con);
?>

<div class="d-flex justify-content-between">
<h5 class="m-1">Wallet History</h5>
<div>
<span class="text-primary m-1 fw-bold">Balance : <?=$wallet_current_balance?></span>
<?php
if($wallet_current_balance)
{
?>
<input type="button" class="btn btn-sm btn-warning m-1" value="Request Withdrawl">
<?php
}
?>
</div>
</div>

<table class="table table-sm table-bordered table-hover table-striped fs-9">

<thead class="table-info text-center">
<tr>
<th>#</th>
<th>Date</th>
<th>Description</th>
<th>Earning</th>
<th>Withdrawl</th>
<th>Balance</th>
<th>Action</th>
</tr>
</thead>

<tbody>

<?php
$i = 0;

 while($wallet_transaction = mysqli_fetch_assoc($wallet_transactions))
 {
	 $i++;

	 echo "<tr>
		<td class='ps-2'>".$i."</td>
		<td nowrap>".date('d-m-Y', $wallet_transaction['transaction_date'])."</td>
		<td>".$wallet_transaction['transaction_remark']."</td>";

	if($wallet_transaction['transaction_type'] == 0)
	{
		echo "<td></td>
			<td nowrap>".$wallet_transaction['transaction_amount']."</td>";
	}
	else if($wallet_transaction['transaction_type'] == 1)
	{
		echo "<td nowrap>".$wallet_transaction['transaction_amount']."</td>
			<td></td>";
	}
	else
	{
		echo "<td>0</td>
			<td>0</td>";
	}

	echo "<td>".getFieldValue('balance','id',$wallet_id,'wallet_list',$con)."</td>";

	if($wallet_transaction['transaction_type'] == 111)
	{
		echo "<td></td>";
	}
	else
	{
		echo "<td nowrap>
			<img src='../portal-icons/edit.png' height='20px'>
			<img src='../portal-icons/delete.png' height='20px'>
			<img src='../portal-icons/add.png' height='20px'>
			<span class='text-primary' data-feather='eye' style='height: 20px;'></span>
			<span class='text-danger' data-feather='printer' style='height: 20px;'></span>
			</td>";
	}
	echo "</tr>";
 }
?>
</tbody>

</table>

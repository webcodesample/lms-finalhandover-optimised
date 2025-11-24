<h5>Pending Withdrawl Request</h5>
<?php

$wallet_where_con_array = [ 'wallet_id' => $wallet_id, 'status' => 0];

if(getRowCountMultiCol(setWhereClause($wallet_where_con_array),'withdrawl_request_list',$con))
{
	$withdrawl_request_list = getRowsDataCon('withdrawl_request_list',$wallet_where_con_array,$con);

	while($pending_request = mysqli_fetch_assoc(withdrawl_request_list))
	{
		print_r($pending_request);
	}
}
else {
	echo "<center><span class='fw-bold text-danger'>No Pending Request</span></center>";
}

?>
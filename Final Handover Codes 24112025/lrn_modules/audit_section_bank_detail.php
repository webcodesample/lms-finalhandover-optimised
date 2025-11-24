<?php
if($lrn_audit_history['bank_account'] > 0)
{
	$where_con_array = [ 'id' => $lrn_audit_history['bank_account']];
	$bank = mysqli_fetch_assoc(getRowsDataCon('bank_accounts_list',$where_con_array,$con));

	echo "<thead>
		<tr><th colspan='3' nowrap>Bank Account Detail<button id='bank_detail_btn_".$i."' class='btn btn-sm btn-subtle-danger ms-2 px-1 py-0 fw-bolder' onClick='toggleSection(&quot;bank_detail&quot;)'>+</button></th></tr>
		</thead>
		<tbody id='bank_detail_".$i."' class='d-none'>
		<tr>
			<td nowrap>Name </td><td>:</td>
			<td>".validateColumnUpdation('bank_account',$bank['bank_name'],$updated_column_array)."</td>
		</tr>
		<tr>
			<td nowrap>Branch Address </td><td>:</td>
			<td>".validateColumnUpdation('bank_account',$bank['branch_address'],$updated_column_array)."</td>
		</tr>
		<tr>
			<td nowrap>Account Number</td><td>:</td>
			<td>".validateColumnUpdation('bank_account',$bank['account_number'],$updated_column_array)."</td>
		</tr>
		<tr>
			<td nowrap>IFSC</td><td>:</td>
			<td>".validateColumnUpdation('bank_account',$bank['ifsc'],$updated_column_array)."</td>
		</tr>
		</tbody>";
}
?>
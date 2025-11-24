<?php
if($lrn_audit_history['product_id'] > 0)
$product = getFieldValue('description','id',$lrn_audit_history['product_id'],'product_list',$con);
else
$product = 'Not Selected';

if($lrn_audit_history['introducer_id'] > 0)
$introducer = getFieldValue('name','id',$lrn_audit_history['introducer_id'],'introducer_list',$con);
else
$introducer = 'Not Selected';

echo "<thead>
	<tr><th colspan='3' nowrap>Loan Detail<button id='loan_detail_btn_".$i."' class='btn btn-sm btn-subtle-danger ms-2 px-1 py-0 fw-bolder' onClick='toggleSection(&quot;loan_detail&quot;)'>+</button></th></tr>
	</thead>
	<tbody id='loan_detail_".$i."' class='d-none'>
	<tr>
		<td nowrap>Product </td><td>:</td>
		<td>".validateColumnUpdation('product_id',$product,$updated_column_array)."</td>
	</tr>
	<tr>
		<td nowrap>Required Amount </td><td>:</td>
		<td>".validateColumnUpdation('required_loan_amount',$lrn_audit_history['required_loan_amount'],$updated_column_array)."</td>
	</tr>
	<tr>
		<td nowrap>Introducer</td><td>:</td>
		<td>".validateColumnUpdation('introducer_id',$introducer,$updated_column_array)."</td>
	</tr>";

if($lrn_audit_history['approved_loan_amount'] > 0)
{
	$payment_frequency = $lrn_audit_history['payment_frequency'];
	$roi = $lrn_audit_history['roi'].'% '.$payment_frequency;
	$loan_tenure = $lrn_audit_history['loan_tenure'].' '.str_replace('ly','s',$payment_frequency);

	echo "<tr>
			<td nowrap>Approved Amount </td><td>:</td>
			<td>".validateColumnUpdation('approved_loan_amount',$lrn_audit_history['approved_loan_amount'],$updated_column_array)."</td>
		</tr>
		<tr>
			<td nowrap>Rate of Interest</td><td>:</td>
			<td>".validateColumnUpdation('roi',$roi,$updated_column_array)."</td>
		</tr>
		<tr>
			<td nowrap>Repayment Frequency</td><td>:</td>
			<td>".validateColumnUpdation('payment_frequency',$payment_frequency,$updated_column_array)."</td>
		</tr>
		<tr>
			<td nowrap>Tenure</td><td>:</td>
			<td>".validateColumnUpdation('loan_tenure',$loan_tenure,$updated_column_array)."</td>
		</tr>";
}

echo "</tbody>";
?>
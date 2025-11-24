<?php
if($lrn_audit_history['cust_type'] == 2)
$lrn_cust_type = 'Corporate';
else
$lrn_cust_type = 'Individual';

if($lrn_audit_history['dob'] > 0)
$dob = date('d-m-Y',$lrn_audit_history['dob']);
else
$dob = 'Not Available';

echo "<thead>
	<tr>
		<th colspan='3' nowrap>Customer Detail<button id='customer_detail_btn_".$i."' class='btn btn-sm btn-subtle-danger ms-2 px-1 py-0 fw-bolder' onClick='toggleSection(&quot;customer_detail&quot;)'>+</button></th>
	</tr>
	</thead>
	<tbody id='customer_detail_".$i."' class='d-none'>
	<tr>
		<td nowrap>Name </td><td>:</td>
		<td>".validateColumnUpdation('name',$lrn_audit_history['name'],$updated_column_array)."</td>
	</tr>
	<tr>
		<td nowrap>Type </td><td>:</td>
		<td>".validateColumnUpdation('cust_type',$lrn_cust_type,$updated_column_array)."</td>
	</tr>
	<tr>
		<td nowrap>Mobile </td><td>:</td>
		<td>".validateColumnUpdation('mobile',$lrn_audit_history['mobile'],$updated_column_array)."</td>
	</tr>
	<tr>
		<td nowrap>Mobile Alt </td><td>:</td>
		<td>".validateColumnUpdation('alt_mobile',$lrn_audit_history['alt_mobile'],$updated_column_array)."</td>
	</tr>
	<tr>
		<td nowrap>Email </td><td>:</td>
		<td>".validateColumnUpdation('email',$lrn_audit_history['email'],$updated_column_array)."</td>
	</tr>
	<tr>
		<td nowrap>DOB </td><td>:</td>
		<td>".validateColumnUpdation('dob',$dob,$updated_column_array)."</td>
	</tr>
	<tr>
		<td nowrap>Permanent Address </td><td>:</td>
		<td>".validateColumnUpdation('permanent_address',$lrn_audit_history['permanent_address'],$updated_column_array)."</td>
	</tr>
	<tr>
		<td nowrap>Current Address </td><td>:</td>
		<td>".validateColumnUpdation('current_address',$lrn_audit_history['current_address'],$updated_column_array)."</td>
	</tr>
	<tr>
		<td>Brief Note </td><td>:</td>
		<td>".validateColumnUpdation('brief_note',$lrn_audit_history['brief_note'],$updated_column_array)."</td>
	</tr>
	</tbody>";
?>
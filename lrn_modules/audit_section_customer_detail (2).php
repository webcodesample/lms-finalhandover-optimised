<?php
echo "<thead>
		<tr><th colspan='3' nowrap>Customer Detail<button id='customer_detail_btn_".$i."' class='btn btn-sm btn-subtle-danger ms-2 px-1 py-0 fw-bolder' onClick='toggleSection(&quot;customer_detail&quot;)'>+</button></th></tr>
		</thead>
		<tbody id='customer_detail_".$i."' class='d-none'>
		<tr><td nowrap>Name </td><td>:</td><td>";

if(in_array('name',$updated_column_array))
	echo "<span class='text-danger'>".$lrn_audit_history['name']."</span>";
else
	echo $lrn_audit_history['name'];

echo "</td></tr>
	<tr><td nowrap>Type </td><td>:</td><td>";

if($lrn_audit_history['cust_type'] == 2)
$lrn_cust_type = 'Corporate';
else
$lrn_cust_type = 'Individual';

if(in_array('cust_type',$updated_column_array))
	echo "<span class='text-danger'>".$lrn_cust_type."</span>";
else
	echo $lrn_cust_type;

echo "</td></tr>
	<tr><td nowrap>Mobile </td><td>:</td><td>";

if(in_array('mobile',$updated_column_array))
	echo "<span class='text-danger'>".$lrn_audit_history['mobile']."</span>";
else
	echo $lrn_audit_history['mobile'];

echo "</td></tr>
	<tr><td nowrap>Mobile Alt </td><td>:</td><td>";

if(in_array('alt_mobile',$updated_column_array))
	echo "<span class='text-danger'>".$lrn_audit_history['alt_mobile']."</span>";
else
	echo $lrn_audit_history['alt_mobile'];

echo "</td></tr>
	<tr><td nowrap>Email </td><td>:</td><td>";

if(in_array('email',$updated_column_array))
	echo "<span class='text-danger'>".$lrn_audit_history['email']."</span>";
else
	echo $lrn_audit_history['email'];
		
echo "</td></tr>
	<tr><td nowrap>DOB </td><td>:</td><td>";

if(in_array('dob',$updated_column_array))
	echo "<span class='text-danger'>".date('d-m-Y',$lrn_audit_history['dob'])."</span>";
else
	echo date('d-m-Y',$lrn_audit_history['dob']);

echo "</td></tr>
	<tr><td nowrap>Permanent Address </td><td>:</td><td>";

if(in_array('permanent_address',$updated_column_array))
	echo "<span class='text-danger'>".$lrn_audit_history['permanent_address']."</span>";
else
	echo $lrn_audit_history['permanent_address'];

echo "</td></tr>
	<tr><td nowrap>Current Address </td><td>:</td><td>";

if(in_array('current_address',$updated_column_array))
	echo "<span class='text-danger'>".$lrn_audit_history['current_address']."</span>";
else
	echo $lrn_audit_history['current_address'];

echo "</td></tr>
	<tr><td>Brief Note </td><td>:</td><td>";

if(in_array('brief_note',$updated_column_array))
	echo "<span class='text-danger'>".$lrn_audit_history['brief_note']."</span>";
else
	echo $lrn_audit_history['brief_note'];

echo "</td></tr>
	</tbody>";
?>
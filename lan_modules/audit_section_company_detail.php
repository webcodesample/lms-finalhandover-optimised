<?php
if($lan_audit_history['company_type'] > 0)
$lrn_company_type = getFieldValue('description','id',$lan_audit_history['company_type'],'company_type_list',$con);
else
$lrn_company_type = 'Not Selected';

if($lan_audit_history['company_doi'] > 0)
$doi = date('d-m-Y',$lan_audit_history['company_doi']);
else
$doi = 'Not Available';

echo "<thead>
	<tr>
		<th colspan='3' nowrap>Company Detail<button id='company_detail_btn_".$i."' class='btn btn-sm btn-subtle-danger ms-2 px-1 py-0 fw-bolder' onClick='toggleSection(&quot;company_detail&quot;)'>+</button></th>
	</tr>
	</thead>
	<tbody id='company_detail_".$i."' class='d-none'>
	<tr>
		<td nowrap>Name </td><td>:</td>
		<td>".validateColumnUpdation('company_name',$lan_audit_history['company_name'],$updated_column_array)."</td>
	</tr>
	<tr>
		<td nowrap>Type </td><td>:</td>
		<td>".validateColumnUpdation('company_type',$lrn_company_type,$updated_column_array)."</td>
	</tr>
	<tr>
		<td nowrap>Mobile </td><td>:</td>
		<td>".validateColumnUpdation('company_mobile',$lan_audit_history['company_mobile'],$updated_column_array)."</td>
	</tr>
	<tr>
		<td nowrap>Email </td><td>:</td>
		<td>".validateColumnUpdation('company_email',$lan_audit_history['company_email'],$updated_column_array)."</td>
	</tr>
	<tr>
		<td nowrap>Date of Incorporation </td><td>:</td>
		<td>".validateColumnUpdation('company_doi',$doi,$updated_column_array)."</td>
	</tr>
	<tr>
		<td nowrap>Address </td><td>:</td>
		<td>".validateColumnUpdation('company_address',$lan_audit_history['company_address'],$updated_column_array)."</td>
	</tr>
	<tr>
		<td nowrap>Annual Turnover </td><td>:</td>
		<td>".validateColumnUpdation('company_turnover',$lan_audit_history['company_turnover'],$updated_column_array)."</td>
	</tr>
	</tbody>";
?>
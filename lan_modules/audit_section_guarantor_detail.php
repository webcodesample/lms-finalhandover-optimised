<?php
if($lan_audit_history['guarantor_id'] > 0)
{
	$where_con_array = [ 'id' => $lan_audit_history['guarantor_id']];
	$guarantor = mysqli_fetch_assoc(getRowsDataCon('guarantor_list',$where_con_array,$con));

	echo "<thead>
			<tr><th colspan='3' nowrap>Guarantor Detail<button id='guarantor_detail_btn_".$i."' class='btn btn-sm btn-subtle-danger ms-2 px-1 py-0 fw-bolder' onClick='toggleSection(&quot;guarantor_detail&quot;)'>+</button></th></tr>
			</thead>
			<tbody id='guarantor_detail_".$i."' class='d-none'>
				<tr>
					<td nowrap>Name </td><td>:</td>
					<td>".validateColumnUpdation('guarantor_id',$guarantor['name'],$updated_column_array)."</td>
				</tr>
				<tr>
					<td nowrap>Mobile </td><td>:</td>
					<td>".validateColumnUpdation('guarantor_id',$guarantor['mobile'],$updated_column_array)."</td>
				</tr>
				<tr>
					<td nowrap>Email </td><td>:</td>
					<td>".validateColumnUpdation('guarantor_id',$guarantor['email'],$updated_column_array)."</td>
				</tr>
				<tr>
					<td nowrap>Permanent Address </td><td>:</td>
					<td>".validateColumnUpdation('guarantor_id',$guarantor['permanent_address'],$updated_column_array)."</td>
				</tr>
				<tr>
					<td nowrap>Current Addres </td><td>:</td>
					<td>".validateColumnUpdation('guarantor_id',$guarantor['current_address'],$updated_column_array)."</td>
				</tr>
			</tbody>";
}
?>
<div class="d-flex mb-2">
<h6 class="mt-1">All Calls</h6>
<input type="checkbox" class="form-check-input m-1" checked onClick="$('#callList').toggleClass('d-none')">
</div>

<?php
$where_con_array_call = [ 'lrn' => $_REQUEST['lrn'], ];

$order_clause = " ORDER BY datentime DESC";

$call_list = getRowsDataCon('call_history',$where_con_array_call,$con,$order_clause);

?>

<table id="callList" class="table table-sm table-bordered table-hover fs-9">

<thead class="table-info text-center">
<th>#</th>
<th nowrap>Date</th>
<th>Time</th>
<th>Type</th>
<th nowrap>Call Remark</th>
<th nowrap>Remark By</th>
<th>History Created On</th>
</thead>

<tbody>

<?php
$i = 0;
while($call = mysqli_fetch_assoc($call_list))
{
	$i++;

	if($call['remark_by'])
		$call_remark_by = "<span class='text-danger'>".$call['remark_by']." - </span>".strtoupper(getFieldValue('name','id',substr($call['remark_by'],2),'staff_list',$con));
	else
		$call_remark_by = "";

	if($call['type'] == 0)
		$call_type = "<span class='text-danger'>Inward</span>";
	else
		$call_type = "<span class='text-success'>Outward</span>";

	echo "<tr>
		<td class='ps-2'>".$i."</td>
		<td>".date('d-m-Y',$call['datentime'])."</td>
		<td>".date('h:i:s A',$call['datentime'])."</td>
		<td>".$call_type."</td>
		<td>".$call['remark']."</td>
		<td>".$call_remark_by."</td>
		<td>".date('d-m-Y h:i:s A',$call['dataentry_datentime'])."</td>
		</tr>";
}
?>

</tbody>

</table>

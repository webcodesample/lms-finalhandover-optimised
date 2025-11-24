<?php
$where_con = ['request_for' => $_REQUEST['lan'],];

$query_lan_request_list = "SELECT * FROM customer_request_list ".setWhereClause($where_con)." ORDER BY datentime DESC";
$result_lan_request_list = mysqli_query($con, $query_lan_request_list);

if(in_array($_SESSION['login_type'],[1,3,7,8]))
$extraColumn = "<th>By</th>";
else
$extraColumn = "";
?>

<table class="table table-sm table-hover table-bordered fs-9 mb-1 mt-2">

<thead class="table-info text-center">
<tr>
<th>#</th>
<th>Request To</th>
<th>Date</th>
<th>Status</th>
<th>Resolved Date</th>
<th>Remark</th>
<?=$extraColumn?>
</tr>
</thead>

<tbody>

<?php
$i = 0;

while($request = mysqli_fetch_assoc($result_lan_request_list))
{
	$i++;
	$resolved_date = '';
	$rowBgColorClass = 'bg-light-subtle';
	$resolved_by = '';

	if($extraColumn)
	$status_description = "<button class='btn btn-sm btn-warning rounded rounded-5 p-2' data-bs-toggle='modal' data-bs-target='#updateLANRequestModal' onClick='setReqRefID(".$request['id'].",2)' title='Click to Close/Cancel Request'></button>";
	else
	$status_description = "Open";

	$request_description = getFieldValue('description','id',$request['request_type_id'],'customer_request_type_list',$con);
	
	$request_date = date('d-m-Y h:i:s A',$request['datentime']);

	if($request['resolved_on'] > 0)
	$resolved_date = date('d-m-Y h:i:s A',$request['resolved_on']);

	if($request['status'] == 1)
	{
		$status_description = "Closed";
		$rowBgColorClass = 'bg-success-subtle';
	}
	else if($request['status'] == 2)
	{
		$status_description = "Cancled";
		$rowBgColorClass = 'bg-danger-subtle';
	}

	if($extraColumn)
	{
		if($request['resolved_by'])
		$resolver_name = getFieldValue('name','id',str_replace('BS','',$request['resolved_by']),'staff_list',$con);
		else
		$resolver_name = "";

		$resolved_by = "<td class='px-1'>".$resolver_name."</td>";
	}

	echo "<tr class='".$rowBgColorClass."'>
			<td class='px-1'>".$i."</td>
			<td>".$request_description."</td>
			<td>".$request_date."</td>
			<td class='text-center'>".$status_description."</td>
			<td>".$resolved_date."</td>
			<td>".$request['remark']."</td>
			".$resolved_by."
		</tr>";
}

if($i == 0)
echo "<tr><td colspan='9' class='text-center text-danger bg-danger-subtle fw-semibold'>No Active Request Available</td></tr>";
?>

</tbody>
</table>
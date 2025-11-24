<div class="d-flex justify-content-between mb-2">
<h5>LAN Request List</h5>
</div>

<table class="table table-sm table-hover table-bordered fs-9">

<thead class="table-info text-center">
<tr>
<th>#</th>
<th>LAN</th>
<th>Request To</th>
<th>Date</th>
<th>Status</th>
<th>Resolved Date</th>
<th>Remark</th>
<th>By</th>
</tr>
</thead>

<tbody>

<?php
$i = 0;

while($request = mysqli_fetch_assoc($request_list))
{
	$i++;
	$resolved_date = '';
	$rowBgColorClass = 'bg-light-subtle';
	$status_description = "<button class='btn btn-sm btn-warning rounded rounded-5 p-2' data-bs-toggle='modal' data-bs-target='#updateLANRequestModal' onClick='setReqRefID(".$request['id'].",1)' title='Click to Close/Cancel Request'></button>";

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

	if($request['resolved_by'])
	$resolver_name = getFieldValue('name','id',str_replace('BS','',$request['resolved_by']),'staff_list',$con);
	else
	$resolver_name = "";

	echo "<tr class='".$rowBgColorClass."'>
			<td class='px-1'>".$i."</td>
			<td><a href='manage_lan.php?lan=".$request['request_for']."'>".$request['request_for']."</a></td>
			<td>".$request_description."</td>
			<td>".$request_date."</td>
			<td class='text-center'>".$status_description."</td>
			<td>".$resolved_date."</td>
			<td>".$request['remark']."</td>
			<td class='px-1'>".$resolver_name."</td>
		</tr>";
}

if($i == 0)
echo "<tr><td colspan='9' class='text-center text-danger bg-danger-subtle fw-semibold'>No Active Request Available</td></tr>";
?>

</tbody>
</table>

<?php
include_once("modals/updateLANRequestModal.php");
include_once("footer_copyright.php");
?>
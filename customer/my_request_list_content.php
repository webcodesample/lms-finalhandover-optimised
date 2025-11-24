<div class="d-flex justify-content-between mb-2">
<h5>My LAN Request List</h5>
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
</tr>
</thead>

<tbody>

<?php
$i = 0;

while($request = mysqli_fetch_assoc($request_list))
{
	$lan_crn = mysqli_fetch_assoc(mysqli_query($con,"SELECT crn FROM lan_audit_history AS LAH JOIN lrn_list AS LL ON LAH.lrn = LL.lrn WHERE LAH.lan = ".$request['request_for']))['crn'];

	if($lan_crn == str_replace('CR','',$_SESSION['user_ref_id']))
	{
		$i++;
		$resolved_date = '';
		$rowBgColorClass = 'bg-light-subtle';
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

		echo "<tr class='".$rowBgColorClass."'>
				<td class='px-1'>".$i."</td>
				<td><a href='view_lan.php?lan=".$request['request_for']."'>".$request['request_for']."</a></td>
				<td>".$request_description."</td>
				<td>".$request_date."</td>
				<td class='text-center'>".$status_description."</td>
				<td>".$resolved_date."</td>
				<td>".$request['remark']."</td>
			</tr>";
	}
}

if($i == 0)
echo "<tr><td colspan='9' class='text-center text-danger bg-danger-subtle fw-semibold'>No Active Request Available</td></tr>";
?>

</tbody>
</table>

<?php
include_once("footer_copyright.php");
?>
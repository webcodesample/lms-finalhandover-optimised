<table class="table table-sm table-hover table-bordered mt-3 mb-1 fs-9">

<thead>
	<tr class="table-info">
		<th>#</th>
		<th>LRN</th>
		<th>Product</th>
		<th>Created On</th>
		<th>Updated On</th>
		<th>Status</th>
	</tr>
</thead>

<tbody>

<?php
$i = 0;
$where_con_array = ['crn' => $_REQUEST['crn']];
$lrn_list = getRowsDataCon('lrn_list',$where_con_array,$con);

while($lrn = mysqli_fetch_assoc($lrn_list))
{
	$i++;
	$product = "Not Selected";
	$updation_datentime = getLatestUpdate('datentime','lrn',$lrn['lrn'],'lrn_audit_history',$con);
	$product_id = getLatestUpdate('product_id','lrn',$lrn['lrn'],'lrn_audit_history',$con);

	if($product_id > 0)
	$product = getFieldValue('description','id',$product_id,'product_list',$con);

	$status_id = getLatestUpdate('status_id','lrn',$lrn['lrn'],'lrn_audit_history',$con);
	$status = getFieldValue('description','id',$status_id,'lead_status_list',$con);

	echo "<tr>
			<td class='ps-2'>".$i."</td>
			<td><a href='../lrn_management/manage_lrn.php?lrn=".$lrn['lrn']."'>".$lrn['lrn']."</a></td>
			<td>".$product."</td>
			<td>".date('d-m-Y h:i:s A',$lrn['datentime'])."</td>
			<td>".date('d-m-Y h:i:s A',$updation_datentime)."</td>
			<td>".$status."</td>
		</tr>";
}

if($i == 0)
{
	echo "<tr><td colspan='6' class='text-center text-danger bg-danger-subtle fw-semibold'>No LRN Available</td></tr>";
}
?>
</tbody>
</table>
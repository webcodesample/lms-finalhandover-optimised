<?php
$i = 0;
$where_con_array = ['crn' => $_REQUEST['crn']];
$guarantor_list = getRowsDataCon('guarantor_list',$where_con_array,$con);

if(getRowCount('crn',$_REQUEST['crn'],'guarantor_list',$con) < 3)
{
?>
<div class="text-end">
<button type="button" class="btn btn-sm btn-subtle-info py-1 px-2" data-bs-toggle="modal" data-bs-target="#addGuarantor">Add Guarantor</button>
</div>
<?php } ?>

<table class="table table-sm table-hover table-bordered mt-3 mb-1 fs-9">

<thead>
	<tr class="table-info">
		<th>#</th>
		<th>Name</th>
		<th>Company</th>
		<th>Email</th>
		<th>Mobile</th>
		<th>Permanent Address</th>
		<th>Current Address</th>
		<th>Document</th>		
		<th>Action</th>
	</tr>
</thead>

<tbody>

<?php
while($guarantor = mysqli_fetch_assoc($guarantor_list))
{
	$i++;
	$primary_account = "";
	$deleteBtn = "";

	$guarantor_used_count = getRowCountDistinct('lrn','guarantor_id',$guarantor['id'],'lrn_audit_history',$con);

	if($guarantor_used_count == 0)
	$deleteBtn = "<a href='delete_crn_guarantor.php?guarantor=".$guarantor['id']."&crn=".$_REQUEST['crn']."'><img src='../portal-icons/delete.png' height='20px'></a>";

	$document_path = glob("../guarantor_documents/".$guarantor['document_title']."_".$guarantor['id'] . ".*");

	echo "<tr>
			<td class='ps-2'>".$i."</td>
			<td>".$guarantor['name']."</td>
			<td>".$guarantor['company']."</td>
			<td>".$guarantor['email']."</td>
			<td>".$guarantor['mobile']."</td>
			<td>".$guarantor['permanent_address']."</td>
			<td>".$guarantor['current_address']."</td>
			<td><a href='".$document_path[0]."' target='_blank'>".strtoupper($guarantor['document_title'])."</a></td>
			<td>".$deleteBtn."</td>
		</tr>";
}

if($i == 0)
{
	echo "<tr><td colspan='9' class='text-center text-danger bg-danger-subtle fw-semibold'>No Guarantor Added</td></tr>";
}
?>
</tbody>
</table>

<?php include_once("add_guarantor_modal.php") ?>
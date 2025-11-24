<div class="d-flex justify-content-between">
<h5>Campus Abroad Staff List</h5>
<a href="add_staff.php"><img src="../portal-icons/add.png" width="35px"></a>
</div>

<table class="table table-sm table-hover table-bordered table-striped fs-9">

<thead class="table-info text-center">
<tr>
<th>#</th>
<th>Name</th>
<th>Mobile</th>
<th>Email</th>
<th>Designation</th>
<th>Division</th>
<th>Role</th>
<th>Status</th>
<th>Action</th>
</tr>
</thead>

<tbody>

<?php
$i = 0;

while($staff = mysqli_fetch_assoc($result_staff_list))
{
	if($staff['role_type'] != 1 && $staff['role_type'] != 7 )
	{
		$i++;

		$staff_activity_count = getRowCount('activity_by','BS'.$staff['id'],'leads_activity_history',$con);
		$staff_upload_count =  getRowCount('upload_by','BS'.$staff['id'],'urn_document_upload_history',$con);

		echo "<tr>
			<td class='ps-2'>".$i."</td>
			<td>".ucwords($staff['name'])."</td>
			<td>".$staff['mobile']."</td>
			<td>".$staff['email']."</td>
			<td>".ucwords($staff['designation'])."</td>
			<td>".strtoupper($staff['division'])."</td>
			<td>".strtoupper(getFieldValue('description','id',$staff['role_type'],'login_type_list',$con))."</td>";

		if(getFieldValue('status','ref_id','BS'.$staff['id'],'login_detail',$con))
			echo "<td>Active</td>";
		else
			echo "<td>Inctive</td>";

		echo "<td nowrap>";
		echo "<a href='manage_staff.php?staff_id=".$staff['id']."'><img src='../portal-icons/edit.png' height='20px'></a>
			<a href='chat_history.php?chat_with=BS".$staff['id']."' target='_blank' class='mx-1'><span class='text-success' data-feather='message-circle' style='height: 20px; width: 20px;'></span></a>";

		if(getFieldValue('status','ref_id','BS'.$staff['id'],'login_detail',$con))
			echo "<a href='manage_staff_status.php?staff_id=".$staff['id']."&status=0'><span class='text-danger' data-feather='power' style='height: 18px; width: 18px;'></span></a>";
		else
			echo "<a href='manage_staff_status.php?staff_id=".$staff['id']."&status=1'><span class='text-success' data-feather='power' style='height: 18px; width: 18px;'></span></a>";

		if($staff_upload_count == 0 && $staff_activity_count == 0)
			echo "<a href='delete_staff.php?staff_id=".$staff['id']."'><img src='../portal-icons/delete.png' height='20px'></a>";

		echo "</td>
			</tr>";
	}
}
?>

</tbody>
</table>

<?php include_once("footer_copyright.php") ?>
<div class="d-flex justify-content-between mb-2">
<h5>User List</h5>
</div>

<table class="table table-sm table-hover table-bordered table-striped fs-9">

<thead class="table-info text-center">
<tr>
<th>#</th>
<th>Name</th>
<th>ID</th>
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
	$i++;

	$staff_activity_count = getRowCount('activity_by','BS'.$staff['id'],'lrn_activity_history',$con);
	$staff_upload_count =  getRowCount('upload_by','BS'.$staff['id'],'lrn_document_upload_history',$con);

	echo "<tr>
		<td class='ps-2'>".$i."</td>
		<td><a href='manage_staff.php?staff_id=".$staff['id']."' class='text-decoration-none link-primary'>".ucwords($staff['name'])."</a></td>
		<td><a href='manage_staff.php?staff_id=".$staff['id']."' class='text-decoration-none link-danger'>BS".$staff['id']."</a></td>
		<td>".$staff['mobile']."</td>
		<td>".$staff['email']."</td>
		<td>".ucwords($staff['designation'])."</td>
		<td>".strtoupper($staff['division'])."</td>
		<td>".strtoupper(getFieldValue('description','id',$staff['role_type'],'login_type_list',$con))."</td>";

	if(getFieldValue('status','ref_id','BS'.$staff['id'],'login_detail',$con))
		echo "<td>Active</td>";
	else
		echo "<td>Inactive</td>";

	echo "<td nowrap>";
	echo "<a href='staff_activity_history.php?id=".$staff['id']."' onclick='return makeConfirm(&quot;View ".$staff['name']." activity history&quot;)'><img src='../portal-icons/viewHistory.png' height='20px'></a>";
	echo "<a href='manage_staff.php?staff_id=".$staff['id']."' onclick='return makeConfirm(&quot;edit ".$staff['name']."&quot;)'><img src='../portal-icons/edit.png' height='20px'></a>";

	if(getFieldValue('status','ref_id','BS'.$staff['id'],'login_detail',$con))
		echo "<a href='manage_staff_status.php?staff_id=".$staff['id']."&status=0' onclick='return makeConfirm(&quot;deactivate ".ucwords($staff['name'])."&quot;)'><span class='text-danger' data-feather='power' style='height: 18px; width: 18px;'></span></a>";
	else
		echo "<a href='manage_staff_status.php?staff_id=".$staff['id']."&status=1' onclick='return makeConfirm(&quot;activate ".ucwords($staff['name'])."&quot;)'><span class='text-success' data-feather='power' style='height: 18px; width: 18px;'></span></a>";

	if($staff_upload_count == 0 && $staff_activity_count == 0)
		echo "<a href='delete_staff.php?staff_id=".$staff['id']."' onclick='return makeConfirm(&quot;delete ".$staff['name']."&quot;)'><img src='../portal-icons/delete.png' height='20px'></a>";

	echo "</td>
		</tr>";
}
?>

</tbody>
</table>

<?php include_once("footer_copyright.php") ?>
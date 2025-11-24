<div class="d-flex justify-content-between mb-3">
<h5>Create New Lead</h5>
<?php setGoBack('leads.php'); ?>
</div>

<?php
if(isset($_REQUEST['msg']) && $_REQUEST['msg'] == 'error')
echo "<center><h6 class='text-danger'>Data Already Exist</h6></center>";
else if(isset($_REQUEST['msg']) && $_REQUEST['msg'] == 'success')
echo "<center><h6 class='text-success'>Data Added</h6></center>";
?>

<form action="create_lead.php" method="post">

<div class="d-flex">
<input type="text" name="name" class="form-control form-control-sm m-1" style="width:200px;" placeholder="Student Name" required>
<input type="text" name="mobile" class="form-control form-control-sm m-1" style="width:200px;" placeholder="Student Mobile" required>
<input type="text" name="email" class="form-control form-control-sm m-1" style="width:200px;" placeholder="Student Email">
<input type="submit" value="Create Lead" class="btn btn-sm btn-primary m-1">
</div>

</form>

<table class="table table-sm table-bordered table-striped table-hover fs-9 mt-3">

<thead class="table-info text-center">
<th>#</th>
<th>Name</th>
<th>Mobile</th>
<th>Email</th>
<th>Create On</th>
<th>Created By</th>
<th>Creator Type</th>
<th>Action</th>
</thead>

<tbody>

<?php
$i = 0;
while($temp_lead = mysqli_fetch_assoc($tem_leads_list))
{
	$i++;
	echo "<tr>
		<td class='ps-2'>".$i."</td>
		<td>".$temp_lead['name']."</td>
		<td>".$temp_lead['mobile']."</td>
		<td>".$temp_lead['email']."</td>
		<td>".date('d-m-Y',$temp_lead['datentime'])."</td>
		<td>";
	if($temp_lead['creator_type'] == 1)
	echo getFieldValue('name','id',$temp_lead['creator_id'],'staff_list',$con);
	else if($temp_lead['creator_type'] == 4)
	echo getFieldValue('name','id',$temp_lead['creator_id'],'agent_list',$con);
	if($temp_lead['creator_type'] == 6)
	echo getFieldValue('name','id',$temp_lead['creator_id'],'sales_person_list',$con);

	echo "</td>
		<td>".strtoupper(getFieldValue('description','id',$temp_lead['creator_type'],'login_type_list',$con))."</td>
		<td nowrap>
		<a class='me-2' href='manage_temp_lead.php?id=".$temp_lead['id']."'><img src='../portal-icons/edit.png' height='20px'></a>
		<a class='me-2' href='delete_temp_lead.php?id=".$temp_lead['id']."'><img src='../portal-icons/delete.png' height='20px'></a>";

	if($temp_lead['email'])
	echo "<a href='create_urn.php?temp_lead_id=".$temp_lead['id']."' class='btn btn-sm btn-subtle-danger p-1 m-0'>Create URN</a>";

	echo "</td>
		</tr>";
}

if($i == 0)
{
	echo "<tr><th colspan='8' class='text-danger text-center'>No Data Available</th></tr>";
}
?>

</tbody>

</table>
<div class="d-flex justify-content-between mb-2">
<h5>Campus Abroad Staff List</h5>
<div class="d-flex">
<span class="text-danger mx-1" data-feather="search" style="height: 25px; width: 25px; cursor:hand;" onClick="searchToggle()"></span>
<a href="add_staff.php"><img src="../portal-icons/add.png" width="25px"></a>
</div>
</div>

<div class="d-flex mb-2">
<ul class="nav nav-underline fs-9">
	<li class="nav-item"><a class="nav-link <?=$all_staffs?>" href="staff_list.php">All (<?=$total_staff?>)</a></li>
	<li class="nav-item"><a class="nav-link <?=$active_staffs?>" href="staff_list.php?status=1">Active (<?=$total_staff_active?>)</a></li>
	<li class="nav-item"><a class="nav-link <?=$inactive_staffs?>" href="staff_list.php?status=0">Inactive (<?=$total_staff_inactive?>)</a></li>
</ul>
</div>

<div id="search_form" class="d-flex justify-content-between <?=$search_form_display_class?>">
<form method="post">
<div class="d-flex">
<input type="text" name="search_id" id="search_id" class="form-control form-control-sm m-1" style="width:150px;" placeholder="Search ID" value="<?=$search_id?>" onBlur="setSearchFlag(this.value)">
<input type="text" name="search_name" id="search_name" class="form-control form-control-sm m-1" style="width:150px;" placeholder="Search Name" value="<?=$search_name?>" onBlur="setSearchFlag(this.value)">
<input type="text" name="search_mobile" id="search_mobile" class="form-control form-control-sm m-1" style="width:150px;" placeholder="Search Mobile" value="<?=$search_mobile?>" onBlur="setSearchFlag(this.value)">
<input type="text" name="search_email" id="search_email" class="form-control form-control-sm m-1" style="width:150px;" placeholder="Search Email" value="<?=$search_email?>" onBlur="setSearchFlag(this.value)">
<select name="search_role" id="search_role" class="form-select form-select-sm m-1" style="width:110px;" onChange="setSearchFlag(this.value)">
<option value="">Role</option>
<?php
foreach($visible_role_type as $role_type)
{
	if($role_type == $search_role)
	echo "<option value='".$role_type."' selected>".getFieldValue('description','id',$role_type,'login_type_list',$con)."</option>";
	else
	echo "<option value='".$role_type."'>".getFieldValue('description','id',$role_type,'login_type_list',$con)."</option>";
}
?>
</select>
<input type="hidden" name="action_perform" value="search">
<input type="hidden" id="search_flag" value="0">
<button type="submit" onClick="return validateSearchForm()" class="btn btn-sm btn-subtle-danger m-1 px-2">
<span data-feather="search"></span>
</button>
<?=$clear_filter_btn?>
</div>
</form>
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

	$staff_activity_count = getRowCount('activity_by','BS'.$staff['id'],'leads_activity_history',$con);
	$staff_upload_count =  getRowCount('upload_by','BS'.$staff['id'],'urn_document_upload_history',$con);

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
	echo "<a href='manage_staff.php?staff_id=".$staff['id']."' onclick='return makeConfirm(&quot;edit ".$staff['name']."&quot;)'><img src='../portal-icons/edit.png' height='20px'></a>
		<a href='chat_history.php?chat_with=BS".$staff['id']."' target='_blank' class='mx-1' onclick='return makeConfirm(&quot;chat with ".ucwords($staff['name'])."&quot;)'><span class='text-success' data-feather='message-circle' style='height: 20px; width: 20px;'></span></a>";

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
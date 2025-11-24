<div class="d-flex justify-content-between mb-3">
<h5>Create New Lead</h5>
<div class="d-flex">
<button class="btn btn-transparent text-danger p-0 me-1" title="Show/Hide Search Section" onClick="searchToggle()"><span data-feather="search" style="width:25px; height:25px;"></span></button>
<?php setGoBack('leads.php'); ?>
</div>
</div>

<?php
if(isset($_REQUEST['msg']) && $_REQUEST['msg'] == 'error')
echo "<center><h6 class='text-danger'>Data Already Exist</h6></center>";
else if(isset($_REQUEST['msg']) && $_REQUEST['msg'] == 'success')
echo "<center><h6 class='text-success'>Data Added</h6></center>";
?>

<div id="search_form" class="d-flex justify-content-between <?=$search_form_display_class?>">
<form method="post">
<div class="d-flex">
<input type="text" name="search_name" id="search_name" class="form-control form-control-sm m-1" style="width:200px;" placeholder="Search Name" value="<?=$search_name?>" onBlur="setSearchFlag(this.value)">
<input type="text" name="search_mobile" id="search_mobile" class="form-control form-control-sm m-1" style="width:200px;" placeholder="Search Mobile" value="<?=$search_mobile?>" onBlur="setSearchFlag(this.value)">
<input type="text" name="search_email" id="search_email" class="form-control form-control-sm m-1" style="width:200px;" placeholder="Search Email" value="<?=$search_email?>" onBlur="setSearchFlag(this.value)">
<select name="search_source" id="search_source" class="form-select form-select-sm m-1" style="width:200px;" onChange="setSearchFlag(this.value)">
<option value="">Lead Source</option>
<?php
	$lead_sources = getRowsData('lead_sources_list',$con);
	while($source = mysqli_fetch_assoc($lead_sources))
	{
		if($source['id'] == $search_source)
		echo "<option value='".$source['id']."' selected>".ucwords($source['description'])."</option>";
		else
		echo "<option value='".$source['id']."'>".ucwords($source['description'])."</option>";
	}
?>
</select>
<input type="hidden" name="action_perform" value="search">
<input type="hidden" id="search_flag" value="0">
<button type="submit" title="Apply Filters" onClick="return validateSearchForm()" class="btn btn-sm btn-subtle-warning m-1 py-0 px-1">
<span data-feather="search" style="height:25px; width:25px;"></span>
</button>
<?=$clear_filter_btn?>
</div>
</form>
</div>

<div class="d-flex">
<form action="create_temp_lead.php" method="post">

<div class="d-flex">
<input type="text" name="name" class="form-control form-control-sm m-1" style="width:200px;" placeholder="Customer Name" required>
<input type="text" name="mobile" class="form-control form-control-sm m-1" style="width:200px;" placeholder="Customer Mobile" required>
<input type="text" name="email" class="form-control form-control-sm m-1" style="width:200px;" placeholder="Customer Email">
<select name="lead_source_id" class="form-select form-select-sm m-1" style="width:200px;" required>
<option value="">Lead Source</option>
<?php
	$lead_sources = getRowsData('lead_sources_list',$con);
	while($source = mysqli_fetch_assoc($lead_sources))
	{
		echo "<option value='".$source['id']."'>".ucwords($source['description'])."</option>";
	}
?>
</select>
<button value="Create" class="btn btn-sm btn-transparent m-1 p-0" title="Add New Lead">
<img src="../portal-icons/add-lead.png" height="27px">
</button>

</div>

</form>

<button class="btn btn-sm btn-subtle-success m-1 p-0" title="Import Leads" data-bs-toggle="modal" data-bs-target="#importLeads">
<img src="../portal-icons/xlsx.png" height="23px">
</button>
<a href="../sample_format/leads_sheet_format.xlsx" title="Sample Sheet" onClick="return confirm('Are you sure to download sample sheet?')" class="btn btn-sm btn-transparent m-1 p-0">
<img src="../portal-icons/sample.png" height="27px">
</a>
</div>

<table class="table table-sm table-bordered table-hover fs-9 mt-3">

<thead class="table-info text-center">
<th>#</th>
<th>Name</th>
<th>Mobile</th>
<th>Email</th>
<th>Create On</th>
<th>Created By</th>
<th>Creator Type</th>
<th>Source</th>
<th>Action</th>
</thead>

<tbody>

<?php
$i = 0;
while($temp_lead = mysqli_fetch_assoc($temp_leads_list))
{
	$i++;
	echo "<tr>
		<td class='ps-2'>".$i."</td>
		<td>".$temp_lead['name']."</td>
		<td>".$temp_lead['mobile']."</td>
		<td>".$temp_lead['email']."</td>
		<td>".date('d-m-Y',$temp_lead['datentime'])."</td>
		<td>";
	if($temp_lead['creator_type'] == 1 || $temp_lead['creator_type'] == 3 || $temp_lead['creator_type'] == 8)
	echo getFieldValue('name','id',$temp_lead['creator_id'],'staff_list',$con);
	else if($temp_lead['creator_type'] == 4)
	echo getFieldValue('name','id',$temp_lead['creator_id'],'agent_list',$con);
	if($temp_lead['creator_type'] == 6)
	echo getFieldValue('name','id',$temp_lead['creator_id'],'sales_person_list',$con);

	echo "</td>
		<td>".strtoupper(getFieldValue('description','id',$temp_lead['creator_type'],'login_type_list',$con))."</td>
		<td>".getFieldValue('description','id',$temp_lead['source_id'],'lead_sources_list',$con)."</td>
		<td nowrap>
		<a class='me-2' href='manage_temp_lead.php?id=".$temp_lead['id']."'><img src='../portal-icons/edit.png' height='20px'></a>
		<a class='me-1' href='delete_temp_lead.php?id=".$temp_lead['id']."'><img src='../portal-icons/delete.png' height='20px'></a>";

	if($temp_lead['mobile'])
	echo "<a class='btn btn-sm btn-subtle-light p-1 mx-1' onclick='return makeConfirm(&quot;call ".$temp_lead['mobile'].", this call will made by third party dialer&quot;)'><span class='text-success' data-feather='phone-call' style='height:15px; width:15px;'></span></a>";

	if($temp_lead['email'])
	{
		if(getRowCount('username',$temp_lead['email'],'login_detail',$con) > 0)
		echo "<a href='manage_temp_lead.php?id=".$temp_lead['id']."' class='ms-1' title='Change Email'><img src='../portal-icons/change-email.png' height='20px'></a>";
		else
		echo "<a href='create_crn.php?temp_lead_id=".$temp_lead['id']."' class='ms-1' title='Create Customer Profile'><img src='../portal-icons/add-crn.png' height='20px'></a>";
	}
	else
	echo "<a href='manage_temp_lead.php?id=".$temp_lead['id']."' class='ms-1' title='Add Email'><img src='../portal-icons/add-email.png' height='20px'></a>";

	echo "</td>
		</tr>";
}

if($i == 0)
{
	echo "<tr><th colspan='8' class='text-danger text-center'>No Lead Available</th></tr>";
}
?>

</tbody>

</table>

<?php include_once("import_leads_modal.php"); ?>

<?php include_once("footer_copyright.php"); ?>


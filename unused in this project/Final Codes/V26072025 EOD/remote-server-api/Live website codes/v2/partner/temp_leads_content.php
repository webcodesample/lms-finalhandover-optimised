<div class="d-flex justify-content-between mb-3">
<h5>Create New Lead</h5>
<div class="d-flex">
<span class="text-danger m-1" data-feather="search" style="height: 25px; width: 25px; cursor:hand;" onClick="searchToggle()"></span>
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
<input type="text" name="search_name" id="search_name" class="form-control form-control-sm m-1" style="width:200px;" placeholder="Search Name" value="<?=$search_name?>">
<input type="text" name="search_mobile" id="search_mobile" class="form-control form-control-sm m-1" style="width:200px;" placeholder="Search Mobile" value="<?=$search_mobile?>">
<input type="text" name="search_email" id="search_email" class="form-control form-control-sm m-1" style="width:200px;" placeholder="Search Email" value="<?=$search_email?>">
<select name="search_source" id="search_source" class="form-select form-select-sm m-1" style="width:200px;">
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
<button type="submit" onClick="return validateSearchForm()" class="btn btn-sm btn-subtle-danger m-1 px-2">
<span data-feather="search"></span>
</button>
<?=$clear_filter_btn?>
</div>
</form>
</div>

<div class="d-flex justify-content-between">
<form action="create_temp_lead.php" method="post">

<div class="d-flex">
<input type="text" name="name" class="form-control form-control-sm m-1" style="width:200px;" placeholder="Student Name" required>
<input type="text" name="mobile" class="form-control form-control-sm m-1" style="width:200px;" placeholder="Student Mobile" required>
<input type="text" name="email" class="form-control form-control-sm m-1" style="width:200px;" placeholder="Student Email">
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
<input type="submit" value="Create" class="btn btn-sm btn-primary m-1">

</div>

</form>

<button class="btn btn-sm btn-subtle-success m-1" data-bs-toggle="modal" data-bs-target="#importLeads">Import</button>
<a href="../sample_format/leads_sheet_format.xlsx" class="btn btn-sm btn-subtle-warning m-1 text-nowrap px-2">Sample Sheet</a>
</div>

<table class="table table-sm table-bordered table-striped table-hover fs-9 mt-3">

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

<?php include_once("import_leads_modal.php"); ?>
<?php include_once("footer_copyright.php"); ?>

<script src="../js/tempLeads.js"></script>
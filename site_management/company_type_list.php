<?php
$result_company_type_list = getRowsData('company_type_list',$con);
?>
<div class="d-flex justify-content-end">
<img src="../portal-icons/add.png" width="30px" onclick="showAddDiv()">
</div>

<div id="add_div" style="display:none;">
<form action="add_company_type.php" method="post">
<div class="d-flex">
<input type="text" class="form-control form-control-sm m-1" style="width:200px;" name="company_type" placeholder="Company Type Description" required>
<input type="submit" value="Add Company Type" onClick="return makeConfirm('add new company type in list')" class="btn btn-primary btn-sm m-1">
</div>
</form>
</div>

<div id="edit_div" style="display:none;">
<form action="update_predefined_document.php" method="post">
<input type="hidden" name="document_id" id="document_id">
<div class="d-flex">
<input type="text" disabled class="form-control form-control-sm m-1" style="width:200px;" id="selected_document_id">
<input type="text" class="form-control form-control-sm m-1" style="width:200px;" name="document_name" id="document_name" placeholder="Document Name" required>
<input type="text" class="form-control form-control-sm m-1" style="width:200px;" name="upload_file_name" id="upload_file_name" placeholder="Upload Name" required>
<select name="is_required" class="form-select form-select-sm m-1" style="width:110px;">
<option value="0">Optional</option>
<option value="1">Mandatory</option>
</select>
<input type="submit" value="Update Document" onClick="return makeConfirm('update')" class="btn btn-primary btn-sm m-1">
</div>
</form>
</div>

<table class="table table-sm table-bordered table-striped table-hover fs-9">

<thead class="table-info text-center">
<th>#</th>
<th>Description</th>
</thead>
<tbody>

<?php
$i = 0;
while($company_type = mysqli_fetch_assoc($result_company_type_list))
{
	$i++;

	echo "<tr>
		<td class='px-2'>".$i."</td>
		<td>".$company_type['description']."</td>
		</tr>";
}
?>

</tbody>
</table>
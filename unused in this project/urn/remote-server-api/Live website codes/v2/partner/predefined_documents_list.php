<?php
$result_document_list = getRowsData('document_list',$con);
?>
<div class="d-flex justify-content-end">
<img src="../portal-icons/add.png" width="30px" onclick="showAddDiv()">
</div>

<div id="add_div" style="display:none;">
<form action="add_predefined_document.php" method="post">
<div class="d-flex">
<input type="text" class="form-control form-control-sm m-1" style="width:200px;" name="document_name" placeholder="Document Name" required>
<input type="text" class="form-control form-control-sm m-1" style="width:200px;" name="upload_file_name" placeholder="Upload Name" required>
<input type="submit" value="Add Document" class="btn btn-primary btn-sm m-1">
</div>
</form>
</div>

<div id="edit_div" style="display:none;">
<form action="update_predefined_document.php" method="post">
<input type="hidden" name="document_id" id="document_id">
<div class="d-flex">
<input type="text" disabled class="form-control form-control-sm m-1" style="width:200px;" id="selected_document_id">
<input type="text" class="form-control form-control-sm m-1" style="width:200px;" name="document_name" id="document_name" placeholder="Document Name" required>
<input type="text" class="form-control form-control-sm m-1" style="width:200px;" name="upload_file_name"id="upload_file_name" placeholder="Upload Name" required>
<input type="submit" value="Update Document" class="btn btn-primary btn-sm m-1">
</div>
</form>
</div>

<table class="table table-sm table-bordered table-striped table-hover fs-9">

<thead class="table-info text-center">
<td>ID</td>
<td>Name</td>
<td>Upload File Name</td>
<td>Action</td>
</thead>
<tbody>

<?php
$i = 0;
while($document = mysqli_fetch_assoc($result_document_list))
{
	$i++;

	


	echo "<tr>
		<td>".$document['id']."</td>
		<td>".$document['name']."</td>
		<td>".$document['uploaded_file_name']."</td>
		<td>";

	if($document['name'] != 'Student Photo' && $document['uploaded_file_name'] != 'student_photo')
		echo "<img src='../portal-icons/edit.png' height='20px' onClick='showEditDiv(".$document['id'].",&quot;".$document['name']."&quot;,&quot;".$document['uploaded_file_name']."&quot;)'>
		<a href='delete_predefined_document.php?id=".$document['id']."'><img src='../portal-icons/delete.png' height='20px'></a>";

	echo "</td>
		</tr>";
}
?>

</tbody>
</table>
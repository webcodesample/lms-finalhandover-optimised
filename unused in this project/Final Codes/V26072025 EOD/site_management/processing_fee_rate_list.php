<?php
$result_processing_charges_list = getRowsData('processing_charges_list',$con);
?>
<div class="d-flex justify-content-end">
<img src="../portal-icons/add.png" width="30px" onclick="showAddDiv()">
</div>

<div id="add_div" style="display:none;">
<form action="add_processing_charge.php" method="post">
<div class="d-flex">
<input type="text" class="form-control form-control-sm m-1 w-auto" style="width:200px;" name="description" placeholder="Processing Charge Description" required>
<input type="text" class="form-control form-control-sm m-1 w-auto" style="width:200px;" name="percentage" placeholder="Percentage" required>
<input type="submit" value="Add Processing Cahrge" onClick="return makeConfirm('add new processing charge in list')" class="btn btn-primary btn-sm m-1">
</div>
</form>
</div>

<div id="edit_div" style="display:none;">
<form action="update_processing_charge.php" method="post">
<input type="hidden" name="id" id="document_id">
<div class="d-flex">
<input type="text" class="form-control form-control-sm m-1 w-auto" style="width:200px;" name="description" id="document_name" placeholder="Processing Charge Description" readonly>
<input type="text" class="form-control form-control-sm m-1 w-auto" style="width:200px;" name="percentage" placeholder="Percentage" required>
<input type="submit" value="Update Processing Charge" onClick="return makeConfirm('update processing charge rate')" class="btn btn-primary btn-sm m-1">
</div>
</form>
</div>

<table class="table table-sm table-bordered table-striped table-hover fs-9">

<thead class="table-info text-center">
<th>#</th>
<th>Description</th>
<th>Percentage</th>
<th>Action</th>
</thead>
<tbody>

<?php
$i = 0;
while($processing_charge = mysqli_fetch_assoc($result_processing_charges_list))
{
	$i++;

	echo "<tr>
		<td class='px-2'>".$i."</td>
		<td>".$processing_charge['description']."</td>
		<td>".$processing_charge['percentage']." %</td>
		<td><img src='../portal-icons/edit.png' height='20px' onClick='showEditDiv(".$processing_charge['id'].",&quot;".$processing_charge['description']."&quot;)'></td>
		</tr>";
}
?>

</tbody>
</table>
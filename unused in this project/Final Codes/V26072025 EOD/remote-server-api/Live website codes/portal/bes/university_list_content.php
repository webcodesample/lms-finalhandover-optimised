<div class="d-flex justify-content-between">
<h5>Campus Abroad Partner Universities</h5>
<div>
<a href="add_university.php"><img src="../portal-icons/add.png" width="35px"></a>
<!--<button class="btn btn-sm btn-subtle-success m-1" data-bs-toggle="modal" data-bs-target="#importUniversity">Import</button>
<a href="../sample_format/university_sheet_format.xlsx" class="btn btn-sm btn-subtle-warning m-1">Sample Sheet</a>-->
</div>
</div>
<center>
<table class="table table-sm table-bordered table-hover table-striped fs-9">

<thead class="table-info text-center">
<tr>
<th>#</th>
<th>Name</th>
<th>Region</th>
<th>Country</th>
<th colspan="2" align="center">Action</th>
</tr>
</thead>

<tbody>
<?php
$i = 0;
while($university = mysqli_fetch_assoc($view_result))
{
	$i++;
	echo "<tr>
		<td class='ps-2'>".$i."</td>
		<td>".strtoupper($university['name'])."</td>
		<td>".strtoupper($university['region'])."</td>
		<td>".strtoupper(getFieldValue('name','id',$university['country_id'],'country_list',$con))."</td>
		<td>
		<a href='edit_university.php?id=".$university['id']."'><img src='../portal-icons/edit.png' height='20px'></a>
		<a href='delete_university.php?id=".$university['id']."'><img src='../portal-icons/delete.png' height='20px'></a>
		</td>
		</tr>";
}
?>
</tbody>
</table>
</center>
<?php include_once("footer_copyright.php") ?>
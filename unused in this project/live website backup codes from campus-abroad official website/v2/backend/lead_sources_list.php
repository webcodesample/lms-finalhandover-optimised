<?php
$result_source_list = getRowsData('lead_sources_list',$con);
?>

<div class="d-flex justify-content-end">
<a href="add_lead_source.php"><img src="../portal-icons/add.png" height="35px"></a>
</div>

<table class="table table-sm table-bordered table-striped table-hover fs-9 mt-2">

<thead class="table-info text-center fw-bolder">
<td>#</td>
<th>Description</th>
<th>Created On</th>
<th>Action</th>
</thead>
<tbody>

<?php
$i = 0;
while($lead_source = mysqli_fetch_assoc($result_source_list))
{	
	$i++;
	echo "<tr>
		<td class='ps-2'>".$i."</td>	
		<td>".$lead_source['description']."</td>
		<td>".date('d-m-Y',$lead_source['datentime'])."</td>
		<td nowrap>
		<img src='../portal-icons/edit.png' height='20px'>
		<img src='../portal-icons/delete.png' height='20px'>
		</td>
		</tr>";
}
?>

</tbody>
</table>
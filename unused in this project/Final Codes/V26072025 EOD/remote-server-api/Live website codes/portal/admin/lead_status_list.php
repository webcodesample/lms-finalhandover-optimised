<?php
$result_status_list = getRowsData('lead_status_list',$con);
?>

<div class="d-flex justify-content-end">
<a href="add_lead_status_batch.php"><img src="../portal-icons/add.png" height="35px"></a>
</div>

<table class="table table-sm table-bordered table-striped table-hover fs-9 mt-2">

<thead class="table-info text-center">
<td>id</td>
<td>Description</td>
<td>Order</td>
<td>Batch ID</td>
<td>Created On</td>
</thead>
<tbody>

<?php
$i = 0;
while($status_list = mysqli_fetch_assoc($result_status_list))
{	
	if($status_list['step_order']<50)
	{
		$i++;
		echo "<tr>
			<td>".$i."</td>	
			<td>".$status_list['description']."</td>
			<td>".$status_list['step_order']."</td>
			<td>B".$status_list['batch_id']."</td>
			<td>".date('d-m-Y',$status_list['datentime'])."</td>
			</tr>";
	}
}
?>

</tbody>
</table>
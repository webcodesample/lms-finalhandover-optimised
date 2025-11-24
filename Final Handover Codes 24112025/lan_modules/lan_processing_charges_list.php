<?php
$where_clause = "WHERE lan = ".$_REQUEST['lan'];

$query_pc_list = "SELECT * FROM lan_processing_charges_list ".$where_clause." ORDER BY applied_on DESC";
$result_pc_list = mysqli_query($con, $query_pc_list);
?>

<table class="table table-sm table-light table-bordered table-hover fs-9 mb-0">

<thead class="table-info text-center sticky-top">
<tr>
<th>#</th>
<th>Date & Time</th>
<th>Remark</th>
<th>Amount</th>
<th>Action</th>
</tr>
</thead>
<tbody>

<?php
$i = 0;
while($pc = mysqli_fetch_assoc($result_pc_list))
{
	$i++;
	$waiver_btn = "<a class='btn btn-sm btn-outline-primary px-1 py-0' href='applyWaiver.php?lan=".$_REQUEST['lan']."&id=".$pc['id']."&amount=".$pc['amount']."'>Apply Waiver</a>";
	$row_bg_class = "";

	if($pc['status'])
	{
		$waiver_btn = "Waiver Applied";
		$row_bg_class = "class='table-danger'";
	}

	echo "<tr ".$row_bg_class.">
		<td class='ps-2'>".$i."</td>
		<td>".date('d-m-Y',$pc['applied_on'])."</td>
		<td>".$pc['remark']."</td>
		<td>".$pc['amount']."</td>
		<td>".$waiver_btn."</td>
		</tr>";
}
?>

</tbody>
</table>
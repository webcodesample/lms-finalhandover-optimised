<div class="d-flex justify-content-between mb-2">
<h5>Dispatch List</h5>
<?php
if(mysqli_num_rows($dispatch_list)>0)
echo '<button class="btn btn-sm btn-subtle-success" data-bs-toggle="modal" data-bs-target="#importBankSheet">Import Bank Sheet</button>';
?>
</div>

<table class="table table-sm table-hover table-bordered fs-9">

<thead class="table-info text-center">
<tr>
<th>#</th>
<th>Approval Date</th>
<th>LAN Count</th>
<th>Action</th>
</tr>
</thead>

<tbody>

<?php
$i = 0;

while($dispatch_info = mysqli_fetch_assoc($dispatch_list))
{
	$i++;

	$date = date('d-m-Y',$dispatch_info['approval_date']);

	echo "<tr>
		<td class='px-1'>".$i."</td>
		<td>".$date."</td>
		<td>".$dispatch_info['lan_count']."</td>	
		<td><a href='datewise_dispatch_list.php?date=".$date."'>View List</a></td>	
		</tr>";
}

if($i == 0)
echo "<tr><td colspan='9' class='text-center text-danger bg-danger-subtle fw-semibold'>No LAN Available for dispatch</td></tr>";
?>

</tbody>
</table>

<?php
include_once("modals/importBankSheetModal.php");
include_once("footer_copyright.php");
?>
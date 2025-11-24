<h5 class="mb-3">Callback List</h5>

<div class="d-flex mb-3">
	<ul class="nav nav-underline fs-9">
		<li class="nav-item"><a href="callback_list.php" class="nav-link <?=$all_callback?>">All (<?=$callback_count?>)</a></li>
		<li class="nav-item"><a href="callback_list.php?tab=past" class="nav-link <?=$past_callback?>">Past (<?=$past_callback_count?>)</a></li>
		<li class="nav-item"><a href="callback_list.php?tab=today" class="nav-link <?=$today_callback?>">Today (<?=$today_callback_count?>)</a></li>
		<li class="nav-item"><a href="callback_list.php?tab=future" class="nav-link <?=$future_callback?>">Future (<?=$future_callback_count?>)</a></li>
	</ul>
</div>

<table class="table table-sm table-striped table-bordered table-hover fs-9">

<thead class="table-info text-center">
<th>#</th>
<th>URN</th>
<th>Name</th>
<th>Mobile</th>
<th>Callback Date & Time</th>
<th>Previous Remark</th>
<th>Action</th>
</thead>

<tbody>

<?php
$i = 0;
while($callback = mysqli_fetch_assoc($callback_list))
{
	$i++;

	echo "<tr>
		<td class='ps-2'>".$i."</td>";
	
	$student_id = getFieldValue('student_id','id',$callback['lead_id'],'leads_details',$con);
	$where_con_array = [ 'id' => $student_id];
	$student = mysqli_fetch_assoc(getRowsDataCon('students',$where_con_array,$con));

	echo "<td>CA".getFieldValue('urn','id',$callback['lead_id'],'leads_details',$con)."</td>
		<td>".$student['name']."</td>
		<td>".$student['mobile']."</td>";

	echo "<td>".date('d-m-Y h:i A',$callback['callback_datentime'])."</td>
		<td>".$callback['prev_remark']."</td>
		<td nowrap>";
	if($callback['callback_datentime'] > strtotime('today'))
		echo "<a href='#'><span class='text-danger' data-feather='phone-call' style='height: 15px; width: 15px;'></span></a>";

	echo "</td>
		</tr>";
}
?>

</tbody>

</table>

<?php include_once("footer_copyright.php") ?>
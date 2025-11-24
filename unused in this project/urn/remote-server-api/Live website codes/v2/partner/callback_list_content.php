<h5 class="mb-3">Callback List</h5>

<div class="d-flex mb-3">
	<ul class="nav nav-underline fs-9">
		<li class="nav-item"><a href="callback_list.php" class="nav-link <?=$all_callback?>">All (<?=$callback_count?>)</a></li>
		<li class="nav-item"><a href="callback_list.php?tab=past" class="nav-link <?=$past_callback?>">Past (<?=$past_callback_count?>)</a></li>
		<li class="nav-item"><a href="callback_list.php?tab=today" class="nav-link <?=$today_callback?>">Today (<?=$today_callback_count?>)</a></li>
		<li class="nav-item"><a href="callback_list.php?tab=future" class="nav-link <?=$future_callback?>">Future (<?=$future_callback_count?>)</a></li>
	</ul>
</div>

<table class="table table-sm table-bordered table-hover fs-9">

<thead class="table-info text-center">
<th>#</th>
<th>URN</th>
<th>Name</th>
<th>Mobile</th>
<th nowrap>Callback Date & Time</th>
<th nowrap>Previous Remark</th>
<th>Status</th>
<th nowrap>Call Remark</th>
<th nowrap>Updated By</th>
<th nowrap>Updated On</th>
<th>Action</th>
</thead>

<tbody>

<?php
$i = 0;
while($callback = mysqli_fetch_assoc($callback_list))
{
	$i++;

	if($callback['updated_by'])
		$callback_status_updated_by = "<span class='text-danger'>".$callback['updated_by']." - </span>".strtoupper(getFieldValue('name','id',substr($callback['updated_by'],2),$_SESSION['user_table'],$con));
	else
		$callback_status_updated_by = "";

	if($callback['updation_datentime']>0)
		$callback_status_updated_on = "<span class='text-info'>".date('d-m-Y h:i:s A',$callback['updation_datentime'])."</span>";
	else
		$callback_status_updated_on = "";

	if($callback['status'] == 0 && $callback['callback_datentime'] < strtotime('now'))
		$callback_status_description = "<span class='text-danger'>Due</span>";
	else if($callback['status'] == 0 && $callback['callback_datentime'] > strtotime('now'))
		$callback_status_description = "<span class='text-success'>Scheduled</span>";
	else if($callback['status'] == 1)
		$callback_status_description = "<span class='text-info'>Updated</span>";

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
		<td>".$callback_status_description."</td>
		<td>".$callback['call_remark']."</td>
		<td>".$callback_status_updated_by."</td>
		<td nowrap>".$callback_status_updated_on."</td>
		<td nowrap>";

	if($callback['callback_datentime'] > strtotime('now') && ($callback['callback_datentime']-600) < strtotime('now'))
		echo "<a href='#' class='mx-1'><span class='text-danger' data-feather='phone-call' style='height: 15px; width: 15px;'></span></a>";
	
	if($callback['hold_by'] == '' || $callback['hold_by'] == $_SESSION['user_ref_id'])
	{
		if($callback['callback_datentime'] < strtotime('now') && ($callback['callback_datentime']+600) > strtotime('now'))
		echo "<a href='add_callback_holder.php?callback_id=".$callback['callback_id']."' class='mx-1'><span class='text-success' data-feather='edit' style='height: 15px; width: 15px;'></span></a>";
	}

	echo "</td>
		</tr>";
}
?>

</tbody>

</table>

<?php include_once("footer_copyright.php") ?>
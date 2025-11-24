<?php
$where_con = [
			'lead_id' => $_REQUEST['lead_id'],
		];

$query_view_lead_history = "SELECT * FROM leads_activity_history".setWhereClause($where_con)." ORDER BY datentime DESC";
$result_view_lead_history = mysqli_query($con, $query_view_lead_history);

if(in_array($_SESSION['login_type'],array(1,2,3,8,4,6)))
	$thead_column = "<th>Activity By</th>";
else
	$thead_column = "";
?>

<table class="table table-sm table-light table-bordered table-hover fs-9">

<thead class="table-info text-center">
<tr>
<th>Date & Time</th>
<th>Activity Comment</th>
<th>Status</th>
<?=$thead_column?>
</tr>
</thead>
<tbody>

<?php
while($lead = mysqli_fetch_assoc($result_view_lead_history))
{
	if($lead['activity_by'] == 'Portal Visitor')
		$commented_by = ucwords($lead['activity_by']);
	else
	{
		$table = getTablename($lead['activity_by']);
		$commented_by = ucwords($lead['activity_by'])." <span class='text-primary'>(".getFieldValue('name','id',substr($lead['activity_by'],2),$table,$con).")</span>";
	}

	if(in_array($_SESSION['login_type'],array(1,2,3,8,4,6)))
		$trow_column = "<td>".$commented_by."</td>";
	else
		$trow_column = "";

	echo "<tr>
		<td class='ps-2'>".date('d-M-Y h:i:s A',$lead['datentime'])."</td>
		<td>".ucfirst($lead['comment'])."</td>
		<td>".strtoupper(getFieldValue('description','id',$lead['status_id'],'lead_status_list',$con))."</td>"
		.$trow_column.
		"</tr>";
}
?>

</tbody>
</table>
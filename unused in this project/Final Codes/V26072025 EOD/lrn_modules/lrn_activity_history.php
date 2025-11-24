<?php
$where_con = ['lrn' => $_REQUEST['lrn'],];

$query_view_lrn_history = "SELECT * FROM lrn_activity_history".setWhereClause($where_con)." ORDER BY datentime DESC";
$result_view_lrn_history = mysqli_query($con, $query_view_lrn_history);

if(in_array($_SESSION['login_type'],array(1,2,3,8,4,6)))
	$thead_column = "<th>Activity By</th>";
else
	$thead_column = "";
?>

<table class="table table-sm table-light table-bordered table-hover fs-9 mb-1">

<thead class="table-info text-center sticky-top">
<tr>
<th>Date & Time</th>
<th>Activity Remark</th>
<th>Status</th>
<?=$thead_column?>
</tr>
</thead>
<tbody>

<?php
while($lrn_history = mysqli_fetch_assoc($result_view_lrn_history))
{
	if($lrn_history['activity_by'] == 'Portal Visitor')
		$commented_by = ucwords($lrn_history['activity_by']);
	else
	{
		$table = getTablename($lrn_history['activity_by']);
		$commented_by = ucwords($lrn_history['activity_by'])." <span class='text-primary'>(".getFieldValue('name','id',substr($lrn_history['activity_by'],2),$table,$con).")</span>";
	}

	if(in_array($_SESSION['login_type'],array(1,2,3,8,4,6)))
		$trow_column = "<td class='px-1'>".$commented_by."</td>";
	else
		$trow_column = "";

	echo "<tr>
		<td class='ps-2'>".date('d-M-Y h:i:s A',$lrn_history['datentime'])."</td>
		<td>".ucfirst($lrn_history['comment'])."</td>
		<td>".strtoupper(getFieldValue('description','id',$lrn_history['status_id'],'lead_status_list',$con))."</td>"
		.$trow_column.
		"</tr>";
}
?>

</tbody>
</table>
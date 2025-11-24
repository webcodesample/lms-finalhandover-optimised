<div class="d-flex justify-content-between mb-2">
<h5>Active LAN List</h5>
</div>

<table class="table table-sm table-hover table-bordered fs-9">

<thead class="table-info text-center">
<tr>
<th>#</th>
<th>LAN</th>
<th>LRN</th>
<th>CRN</th>
<th>Name</th>
<th>Start Date</th>
<th>Next Due Date</th>
<th>Tenure</th>
<th>Final Due Date</th>
<th>Amount</th>
</tr>
</thead>

<tbody>

<?php
$i = 0;

while($lan = mysqli_fetch_assoc($lan_list))
{
	$i++;

	$crn = getFieldValue('crn','lrn',$lan['lrn'],'lrn_list',$con);
	$lan_approval_date = date('d-m-Y',getFieldValue('approval_date','lan',$lan['lan'],'dispatch_list',$con));

	$date = date('d-m-Y',$lan['approval_date']);
	$lan_data = getLatestUpdateRow('lan',$lan['lan'],'lan_audit_history',$con);

	if($lan_data['cust_type'] == 1)
	$name = $lan_data['name'];
	else
	$name = $lan_data['company_name'];

	$tenure_type = str_replace('ly','s',$lan_data['payment_frequency']);
	$loan_tenure = $lan_data['loan_tenure']." ".$tenure_type;

	$next_due_date_gap = 1;

	if($tenure_type == 'Quarters')
	{
		$lan_data['loan_tenure'] *= 3;
		$tenure_type = 'months';
		$next_due_date_gap = 3;
	}	
	
	$next_due_date_ts = setDueDate($lan_approval_date,$next_due_date_gap,$tenure_type); //strtotime($lan_approval_date.'+'.$next_due_date_gap.$tenure_type);
	$final_due_date_ts = strtotime($lan_approval_date.'+'.$lan_data['loan_tenure'].$tenure_type);

	$next_due_date = date('d-m-Y',$next_due_date_ts);
	$final_due_date = date('d-m-Y',$final_due_date_ts);

	echo "<tr>
		<td class='px-1'>".$i."</td>
		<td><a href='manage_lan.php?lan=".$lan_data['lan']."'>".$lan_data['lan']."</a></td>
		<td><a href='../lrn_management/manage_lrn.php?lrn=".$lan_data['lrn']."'>".$lan_data['lrn']."</a></td>
		<td><a href='../crn_management/manage_crn.php?crn=".$crn."'>".$crn."</td>
		<td>".$name."</td>
		<td>".$lan_approval_date."</td>
		<td>".$next_due_date."</td>
		<td>".$loan_tenure."</td>
		<td>".$final_due_date."</td>
		<td>".$lan_data['approved_loan_amount']."</td>
		</tr>";
}

if($i == 0)
echo "<tr><td colspan='9' class='text-center text-danger bg-danger-subtle fw-semibold'>No Active LAN Available</td></tr>";

function setDueDate($approval_date,$gap,$gap_type)
{
	$due_date_ts = strtotime($approval_date.'+'.$gap.$gap_type);

	if($due_date_ts > strtotime('today'))
	return $due_date_ts;
	else
	return setDueDate(date('d-m-Y',$due_date_ts),$gap,$gap_type);
}
?>

</tbody>
</table>

<?php
include_once("footer_copyright.php");
?>
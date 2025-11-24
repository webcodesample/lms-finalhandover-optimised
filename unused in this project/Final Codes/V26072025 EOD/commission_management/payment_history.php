<?php
if(isset($_REQUEST['search_filter']) && $_REQUEST['search_filter'])
$search_filter = $_REQUEST['search_filter'];
else
$search_filter = "";

$sa_checked = "";
$sp_checked = "";
$sa_input_display = "d-none";
$sp_input_display = "d-none";
$sa_input_disable = "disabled";
$sp_input_disable = "disabled";
$sa_input_value = "";
$sp_input_value = "";

if(isset($_REQUEST['filter_type']) && $_REQUEST['filter_type'] == 'SA')
{
	$sa_input_display = "";
	$sa_input_disable = "";
	$sa_input_value = $search_filter;
	$sa_checked = "checked";
}
else if(isset($_REQUEST['filter_type']) && $_REQUEST['filter_type'] == 'SP')
{
	$sp_input_display = "";
	$sp_input_disable = "";
	$sp_input_value = $search_filter;
	$sp_checked = "checked";
}
?>

<form method="post">
<div class="d-flex">
<input type="radio" name="filter_type" class="m-1" value="SA" <?=$sa_checked?> onClick="setSearchID(this.value)" required><span class="text-primary mt-2 me-2">Sales Agent</span>
<input type="radio" name="filter_type" class="m-1" value="SP" <?=$sp_checked?> onClick="setSearchID(this.value)" required><span class="text-primary mt-2 me-2">Sales Person</span>
<input type="text" name="search_filter" id="agent" class="form-control form-control-sm m-1 <?=$sa_input_display?>" placeholder="Agent Name" style="width:250px;" value="<?=$sa_input_value?>" <?=$sa_input_disable?> required>
<input type="text" name="search_filter" id="sales_person" class="form-control form-control-sm m-1 <?=$sp_input_display?>" placeholder="Sale Person Name" style="width:250px;" value="<?=$sp_input_value?>" <?=$sp_input_disable?> required>
<button type="submit" class="btn btn-sm btn-subtle-danger m-1 p-1">
<span class="text-danger" data-feather="search" style="height: 20px; width: 20px;"></span>
</button>
</div>
</form>

<table class="table table-sm table-bordered table-striped table-hover fs-9">

<thead class="table-info text-center">
<th>#</th>
<th>URN</th>
<th>Student Name</th>
<th>URN Fee</th>
<th>Paid To</th>
<th>Commission Amount</th>
<th>Transaction ID</th>
<th>Date & Time</th>
<th>Status/Remark</th>
</thead>

<tbody>

<?php
if(isset($_REQUEST['search_filter']) && $_REQUEST['search_filter'])
{
	$search_filter_array = explode(' - ',$_REQUEST['search_filter']);
	$search_filter_val = $_REQUEST['filter_type'].$search_filter_array[0];
	$where_con_array = [ 'comission_paid_to' => $search_filter_val,];
	$payment_list = getRowsDataCon('comission_paid_history',$where_con_array,$con);
}
else
{
	$payment_list = getRowsData('comission_paid_history',$con);
}

$i = 0;
while($payment = mysqli_fetch_assoc($payment_list))
{
	$i++;

	if($payment['comission_paid'])
		$comission_status = "<span class='text-success'>Transfer To Wallet</span>";
	else
		$comission_status = "<span class='text-danger'>Pending</span>";

	if(substr($payment['comission_paid_to'],0,2) == "SA")
	{
		$comission_paid_to = getFieldValue('name','id',substr($payment['comission_paid_to'],2),'agent_list',$con);
		$go_to_wallet_link = "../agent_management/manage_agent.php?agent_id=".substr($payment['comission_paid_to'],2)."&tab=ledger";
	}
	else if(substr($payment['comission_paid_to'],0,2) == "SP")
	{
		$comission_paid_to = getFieldValue('name','id',substr($payment['comission_paid_to'],2),'sales_person_list',$con);
		$go_to_wallet_link = "../sales_person_management/manage_sales_person.php?sales_person_id=".substr($payment['comission_paid_to'],2)."&tab=ledger";
	}


	$urn_student_name = getLatestUpdate('student_name','lead_id',$payment['lead_id'],'urn_audit_history',$con);

	echo "<tr>
		<td class='ps-2'>".$i."</td>
		<td>".getFieldValue('urn','id',$payment['lead_id'],'leads_details',$con)."</td>
		<td>".$urn_student_name."</td>
		<td>".$payment['lead_amount']."</td>
		<td><a href='".$go_to_wallet_link."' class='text-decoration-none'>
		<span class='text-primary'>".$payment['comission_paid_to']."</span> - <span class='text-success'>".$comission_paid_to."</span>
		</a></td>
		<td>".$payment['comission_amount']."</td>
		<td><a href='".$go_to_wallet_link."' class='link-success text-decoration-none'>".$payment['transaction_id']."</a></td>
		<td>".date('d-m-Y h:i:s A',$payment['datentime'])."</td>
		<td>".$comission_status."</td>
		</tr>";
}

if($i == 0)
{
	echo "<tr><td colspan='8' class='text-center text-danger fw-bold'>Commission Payment History Not Available</td></tr>";
}
?>

</tbody>
</table>

<script>
function setSearchID(Val)
{
	if(Val == 'SA')
	{
		$("#agent").removeClass('d-none');
		$("#agent").attr('disabled',false);
		$("#sales_person").addClass('d-none');
		$("#sales_person").attr('disabled',true);
		$("#sales_person").val('');
	}
	else if(Val == 'SP')
	{
		$("#sales_person").removeClass('d-none');
		$("#sales_person").attr('disabled',false);
		$("#agent").addClass('d-none');
		$("#agent").attr('disabled',true);
		$("#agent").val('');
	}
}
</script>
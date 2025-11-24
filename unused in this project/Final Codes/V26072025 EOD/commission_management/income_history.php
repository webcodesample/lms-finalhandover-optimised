<?php
if(isset($_REQUEST['application_point']) && $_REQUEST['application_point'])
$search_filter = $_REQUEST['application_point'];
else
$search_filter = "";
?>

<div class="d-flex justify-content-between">

<form method="post">
<div class="d-flex">
<input type="text" name="application_point" id="application_point" class="form-control form-control-sm m-1" style="width:250px;" placeholder="Application Point" value="<?=$search_filter?>" required>
<button type="submit" class="btn btn-sm btn-subtle-danger m-1 p-1">
<span class="text-danger" data-feather="search" style="height: 20px; width: 20px;"></span>
</button>
</div>
</form>

<form method="post" action="receive_commission.php" enctype="multipart/form-data">
<div class="d-flex justify-content-end">
<input type="text" name="transaction_id" class="form-control form-control-sm m-1" style="width:150px;" placeholder="UTR/Trnasaction ID" required>
<input type="datetime-local" name="transaction_date" class="form-control form-control-sm m-1" style="width:160px;" required>
<input type="file" class="form-control form-control-sm m-1" style="width:230px;" name="transaction_proof[]" accept=".jpg,.jpeg,.pdf" multiple required>
<button type="submit" class="btn btn-sm btn-subtle-success m-1" onClick="return validateCheckboxCount('lead_list','URN')">Receive Commission</button>
</div>

</div>

<table class="table table-sm table-bordered table-hover fs-9">

<thead class="table-info text-center">
<th>#</th>
<th>URN</th>
<th>Student Name</th>
<th>URN Fee</th>
<th>Received From</th>
<th>Commission Amount</th>
<th>Transaction ID</th>
<th>Date & Time</th>
<th>Status/Remark</th>
<th>Action</th>
</thead>

<tbody>

<?php

if(isset($_REQUEST['application_point']) && $_REQUEST['application_point'])
{
	$search_filter_array = explode(' - ',$_REQUEST['application_point']);
	$where_con_array = [ 'application_point_id' => $search_filter_array[0],];
	$income_list = getRowsDataCon('income_history',$where_con_array,$con);
}
else
{
	$income_list = getRowsData('income_history',$con);
}

$i = 0;
while($income = mysqli_fetch_assoc($income_list))
{
	$i++;

	if($income['comission_rcvd'])
	{
		$comission_rcvd_status = "<span class='text-success'>Recieved</span>";
		$checkbox_input = "";

	}
	else
	{
		$comission_rcvd_status = "<span class='text-danger'>Pending</span>";
		$checkbox_input = "<input type='checkbox' class='form-check-input' name='lead_list[]' value='".$income['lead_id']."'> ";
	}

	$urn_student_name = getLatestUpdate('student_name','lead_id',$income['lead_id'],'urn_audit_history',$con);

	echo "<tr>
		<td class='ps-2'>".$checkbox_input.$i."</td>
		<td>".getFieldValue('urn','id',$income['lead_id'],'leads_details',$con)."</td>
		<td>".$urn_student_name."</td>
		<td>".$income['lead_amount']."</td>
		<td>".getFieldValue('name','id',$income['application_point_id'],'application_point_list',$con)."</td>
		<td>".$income['comission_amount']."</td>
		<td><a href='income_detail.php?lead_id=".$income['lead_id']."' class='link-success text-decoration-none'>".$income['transaction_id']."</a></td>
		<td>".date('d-m-Y h:i:s A',$income['datentime'])."</td>
		<td>".$comission_rcvd_status."</td>";

	if($income['comission_rcvd'] == 0) 
	{
		echo "<td></td>";
	}
	else
	{
		echo "<td nowrap>
			<a class='btn btn-sm p-0 bg-light' onClick='showIframe(&quot;../transaction_proof_management/income_proof.php?lead_id=".$income['lead_id']."&quot;)' data-bs-toggle='modal' data-bs-target='#transactionProof'>
			  <span data-feather='eye' style='height:20px;' class='text-primary'></span>
			</a>
			</td>";
	}

	echo "</tr>";
}

if($i == 0)
{
	echo "<tr><td colspan='8' class='text-center text-danger fw-bold'>Income History Not Available</td></tr>";
}
?>

</tbody>
</table>
</form>

<?php include_once("../backend_common_includes/transaction_proof_modal.php") ?>
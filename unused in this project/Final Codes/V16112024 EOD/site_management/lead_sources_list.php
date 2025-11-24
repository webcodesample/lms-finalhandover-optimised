<?php
$result_source_list = getRowsData('lead_sources_list',$con);
?>

<div class="d-flex justify-content-end">
<a href="add_lead_source.php"><img src="../portal-icons/add.png" height="25px"></a>
</div>

<div id="leadsourceUpdate" class="d-none">
<form action="update_lead_source.php" method="post">
<input type="hidden" name="lead_source_id" id="lead_source_id">
<div class="d-flex">
<input type="text" name="description" id="description" class="form-control form-control-sm m-1" style="width:200px;" requuired>
<button type="submit" class="btn btn-sm btn-subtle-primary m-1">Update Lead Source</button>
<button type="reset" class="btn btn-sm btn-subtle-danger m-1" onClick="$('#leadsourceUpdate').addClass('d-none');">Cancle</button>
</div>
</form>
</div>

<table class="table table-sm table-bordered table-striped table-hover fs-9 mt-2">

<thead class="table-info text-center fw-bolder">
<td>#</td>
<th>Description</th>
<th>Created On</th>
<th>Action</th>
</thead>
<tbody>

<?php
$i = 0;
while($lead_source = mysqli_fetch_assoc($result_source_list))
{	
	$i++;
	$edit_link = "";
	$delete_link = "";

	if(getRowCount('source_id',$lead_source['id'],'temp_leads',$con) == 0 && getRowCount('source_id',$lead_source['id'],'leads_details',$con) == 0)
	{
		
		$delete_link .= "<a href='delete_lead_source.php?lead_source_id=".$lead_source['id']."' onClick='return makeConfirm(&quot;delete lead source ".strtoupper($lead_source['description'])." &quot;)'><img src='../portal-icons/delete.png' height='20px'></a>";
	}
	$edit_link .= "<a href='javascript:editLeadSource(".$lead_source['id'].",&quot;".$lead_source['description']."&quot;)' onClick='return makeConfirm(&quot;edit lead source ".strtoupper($lead_source['description'])." &quot;)'><img src='../portal-icons/edit.png' height='20px'></a>";

	echo "<tr>
		<td class='ps-2'>".$i."</td>	
		<td>".$lead_source['description']."</td>
		<td>".date('d-m-Y',$lead_source['datentime'])."</td>
		<td>".$edit_link.$delete_link."</td>
		</tr>";
}
?>

</tbody>
</table>

<script>
function editLeadSource(ID,Description)
{
	$("#leadsourceUpdate").removeClass("d-none");
	$("#lead_source_id").val(ID);
	$("#description").val(Description);
}
</script>
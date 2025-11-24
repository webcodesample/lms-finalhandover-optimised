<div class="d-flex justify-content-between mb-2">
<h5>CRN List</h5>
<div class="d-flex">
<a href="../lrn_management/create_lrn.php" title="Create New URN"><img src="../portal-icons/loanapply.png" width="25px"></a>
<span class="text-danger mx-1" data-feather="search" style="height: 25px; width: 25px; cursor:hand;" onClick="searchToggle()"></span>
<a href="create_crn.php"><img src="../portal-icons/add.png" width="25px"></a>
</div>
</div>

<?php
$search_input_design = 'class="form-control form-control-sm m-1" style="width:130px;" onChange="setSearchFlag(this.value)"';
$dropdown_design = 'class="form-select form-select-sm m-1" style="width:125px;" onChange="setSearchFlag(this.value)"';
?>

<div id="search_form" class="d-flex justify-content-between <?=$search_form_display_class?>">
<form method="post">
<div class="d-flex">
<input type="text" name="search_id" id="search_id" placeholder="CRN" value="<?=$search['id']?>" <?=$search_input_design?>>
<input type="text" name="search_name" id="search_name" placeholder="Name" value="<?=$search['name']?>" <?=$search_input_design?>>
<input type="text" name="search_company_name" id="search_company_name" placeholder="Company Name" value="<?=$search['company_name']?>" <?=$search_input_design?>>
<input type="text" name="search_mobile" id="search_mobile" placeholder="Mobile" value="<?=$search['mobile']?>" <?=$search_input_design?>>
<input type="text" name="search_email" id="search_email" placeholder="Email" value="<?=$search['email']?>" <?=$search_input_design?>>
<select name="search_ctype" id="search_ctype" <?=$dropdown_design?>>
<?=generateTypeDropdown($search['ctype'])?>
</select>
<select name="search_source" id="search_source" <?=$dropdown_design?>>
<option value="">Source</option>
<?php
$lead_source_list = getRowsData('lead_sources_list',$con);

while($lead_source = mysqli_fetch_assoc($lead_source_list))
{
	if($lead_source['id'] == $search['source'])
	echo "<option value='".$lead_source['id']."' selected>".$lead_source['description']."</option>";
	else
	echo "<option value='".$lead_source['id']."'>".$lead_source['description']."</option>";
}
?>
</select>
<input type="hidden" name="action_perform" value="search">
<input type="hidden" id="search_flag" value="0">
<button type="submit" onClick="return validateSearchForm()" class="btn btn-sm btn-subtle-danger m-1 px-2">
<span data-feather="search"></span>
</button>
<?=$clear_filter_btn?>
</div>
</form>
</div>

<table class="table table-sm table-hover table-bordered fs-9">

<thead class="table-info text-center">
<tr>
<th>#</th>
<th>Name</th>
<th>Type</th>
<th>Company</th>
<th>Mobile</th>
<th>Alt Mobile</th>
<th>Email</th>
<th>Source</th>
<th>Action</th>
</tr>
</thead>

<tbody>

<?php
$i = 0;

while($crn = mysqli_fetch_assoc($result_crn_list))
{
	$i++;

	$crn_lrn_count =  getRowCount('crn',$crn['id'],'lrn_list',$con);
	$source = getFieldValue('description','id',$crn['lead_source_id'],'lead_sources_list',$con);

	if($crn['cust_type'] == 1)
	$cType = "Individual";
	else
	$cType = "Corporate";

	if($crn['alt_mobile'])
	$alt_mobile = $crn['alt_mobile'];
	else
	$alt_mobile = '';

	echo "<tr>
		<td class='ps-2'>".$i."</td>
		<td><a href='manage_crn.php?crn=".$crn['id']."' class='text-decoration-none link-primary'>".ucwords($crn['name'])."</a></td>
		<td>".$cType."</td>
		<td>".ucwords($crn['company_name'])."</td>
		<td>".$crn['mobile']."</td>
		<td>".$alt_mobile."</td>
		<td>".$crn['email']."</td>
		<td>".$source."</td>";

	echo "<td nowrap>";
	echo "<a href='manage_crn.php?crn=".$crn['id']."' onclick='return makeConfirm(&quot;edit ".$crn['name']."&quot;)'><img src='../portal-icons/edit.png' height='20px'></a>";

	if($crn_lrn_count == 0)
		echo "<a href='delete_crn.php?crn=".$crn['id']."' onclick='return makeConfirm(&quot;delete ".$crn['name']."&quot;)'><img src='../portal-icons/delete.png' height='20px'></a>";

	echo "</td>
		</tr>";
}

if($i == 0)
echo "<tr><td colspan='9' class='text-center text-danger bg-danger-subtle fw-semibold'>No CRN Available</td></tr>";
?>

</tbody>
</table>

<?php include_once("footer_copyright.php") ?>
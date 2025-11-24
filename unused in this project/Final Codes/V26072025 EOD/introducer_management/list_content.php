<div class="d-flex justify-content-between mb-2">
<h5>Introducer List</h5>
<div class="d-flex">
<span class="text-danger mx-1" data-feather="search" style="height: 25px; width: 25px; cursor:hand;" onClick="searchToggle()"></span>
<a href="#" data-bs-toggle="modal" data-bs-target="#addIntroducer"><img src="../portal-icons/add.png" width="25px"></a>
</div>
</div>

<?php
$search_input_design = 'class="form-control form-control-sm m-1" style="width:130px;" onChange="setSearchFlag(this.value)"';
$dropdown_design = 'class="form-select form-select-sm m-1" style="width:125px;" onChange="setSearchFlag(this.value)"';
?>

<div id="search_form" class="d-flex justify-content-between <?=$search_form_display_class?>">
<form method="post">
<div class="d-flex">
<input type="text" name="search_name" id="search_name" placeholder="Name/Contact Person" title="Name/Contact Person" value="<?=$search['name']?>" <?=$search_input_design?>>
<input type="text" name="search_mobile" id="search_mobile" placeholder="Mobile" value="<?=$search['mobile']?>" <?=$search_input_design?>>
<input type="text" name="search_email" id="search_email" placeholder="Email" value="<?=$search['email']?>" <?=$search_input_design?>>
<select name="search_type" id="search_type" <?=$dropdown_design?>>
<option value="">Type</option>
<?php
$cust_type_array = ['Individual','Corporate'];
for($i=0; $i<count($cust_type_array); $i++)
{
	if($search['type'] != '' && (($i+1) == $search['type']))
	echo "<option value='".($i+1)."' selected>".$cust_type_array[$i]."</option>";
	else
	echo "<option value='".($i+1)."'>".$cust_type_array[$i]."</option>";
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
<th>Commission</th>
<th>Type</th>
<th>Contact Person</th>
<th>Mobile</th>
<th>Email</th>
<th>Document</th>
<th>Action</th>
</tr>
</thead>

<tbody>

<?php
$i = 0;

while($introducer = mysqli_fetch_assoc($introducers_list))
{
	$i++;
	$delete_btn = "";

	$introducer_lrn_count =  getRowCountDistinct('lrn','introducer_id',$introducer['id'],'lrn_audit_history',$con);

	if($introducer_lrn_count == 0)
		$delete_btn = "<a href='delete.php?id=".$introducer['id']."' onclick='return makeConfirm(&quot;delete ".$introducer['name']."&quot;)'><img src='../portal-icons/delete.png' height='20px'></a>";

	if($introducer['type'] == 1)
	$type = "Individual";
	else
	$type = "Corporate";

	echo "<tr>
		<td class='ps-2'>".$i."</td>
		<td><a href='manage.php?id=".$introducer['id']."' class='text-decoration-none link-primary'>".ucwords($introducer['name'])."</a></td>
		<td>".$introducer['commission_percent']."%</td>
		<td>".$type."</td>
		<td>".ucwords($introducer['contact_person'])."</td>
		<td>".$introducer['mobile']."</td>
		<td>".$introducer['email']."</td>
		<td>".ucwords(str_replace('_',' ',$introducer['document_title']))."</td>";

	echo "<td nowrap>
			<a href='manage.php?id=".$introducer['id']."' onclick='return makeConfirm(&quot;edit ".$introducer['name']."&quot;)'><img src='../portal-icons/edit.png' height='20px'></a>
			".$delete_btn."
		</td>
		</tr>";
}

if($i == 0)
echo "<tr><td colspan='9' class='text-center text-danger bg-danger-subtle fw-semibold'>No CRN Available</td></tr>";
?>

</tbody>
</table>

<?php
include_once("add_introducer_modal.php");
include_once("footer_copyright.php");
?>
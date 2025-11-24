<?php
include_once("common_include.php");

$where_con_array = ['id'=>$_REQUEST['id']];
$introducer = mysqli_fetch_assoc(getRowsDataCon('introducer_list',$where_con_array,$con));
?>

<div class="d-flex justify-content-between mb-3">
	<h5 class="text-primary my-2">Update Introducer</span></h5>
	<?php setGoBack("list.php"); ?>
</div>

<div class="border border-secondary-subtle">
<form method="post" action="update.php">
<input type="hidden" name="id" value="<?=$_REQUEST['id']?>">

<div class="bg-warning-subtle ps-2 py-1 mb-3 fw-bold">Basic Details</div>

<div <?=$input_row_div_design?>>
<?=createinput('name',$introducer['name'],$label_design_col1,$required_input_box_design,'')?>
<?=createinput('email',$introducer['email'],$label_design_col2,$required_input_box_design,'')?>
<?=createinput('mobile',$introducer['mobile'],$label_design_col2,$required_input_box_design,'')?>
</div>

<div <?=$input_row_div_design?>>
<div class="d-flex">
<div <?=$label_design_col1?>>Type</div>
<select name="type" id="type" <?=$required_input_box_design?> onChange="checkIntroducerType(this.value)">
<?=generateTypeDropdown($introducer['type'])?>
</select>
</div>
<?php
if($introducer['type'] == 1)
$cp_input_design = $disabled_input_box_design;
else
$cp_input_design = $required_input_box_design;

echo createinput('contact_person',$introducer['contact_person'],$label_design_col2,$cp_input_design,'');
?>
<?=createinput('commission_percent',$introducer['commission_percent'],$label_design_col2,$required_input_box_design,'')?>
</div>

<div <?=$input_row_div_design?>>
<?=createTextarea('address',$introducer['address'],$label_design_col1,$required_textarea_design,'')?>
</div>

<center>
<button onClick="return validateChanges()" class="btn btn-sm btn-subtle-success my-3">Update Basic Details</button>
</center>

</form>
</div>

<div class="border border-secondary-subtle mt-5">
<form method="post" action="update_bank.php">
<input type="hidden" name="id" value="<?=$_REQUEST['id']?>">
<div class="bg-warning-subtle ps-2 py-1 mb-3 fw-bold">Bank Details</div>

<div <?=$input_row_div_design?>>
<?=createinput('bank_name',$introducer['bank_name'],$label_design_col1,$required_input_box_design,'')?>
<?=createinput('account_number',$introducer['account_number'],$label_design_col2,$required_input_box_design,'')?>
<?=createinput('ifsc',$introducer['ifsc'],$label_design_col2,$required_input_box_design,'')?>
</div>

<center>
<button onClick="return validateChanges()" class="btn btn-sm btn-subtle-success my-3">Update Bank Details</button>
</center>

</form>
</div>

<script src="../js/lms.js"></script>
<script src="../js/validateInputChanges.js"></script>
<script>
function validateChanges()
{
	var inputs = <?=json_encode($introducer)?>;
	return validateInputChanges(inputs);
}
</script>
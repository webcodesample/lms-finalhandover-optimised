<?=$action_perform_msg?>
<div class="d-flex justify-content-between mb-3">
	<h5 class="text-primary my-2">CRN<?=$crn['id']?> : <span class="text-warning"><?=$crn['name']?></span></h5>
	<div class="d-flex">
		<?=displayApplyBtn($applyBtn_display_flag)?>
		<?php setGoBack("crn_list.php"); ?>
	</div>
</div>
<div class="mb-3"><?=generateTabsList($requested_tab,$tabs_array,'crn='.$_REQUEST['crn'])?></div>

<?php
$input_design = 'class="form-control form-control-sm m-1" style="width:250px;" required';
$input_design_optional = 'class="form-control form-control-sm m-1" style="width:250px;"';
$input_textarea_design = 'class="form-control form-control-sm m-1" style="width:250px; height:106px;" required';
?>

<?php
include_once('crn_'.$requested_tab.'.php');
include_once("footer_copyright.php");
?>
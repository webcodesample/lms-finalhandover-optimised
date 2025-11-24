<?php $site=$moduleData; ?>

<h5>Site Info</h5>
<form action="update_site_settings.php" method="post">

<?php
$input_design = 'class="form-control form-control-sm m-1" style="width:200px" required';
?>

<div class="fs-9 mt-3">

<div class="d-flex">
<div class="pt-2" style="width:100px;">Site Title</div>
<input type="text" name="site_title" id="site_title" value="<?=$site['site_title']?>" <?=$input_design?> placeholder="Site Title">
</div>

<div class="d-flex">
<div class="pt-2" style="width:100px;">WSP Name</div>
<input type="text" name="wsp_name" id="wsp_name" value="<?=$site['wsp_name']?>" <?=$input_design?> placeholder="Site Title">
</div>

<div class="d-flex">
<div class="pt-2" style="width:100px;">WSP URL</div>
<input type="text" name="wsp_url" id="wsp_url" value="<?=$site['wsp_url']?>" <?=$input_design?> placeholder="Site Title">
</div>

<div class="d-flex">
<div class="pt-2" style="width:100px;">CRM Version</div>
<input type="text" name="crm_version" id="crm_version" value="<?=$site['crm_version']?>" <?=$input_design?> placeholder="Site Title">
</div>

<div class="d-flex">
<div class="pt-2" style="width:100px;">Site Logo</div>
<img src="../images/<?=$site['site_logo']?>" height="44px">
<a href="#" data-bs-toggle="modal" data-bs-target="#changeSitelogo">
<img src="../portal-icons/edit.png" class="m-2" title="Change Logo" width="20px" height="20px">
</a>
</div>

<div class="d-flex justify-content-center mt-3" style="width:300px;">
<button class="btn btn-sm btn-primary" onClick="return validateChanges()">Update Site Info</button>
</div>

</div>

</form>

<?php include_once("change_sitelogo_modal.php"); ?>

<script src="../js/validateInputChanges.js"></script>
<script>
function validateChanges()
{
	var inputs = <?=json_encode($site)?>;
	return validateInputChanges(inputs);
}
</script>
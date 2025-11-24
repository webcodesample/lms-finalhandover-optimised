<div class="d-flex mb-3 justify-content-between">
<h5>Add New Lead Source</h5>
<?php setGoBack("portal_settings.php?tab=lead_sources"); ?>
</div>

<form action="create_lead_source.php" method="post">

<div class="d-flex flex-wrap" style="width:250px;">
<input type="text" name="description[]" class="form-control form-control-sm m-1" style="width:200px;" placeholder="Lead Source Description" required>
<div class="mt-2">
<img src="../portal-icons/add.png" height="20px" onClick="addMoreSourceField()" style="margin-top:auto;">
</div>
<div class="d-flex flex-column" id="addMoreSource"></div>
</div>

<div class="d-flex justify-content-center" style="width:220px;">
<input type="submit" class="btn btn-sm btn-primary m-3" value="Add Lead Sorce">
</div>

</form>
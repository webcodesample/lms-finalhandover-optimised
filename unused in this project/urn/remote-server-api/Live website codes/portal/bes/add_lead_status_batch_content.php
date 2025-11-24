<h5 class="mb-3">Create New Status Batch</h5>
<form action="create_lead_status_batch.php" method="post">
<div class="d-flex">
<h5 class="px-2 mt-3">Batch ID : <span class="text-danger">B<?=(getMaxBatchId($con)+1)?></span></h5>
<input type="button" value="Add More Field" class="btn btn-sm btn-subtle-warning m-1" onClick="addMoreInputField()">
<input type="submit" value="Create Status Batch" class="btn btn-sm btn-primary m-1">
</div>
<div>
<div class="d-flex">
<input type="hidden" name="batch_id" class="form-control form-control-sm m-1" style="width:200px;" value="<?=(getMaxBatchId($con)+1)?>" readonly>
<input type="text" name="description[]" class="form-control form-control-sm m-1" style="width:200px;" value="New" readonly>
<input type="text" name="step_order[]" class="form-control form-control-sm m-1" style="width:200px;" value="1" readonly>
</div>

<div class="d-flex">
<input type="text" name="description[]" class="form-control form-control-sm m-1" style="width:200px;" value="Pre Application" readonly>
<input type="text" name="step_order[]" class="form-control form-control-sm m-1" style="width:200px;" value="2" readonly>
</div>

<div class="d-flex">
<input type="text" name="description[]" class="form-control form-control-sm m-1" style="width:200px;" value="Verification" readonly>
<input type="text" name="step_order[]" class="form-control form-control-sm m-1" style="width:200px;" value="3" readonly>
</div>

<div class="d-flex">
<input type="text" name="description[]" class="form-control form-control-sm m-1" style="width:200px;" value="Applied" readonly>
<input type="text" name="step_order[]" class="form-control form-control-sm m-1" style="width:200px;" value="4" readonly>
</div>

<div class="d-flex">
<input type="text" name="description[]" class="form-control form-control-sm m-1" style="width:200px;" placeholder="Status Description" required>
<input type="text" name="step_order[]" class="form-control form-control-sm m-1" style="width:200px;" value="5" readonly>
</div>

<div id="addMore">
</div>
<div class="d-flex mt-3">

</div>
</div>

</form>
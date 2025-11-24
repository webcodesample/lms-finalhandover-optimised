<form action="update_callback_status.php" method="post">
<input type="hidden" name="callback_id" value="<?=$_REQUEST['callback_id']?>">
<div class="d-flex flex-wrap justify-content-center" style="width:350px;">

<div class="d-flex mb-1" style="width:350px;">
<div class="ps-2 mt-2" style="width:150px;">URN</div>
<input type="text" value="CA<?=$callback_urn?>" class="form-control form-control-sm m-1 text-info fw-bold" disabled>
</div>

<div class="d-flex mb-1" style="width:350px;">
<div class="ps-2 mt-2" style="width:150px;">Name</div>
<input type="text" value="<?=$latest_urn_audit_data['student_name']?>" class="form-control form-control-sm m-1 text-info fw-bold" disabled>
</div>

<div class="d-flex mb-1" style="width:350px;">
<div class="ps-2 mt-2" style="width:150px;">Mobile</div>
<input type="text" value="<?=$latest_urn_audit_data['student_mobile']?>" class="form-control form-control-sm m-1 text-info fw-bold" disabled>
</div>

<div class="d-flex mb-1" style="width:350px;">
<div class="ps-2 mt-2" style="width:150px;">Date Time</div>
<input type="text" value="<?=date('d-m-Y h:i A',$callback['callback_datentime'])?>" class="form-control form-control-sm m-1 text-info fw-bold" disabled>
</div>

<div class="mt-2">
<span class="ps-2">Previous Remark<span>
<textarea class="form-control form-control-sm m-1" style="width:350px; height:100px;" disabled><?=$callback['prev_remark']?></textarea>
</div>

<textarea name="call_remark" class="form-control form-control-sm m-1" style="width:350px; height:100px;" placeholder="Current Call Remark" required></textarea>

<button type="submit" class="btn btn-sm btn-primary m-1">Update Callback Status</button>
</div>
</form>
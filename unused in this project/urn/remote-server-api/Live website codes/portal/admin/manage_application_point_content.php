<?php
$university ="";
$intermediary = "";

if($application_point['type'] == 'u')
$university = "selected";
else
$intermediary = "selected";
?>

<div class="d-flex justify-content-between mb-3">
<h5>Managae AP</h5>
<?php setGoBack('application_point_list.php'); ?>
</div>

<form action="update_application_point.php" method="post">
<input type="hidden" name="ap_id" value="<?=$_REQUEST['ap_id']?>">

<div class="d-flex">
<label class="mt-2" style="width:130px;">Type : </label>
<select name="type" class="form-select form-select-sm m-1" style="width:200px;" required>
<option value="">Select Type</option>
<option value="u" <?=$university?>>University</option>
<option value="i" <?=$intermediary?>>Intermediary</option>
</select>
</div>

<div class="d-flex">
<label class="mt-2" style="width:130px;">Name : </label>
<input type="text" name="name" class="form-control form-control-sm m-1" style="width:200px;" value="<?=$application_point['name']?>" placeholder="Name" required>
</div>

<div class="d-flex">
<label class="mt-2" style="width:130px;">Address : </label>
<input type="text" name="address" class="form-control form-control-sm m-1" style="width:200px;" value="<?=$application_point['address']?>" placeholder="Address" required>
</div>

<div class="d-flex">
<label class="mt-2" style="width:130px;">Contact Person : </label>
<input type="text" name="contact_person_name" class="form-control form-control-sm m-1" style="width:200px;" value="<?=$application_point['contact_person_name']?>" placeholder="Contact Person Name" required>
</div>

<div class="d-flex">
<label class="mt-2" style="width:130px;">Mobile : </label>
<input type="text" name="mobile" class="form-control form-control-sm m-1" style="width:200px;" value="<?=$application_point['mobile']?>" placeholder="Mobile" required>
</div>

<div class="d-flex">
<label class="mt-2" style="width:130px;">Email : </label>
<input type="email" name="email" class="form-control form-control-sm m-1" style="width:200px;" value="<?=$application_point['email']?>" placeholder="Email" required>
</div>

<div class="d-flex">
<label class="mt-2" style="width:130px;">Comission % : </label>
<input type="text" name="comission_percentage" class="form-control form-control-sm m-1" style="width:200px;" value="<?=$application_point['comission_percentage']?>" placeholder="Comission %" required>
</div>

<div class="d-flex mt-5 justify-content-center" style="width:330px;">
<input class="btn btn-sm btn-primary" type="submit" value="Update Application Point">
</div>


</form>
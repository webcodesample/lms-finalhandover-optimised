<div class="d-flex justify-content-between mb-3">
<h5>Add New Application Point</h5>
<?php setGoBack('application_point_list.php'); ?>
</div>

<form action="create_application_point.php" method="post">

<div class="d-flex">
<label class="mt-2" style="width:130px;">Type : </label>
<select name="type" class="form-select form-select-sm m-1" style="width:200px;" required>
<option value="">Select Type</option>
<option value="u">University</option>
<option value="i">Intermediary</option>
</select>
</div>

<div class="d-flex">
<label class="mt-2" style="width:130px;">Name : </label>
<input type="text" name="name" class="form-control form-control-sm m-1" style="width:200px;" placeholder="Name" required>
</div>

<div class="d-flex">
<label class="mt-2" style="width:130px;">Address : </label>
<input type="text" name="address" class="form-control form-control-sm m-1" style="width:200px;" placeholder="Address" required>
</div>

<div class="d-flex">
<label class="mt-2" style="width:130px;">Contact Person : </label>
<input type="text" name="contact_person_name" class="form-control form-control-sm m-1" style="width:200px;" placeholder="Contact Person Name" required>
</div>

<div class="d-flex">
<label class="mt-2" style="width:130px;">Mobile : </label>
<input type="text" name="mobile" class="form-control form-control-sm m-1" style="width:200px;" placeholder="Mobile" required>
</div>

<div class="d-flex">
<label class="mt-2" style="width:130px;">Email : </label>
<input type="email" name="email" class="form-control form-control-sm m-1" style="width:200px;" placeholder="Email" required>
</div>

<div class="d-flex">
<label class="mt-2" style="width:130px;">Commission % : </label>
<input type="text" name="comission_percentage" class="form-control form-control-sm m-1" style="width:200px;" placeholder="Comission %" required>
</div>

<div class="d-flex mt-5 justify-content-center" style="width:330px;">
<input class="btn btn-sm btn-primary" type="submit" value="Add Application Point">
</div>

</form>
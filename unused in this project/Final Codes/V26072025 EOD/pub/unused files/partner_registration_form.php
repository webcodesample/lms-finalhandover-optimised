<div class="d-flex justify-content-center mt-3">
<form method="post">
<div class="card" style="width:300px;">
<div class="card-body">
<h5 class="ps-1">Agent Type</h5>
<div class="d-flex">
<input type="radio" class="form-check-input m-1" name="agent_type" value="0" onClick="setAgentType(this.value)">Individual
<input type="radio" class="form-check-input m-1" name="agent_type" value="1" onClick="setAgentType(this.value)" checked>Company
</div>
</div>
</div>

<div class="card mt-3" id="personal_detail" style="width:300px;">
<div class="card-body">
<h5 class="ps-1">Personal Detail</h5>
<input type="text" name="name" class="form-control m-1" placeholder="Full Name" required style="width:250px;">
<input type="text" name="mobile" class="form-control m-1" placeholder="Mobile Number" required style="width:250px;">
<input type="text" name="whatsapp" class="form-control m-1" placeholder="WhatsApp Number" required style="width:250px;">
<input type="email" name="email" id="email" class="form-control m-1" placeholder="Email" required style="width:250px;" onBlur="checkEmailUniqueness(this.id)">
</div>
</div>

<div class="card mt-3" id="company_detail" style="width:300px;">
<div class="card-body">
<h5 class="ps-1">Company Detail</h5>
<input type="text" name="company_name" id="company_name" class="form-control m-1" placeholder="Company Name" required style="width:250px;">
<input type="text" name="company_address" id="company_address" class="form-control m-1" placeholder="Company Address" required style="width:250px;">
<input type="text" name="company_website" id="company_website" class="form-control m-1" placeholder="Company Website" required style="width:250px;">
</div>
</div>

<div class="d-flex justify-content-center" style="width:300px;">
<input type="submit" name="action_perform" value="Partner With US" class="btn btn-lg btn-subtle-primary m-3">
</div>

</form>
</div>
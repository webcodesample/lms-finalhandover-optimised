<?php $site=$moduleData; ?>

<h5>Site Info</h5>
<form action="update_site_settings.php" method="post">

<div class="fs-9 mt-3">

<div class="d-flex">
<div class="pt-2" style="width:100px;">Site Title</div>
<input type="text" name="site_title" value="<?=$site['site_title']?>" class="form-control form-control-sm m-1" style="width:200px" placeholder="Site Title" required>
</div>

<div class="d-flex">
<div class="pt-2" style="width:100px;">WSP Name</div>
<input type="text" name="wsp_name" value="<?=$site['wsp_name']?>" class="form-control form-control-sm m-1" style="width:200px" placeholder="Site Title" required>
</div>

<div class="d-flex">
<div class="pt-2" style="width:100px;">WSP URL</div>
<input type="text" name="wsp_url" value="<?=$site['wsp_url']?>" class="form-control form-control-sm m-1" style="width:200px" placeholder="Site Title" required>
</div>

<div class="d-flex">
<div class="pt-2" style="width:100px;">CRM Version</div>
<input type="text" name="crm_version" value="<?=$site['crm_version']?>" class="form-control form-control-sm m-1" style="width:200px" placeholder="Site Title" required>
</div>

<div class="d-flex">
<div class="pt-2" style="width:100px;">Logo Name</div>
<input type="text" name="site_logo" value="<?=$site['site_logo']?>" class="form-control form-control-sm m-1" style="width:200px" placeholder="Site Title" disabled>
</div>

<div class="d-flex">
<div class="pt-2" style="width:100px;">Site Logo</div>
<img src="../images/<?=$site['site_logo']?>" width="150px">
</div>

<div class="d-flex justify-content-center mt-3" style="width:300px;">
<button type="submit" class="btn btn-sm btn-primary">Update Site Info</button>
</div>

</div>

</form>
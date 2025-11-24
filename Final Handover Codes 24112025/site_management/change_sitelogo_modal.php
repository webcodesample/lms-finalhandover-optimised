<!-- Modal -->
<div class="modal fade" id="changeSitelogo" data-bs-backdrop="static" data-bs-keyboard="false" tabindex="-1" aria-labelledby="staticBackdropLabel" aria-hidden="true">
  <div class="modal-dialog modal-sm modal-dialog-centered">
    <div class="modal-content">
		<div class="modal-body">
		<center>
			<form id="introducer_form" action="changeSitelogo.php" method="post" enctype="multipart/form-data">
				<h6 class="mb-3 text-center">New Site Logo</h6>

				<input type="file" name="siteLogo" class="form-control form-control-sm mb-2" style="width:250px;" required>

				<button class="btn btn-sm btn-subtle-success m-1">Update Logo</button>
				<button type="reset" class="btn btn-sm btn-subtle-danger m-1" data-bs-dismiss="modal">Cancel</button>
			</form>
		</center>
      </div>
    </div>
  </div>
</div>
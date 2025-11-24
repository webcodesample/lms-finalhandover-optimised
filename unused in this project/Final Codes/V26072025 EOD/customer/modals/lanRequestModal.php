<!-- Modal -->
<div class="modal fade" id="lanRequestModal" data-bs-backdrop="static" data-bs-keyboard="false" tabindex="-1" aria-labelledby="manageLANLabel" aria-hidden="true">
  <div class="modal-dialog modal-dialog-centered">
    <div class="modal-content container p-3" style="width:300px;">
    <center>
        <form method="post" action="createLANRequest.php">
        <input type="hidden" name="request_for" value="<?=$_REQUEST['lan']?>">
        <div class="fs-9 text-start text-danger fw-semibold ps-2">Create A Request To</div>
        <select name="request_type_id" class="form-control form-control-sm m-1 mb-2" required>
        <?php
        $request_type_list = mysqli_query($con,"SELECT * FROM customer_request_type_list");
        $request_type_options = "<option value=''>Select One</option>";
        while($request_type = mysqli_fetch_assoc($request_type_list))
        {
            $request_type_options .= "<option value='".$request_type['id']."'>".$request_type['description']."</option>";
        }
        echo $request_type_options;
        ?>
        </select>
        <button class="btn btn-sm btn-subtle-success">Create Request</button>
        <button type="reset" class="btn btn-sm btn-subtle-danger" data-bs-dismiss="modal">Cancel</button>
        </form>
    </center>
    </div>
  </div>
</div>
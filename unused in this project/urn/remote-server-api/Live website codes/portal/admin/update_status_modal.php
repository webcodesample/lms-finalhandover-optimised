<!-- Modal -->
<div class="modal fade" id="staticBackdrop" data-bs-backdrop="static" data-bs-keyboard="false" tabindex="-1" aria-labelledby="staticBackdropLabel" aria-hidden="true">
  <div class="modal-dialog modal-dialog-centered">
    <div class="modal-content container p-3" style="width:300px;">
    <center>
        <form action="update_status.php" method="post">
        <input type="hidden" name="lead_id" value="<?=$_REQUEST['lead_id']?>">
        <input type="hidden" name="action_perform" value="next_status">
        <input type="hidden" name="current_status_id" value="<?=$current_status_id?>">
        <input type="hidden" name="current_status_batch_id" value="<?=$current_status_batch_id?>">
        <table class="table table-sm table-borderless w-auto">
            <?php if($current_status_step_order == 3)
            { ?>
            <tr>
                <td>
                    <select name="application_point_id" class="form-select form-select-sm m-1" style="width:230px;" required>
                    <option value="">Application Point</option>
                    <?php
                        $application_point_list = getRowsData('application_point_list',$con);
                        while($application_point = mysqli_fetch_assoc($application_point_list))
                        {
                            echo "<option value='".$application_point['id']."'>".$application_point['name']."</option>";
                        }
                    ?>
                    </select>
                </td>
            </tr>
            <?php } ?>
            <tr>
                <td>
                    <textarea class="form-control m-1" name="updation_remark" style="width:230px;height:120px;" placeholder="Updation Remark" required></textarea>
                </td>
            </tr>
            <tr>
                <td align="center">
                    <input type="button" class="btn btn-danger rounded" data-bs-dismiss="modal" value="Cancel">
                    <input type="submit" class="btn btn-primary rounded" value="Update Status">
                </td>
            </tr>
        </table>
        </form>
    </center>
    </div>
  </div>
</div>
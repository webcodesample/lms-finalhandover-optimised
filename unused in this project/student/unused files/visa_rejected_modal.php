<!-- Modal -->
<div class="modal fade" id="visaRejected" data-bs-backdrop="static" data-bs-keyboard="false" tabindex="-1" aria-labelledby="visaRejectedLabel" aria-hidden="true">
  <div class="modal-dialog modal-dialog-centered">
    <div class="modal-content container p-3" style="width:300px;">
    <center>
        <form action="update_status.php" method="post">
        <input type="hidden" name="lead_id" value="<?=$_REQUEST['lead_id']?>">
        <input type="hidden" name="action_perform" value="visa_rejected">
        <table class="table table-sm table-borderless w-auto">
            <tr>
                <td>
                    <textarea class="form-control m-1" name="updation_remark" style="width:230px;height:120px;" placeholder="Reason for Visa Rejection" required></textarea>
                </td>
            </tr>
            <tr>
                <td align="center">
                    <input type="button" class="btn btn-danger rounded" data-bs-dismiss="modal" value="Cancel">
                    <input type="submit" class="btn btn-primary rounded" value="Visa Rejected">
                </td>
            </tr>
        </table>
        </form>
    </center>
    </div>
  </div>
</div>
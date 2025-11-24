<!-- Modal -->
<div class="modal fade" id="urnCallHistory" data-bs-backdrop="static" data-bs-keyboard="false" tabindex="-1" aria-labelledby="urnCallHistoryLabel" aria-hidden="true">
  <div class="modal-dialog modal-dialog-centered">
    <div class="modal-content container p-3" style="width:400px;">
    <center>
        <form name="call_management_form" action="update_call_history.php" method="post">

        <table class="table table-sm table-borderless w-auto fs-9">

        <tr>
        <td valign="middle">Type</td>
        <td>
        <select class="form-select form-select-sm" name="call_type" required>
        <option value="">Select Type</option>
        <option value="0">Inward</option>
        <option value="1">Outward</option>
        </td>
        </tr>

        <tr>
        <td valign="top" nowrap>Date & Time</td>
        <td>
        <input type="date" class="form-control form-control-sm" id="callback_datentime" name="date" min="<?=date('Y-m-d',strtotime('-10 days'))?>" max="<?=date('Y-m-d',strtotime('today'))?>" required>
        <input type="time" class="form-control form-control-sm mt-1" id="callback_datentime1" name="time" min="09:00" max="18:00" required>
        </td>
        </tr>

        <tr>
        <td valign="top">Note/Remark</td>
        <td>
        <textarea class="form-control form-control-sm" name="call_remark" placeholder="Call Note/Remark" required></textarea>
        </td>
        </tr>

        <tr>
        <td colspan="2" align="center">
        <input type="hidden" name="lead_id" value="<?=$_REQUEST['lead_id']?>">
        <input type="button" class="btn btn-danger btn-sm rounded mt-3" data-bs-dismiss="modal" value="Cancel">
        <input type="submit" value="Update Call History" class="btn btn-sm btn-primary rounded mt-3">
        </td>
        </tr>

        </table>

        </form>
    </center>
    </div>
  </div>
</div>
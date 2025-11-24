<form name="call_management_form" action="update_call_log.php" method="post">

  <table class="table table-sm table-borderless w-auto fs-9">

  <tr>
  <td valign="middle">Category</td>
  <td>
  <select class="form-select form-select-sm" name="call_attended" onChange="setCallbackOptional(this.value)" required>
  <option value="">Select Category</option>
  <option value="1">Telephonic</option>
  <option value="2">Email</option>
  <option value="3">Meeting</option>
  <option value="4">Written</option>
  </td>
  </tr>

  <tr>
  <td valign="middle">Type</td>
  <td>
  <select class="form-select form-select-sm" name="call_attended" onChange="setCallbackOptional(this.value)" required>
  <option value="">Select Type</option>
  <option value="0">Inward</option>
  <option value="1">Outward</option>
  </td>
  </tr>

  <tr>
  <td valign="middle" nowrap>Current Date-Time</td>
  <td>
  <input type="datetime-local" class="form-control form-control-sm" name="current_call_datentime" required>
  </td>
  </tr>

  <tr>
  <td valign="middle">Call Attended</td>
  <td>
  <select class="form-select form-select-sm" name="call_attended" onChange="setCallbackOptional(this.value)" required>
  <option value="">Customer Response</option>
  <option value="1">Yes</option>
  <option value="0">No</option>
  </td>
  </tr>
  
  <tr>
  <td valign="middle" nowrap>Set Callback</td>
  <td>
  <input type="datetime-local" class="form-control form-control-sm" id="callback_datentime" name="callback_datentime" required>
  </td>
  </tr>

  <tr>
  <td valign="middle">Note/Remark</td>
  <td>
  <input type="text" class="form-control form-control-sm" name="call_remark" placeholder="Call Note/Remark" required>
  </td>
  </tr>

  <tr>
  <td colspan="2" align="center">
  <input type="hidden" name="lead_id" value="<?=$_REQUEST['lead_id']?>">
  <input type="button" class="btn btn-danger btn-sm rounded mt-3" data-bs-dismiss="modal" value="Cancel">
  <input type="submit" value="Update Communication Log" class="btn btn-sm btn-primary rounded mt-3">
  </td>
  </tr>

  </table>

  </form>
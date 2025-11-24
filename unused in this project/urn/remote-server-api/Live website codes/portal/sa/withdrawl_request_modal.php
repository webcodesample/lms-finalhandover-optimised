<!-- Modal -->
<div class="modal fade" id="withdrawlRequest" data-bs-backdrop="static" data-bs-keyboard="false" tabindex="-1" aria-labelledby="withdrawlRequestLabel" aria-hidden="true">
  <div class="modal-dialog modal-dialog-centered">
    <div class="modal-content container p-3 pb-0" style="width:200px;">
    <center>
        <form action="request_withdrawl.php" method="post">
        <input type="hidden" name="wallet_id" value="<?=$wallet_id?>">
        <table class="table table-sm table-borderless w-auto">
            <tr>
                <td align="center">
                    <input type="number" name="amount" min="1" max="<?=$withdrwable_balance?>" class="form-control form-control-sm" placeholder="Enter Amount" required>
                </td>
            </tr>
            <tr>
                <td align="center">
                    <input type="button" class="btn btn-sm btn-danger rounded" data-bs-dismiss="modal" value="Cancel">
                    <input type="submit" class="btn btn-sm btn-primary rounded" value="Submit">
                </td>
            </tr>
        </table>
        </form>
    </center>
    </div>
  </div>
</div>
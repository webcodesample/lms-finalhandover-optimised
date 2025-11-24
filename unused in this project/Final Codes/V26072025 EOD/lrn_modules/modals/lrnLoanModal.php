<!-- Modal -->
<div class="modal fade" id="lrnLoanModal" data-bs-backdrop="static" data-bs-keyboard="false" tabindex="-1" aria-labelledby="staticBackdropLabel" aria-hidden="true">
  <div class="modal-dialog modal-xl modal-dialog-centered">
    <div class="modal-content container p-3 w-auto">
        <h5 class="text-danger text-center mb-3">Loan Detail</h5>
        <?php include_once("../lrn_modules/lrn_loan_detail.php"); ?>               
    </div>
  </div>
</div>
<script>
$(document).ready(function () {
$("#lrnLoanModal").on("shown.bs.modal", function () {
        $("#product_id").autocomplete({
            source: "../livesearch/product-ajax.php",
            appendTo: "#lrnLoanModal"
        });
        $("#introducer_id").autocomplete({
            source: "../livesearch/introducer-ajax.php",
            appendTo: "#lrnLoanModal"
        });
    });
 });
</script>


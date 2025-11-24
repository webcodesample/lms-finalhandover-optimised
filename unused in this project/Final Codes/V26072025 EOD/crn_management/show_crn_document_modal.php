<!-- Modal -->
<div class="modal fade" id="showCRNDocument" tabindex="-1" aria-labelledby="showCRNDocumentLabel" aria-hidden="true">
	<div class="modal-dialog modal-dialog-centered">
		<div class="modal-content">
			<div class="modal-body">
				<center>
					<h5 id="docTitle" class="mb-3"></h5>
					<img id="crnDoc" width="400px">
				</center>
			</div>
		</div>
	</div>
</div>

<script>
function showCRNDocument(imgPath,docTitle)
{
	$('#docTitle').html('CRN Document : '+docTitle);
	$('#crnDoc').attr('src',imgPath);
}
</script>
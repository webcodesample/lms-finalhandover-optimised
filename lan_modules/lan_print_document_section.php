<div class="d-flex my-3 bg-warning-subtle ps-2">
<h5 class="my-2">Documents List - Required</h5>
</div>

<div class="ms-5 d-flex gap-1 flex-wrap">
<?php
$query_predefined_document_list = "SELECT * FROM document_list WHERE is_required = 1 ORDER BY name ASC";
$predefined_documents = mysqli_query($con, $query_predefined_document_list);

while($predefined_document = mysqli_fetch_assoc($predefined_documents))
{
	$document_upload_status = documentUploadStatus($lan['lrn'],$predefined_document['uploaded_file_name'],$con);
	$checked_status = "<div class='me-2 fs-9'>&#9745;</div>";

	if(str_contains($document_upload_status,'Not Uploaded'))
	$checked_status = "<div class='me-2 fs-7'>&#9744;</div>";

	echo "<div class='d-flex align-items-center' style='width:200px;'>".$checked_status."<div>".$predefined_document['name']."</div></div>";
}
?>
</div>

<div class="d-flex my-3 bg-warning-subtle ps-2 gap-1 align-items-center">
<h5 class="my-2">Documents List - Optional</h5>
(Company related documents are mandatory for corporate customer)
</div>

<div class="ms-5 d-flex gap-1 flex-wrap">
<?php
$query_predefined_document_list = "SELECT * FROM document_list WHERE is_required = 0 ORDER BY name ASC";
$predefined_documents = mysqli_query($con, $query_predefined_document_list);

while($predefined_document = mysqli_fetch_assoc($predefined_documents))
{
	$document_upload_status = documentUploadStatus($lan['lrn'],$predefined_document['uploaded_file_name'],$con);
	$checked_status = "<div class='me-2 fs-9'>&#9745;</div>";

	if(str_contains($document_upload_status,'Not Uploaded'))
	$checked_status = "<div class='me-2 fs-7'>&#9744;</div>";

	echo "<div class='d-flex align-items-center' style='width:200px;'>".$checked_status."<div>".$predefined_document['name']."</div></div>";
}
?>
</div>

<div class="d-flex my-3 bg-warning-subtle ps-2">
<h5 class="my-2">Documents Submitted</h5>
</div>

<div class="ms-5 d-flex gap-1 flex-wrap">
<?php
$query_predefined_document_list = "SELECT * FROM document_list ORDER BY name ASC";
$predefined_documents = mysqli_query($con, $query_predefined_document_list);

$documentList = "";

while($predefined_document = mysqli_fetch_assoc($predefined_documents))
{
	$document_upload_status = documentUploadStatus($_REQUEST['lrn'],$predefined_document['uploaded_file_name'],$con);
	
	if(!str_contains($document_upload_status,'Not Uploaded'))
	$documentList .= "<li>".$predefined_document['name']."</li>";
}

echo "<ol>".$documentList."</ol>";
?>
</div>
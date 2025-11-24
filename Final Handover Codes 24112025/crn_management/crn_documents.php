<div class="text-end">
<button type="button" class="btn btn-sm btn-subtle-info py-1 px-2" data-bs-toggle="modal" data-bs-target="#addCRNDocument">Add Document</button>
</div>

<table class="table table-sm table-hover table-bordered mt-3 mb-1 fs-9">

<thead>
	<tr class="table-info">
		<th>#</th>
		<th>Document</th>		
		<th>Action</th>
	</tr>
</thead>

<tbody>

<?php
$document_path = glob("../crn_documents/".$_REQUEST['crn']."/*.*");

for($i=0; $i < count($document_path); $i++)
{
	$document_path_explorer = explode('/',$document_path[$i]);
	$document_name = explode('.',$document_path_explorer[count($document_path_explorer)-1]);
	$document_title = $document_name[0];

	$deleteBtn = "<a href='delete_crn_document.php?document=".$document_path[$i]."&crn=".$_REQUEST['crn']."' onClick='return confirm(&quot;Are you sure to delete ".$document_title."?&quot;)'><img src='../portal-icons/delete.png' height='20px'></a>";

	echo "<tr>
			<td class='ps-2'>".($i+1)."</td>
			<td><a href='#' data-bs-toggle='modal' data-bs-target='#showCRNDocument' onClick='showCRNDocument(&quot;".$document_path[$i]."&quot;,&quot;".strtoupper($document_title)."&quot;)'>".strtoupper($document_title)."</a></td>
			<td>".$deleteBtn."</td>
		</tr>";
}

if(count($document_path) == 0)
{
	echo "<tr><td colspan='9' class='text-center text-danger bg-danger-subtle fw-semibold'>No Document Added</td></tr>";
}
?>
</tbody>
</table>

<?php 
include_once("add_crn_document_modal.php");
include_once("show_crn_document_modal.php");
?>
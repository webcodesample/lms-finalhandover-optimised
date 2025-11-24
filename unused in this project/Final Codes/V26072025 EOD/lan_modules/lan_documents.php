<?php
//get uploaded document lists    
$folder = "../lrn/la".$lan['lrn'];

$query_get_uploaded_document_list = "SELECT * FROM lrn_document_upload_history WHERE lrn = '".$lan['lrn']."' AND is_deleted = 0 ORDER BY datentime DESC";
$result_get_uploaded_document_list = mysqli_query($con, $query_get_uploaded_document_list);
$total_documents = mysqli_num_rows($result_get_uploaded_document_list);
?>

<div class="d-flex justify-content-between">
<h5 class="text-info pt-2">Uploaded Documents</h5>
</div>

<div>
<table class="table table-sm table-bordered table-hover table-striped fs-9">
    <thead class="table-info text-center">
        <tr>
            <th>Name</th>
            <th>Date</th>
            <th>Time</th>
            <th>By</th>
            <th>Role</th>
            <th>Action</th>
        </tr>
    </thead>
    <tbody>

<?php
while($uploaded_document = mysqli_fetch_assoc($result_get_uploaded_document_list))
{
    if(substr($uploaded_document['upload_by'],0,2) == 'CR')
    {
        $upload_by = getFieldValue('name','id',substr($uploaded_document['upload_by'],2),'customers_list',$con);
        $uploader_type_id = 5;
    }
    else if(substr($uploaded_document['upload_by'],0,2) == 'BS')
    {
        $upload_by = getFieldValue('name','id',substr($uploaded_document['upload_by'],2),'staff_list',$con);
        $uploader_type_id = getFieldValue('role_type','id',substr($uploaded_document['upload_by'],2),'staff_list',$con);
    }
    else if(substr($uploaded_document['upload_by'],0,2) == 'PV')
    {
        $upload_by = "Portal Visitor";
        $uploader_type_id = 9;
    }

    if(isset($uploader_type_id))
    $uploader_type = getFieldValue('description','id',$uploader_type_id,'login_type_list',$con);

    echo "<tr>
        <td class='ps-2'>".$uploaded_document['file_name']."</td>
        <td>".date('d-M-Y', $uploaded_document['datentime'])."</td>
        <td>".date('h:i:s A', $uploaded_document['datentime'])."</td>
        <td>".$upload_by."</td>
        <td>".$uploader_type."</td>
        <td align='center'>
        <a class='link-success text-decoration-none' href='".$folder."/".$uploaded_document['file_name']."' target='_blank'>
        <span class='text-primary' data-feather='eye' style='height: 20px; width: 20px;'></span>
        </a>
        </td>
        </tr>";
}

if($total_documents == 0)
echo "<tr><td colspan='6' class='text-danger text-center fw-bold'>No Document Uploaded</td></tr>";
?>

</tbody>
</table>
</div>
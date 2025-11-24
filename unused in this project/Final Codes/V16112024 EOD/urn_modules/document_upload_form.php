<?php
if($urn_using_by_me)
{
    $form_start = "<form action='upload_documents.php' method='post' enctype='multipart/form-data'>";
    $form_end = "<input type='hidden' name='urn' value='".$lead['urn']."'>
                <input type='hidden' name='lead_id' value='".$_REQUEST['lead_id']."'>
                </form>";
}
else
{
    $form_start = "";
    $form_end = "";
}
?>
<h6 class="text-danger">Note : * marked documents are manadatory for verification purpose.</h6>
<?php
    echo $form_start;
    $query_view_predefined_document_list = "SELECT * FROM document_list";
    $result_view_predefined_document_list = mysqli_query($con, $query_view_predefined_document_list);
    $total_predefined_documents = mysqli_num_rows($result_view_predefined_document_list);
    echo "<div class='pt-3'><table class='table table-sm table-borderless w-auto fs-9'>";
    $iframe_column = "";
    while($predefined_document_list = mysqli_fetch_assoc($result_view_predefined_document_list))
    {
        $accepted_type = getAcceptedImageType($predefined_document_list['name'],$predefined_document_list['uploaded_file_name']);
        $star_display = displayRequired($predefined_document_list['is_required']);
        $document_upload_status = documentUploadStatus($lead['urn'],$predefined_document_list['uploaded_file_name'],$con);

        if($predefined_document_list['id'] == 1)
        {
            echo "<tr>
                <td valign='middle'>".$predefined_document_list['name'].$star_display.$document_upload_status."</td>
                <td class='ps-5'>
                <input type='file' class='form-control form-control-sm' name='".$predefined_document_list['uploaded_file_name']."' accept='".$accepted_type."' ".$field_visibility.">
                </td>
                <td valign='top' rowspan='".($total_predefined_documents+2)."' class='ps-5'>
                <iframe id='preview' class='border border-secondary' style='width:400px;height:380px;display:none;'></iframe>
                </td>
                </tr>";
        }
        else
        {
            echo "<tr>
                <td valign='middle'>".$predefined_document_list['name'].$star_display.$document_upload_status."</td>
                <td class='ps-5'>
                <input type='file' class='form-control form-control-sm' name='".$predefined_document_list['uploaded_file_name']."' accept='".$accepted_type."' ".$field_visibility.">
                </td>
                </tr>";
        }
    }
    echo "<tr>
        <td valign='middle'>Additional Documents</td>
        <td class='ps-5'><input type='file' class='form-control form-control-sm' name='more_documents[]' id='more_documents' accept='.jpeg,.jpg,.pdf' onChange='checkDocsLimit()' multiple ".$field_visibility."></td>
        </tr>
        <tr>
        <td colspan='2' align='center'><br>
        <input type='hidden' name='return_url' value='urn_history.php?lead_id=".$_REQUEST['lead_id']."&tab=documents'>
        <button type='submit' class='btn btn-primary btn-sm m-1 ".setBtnVisibilityClass($urn_using_by_me)."' ".$field_visibility." onClick='return makeConfirm(&quot;upload&quot;)'>Upload Documents</button>
        <input type='button' class='btn btn-danger btn-sm m-1' id='btn_hide_preview' onClick='hidePreview()' value='Close Preview' disabled>
        </td>
        </tr>";
    echo "</table></div>";
    echo $form_end;
?>
<!-- Modal -->
<div class="modal fade" id="uploadDocumentModal" data-bs-backdrop="static" data-bs-keyboard="false" tabindex="-1" aria-labelledby="staticBackdropLabel" aria-hidden="true">
  <div class="modal-dialog modal-dialog-centered">
    <div class="modal-content container p-3">
    <center>
        <h6 class="text-danger">Note : * marked documents are manadatory for verification purpose.</h6>
        <form action="upload_documents.php" method="post" enctype="multipart/form-data">
        <input type="hidden" name="lrn" value="<?=$_REQUEST['lrn']?>">
        <input type="hidden" id="fileCount" value=0>

        <div class="pt-3">
        <table class="table table-sm table-borderless w-auto fs-9">
        
        <?php
        $query_view_predefined_document_list = "SELECT * FROM document_list";
        $result_view_predefined_document_list = mysqli_query($con, $query_view_predefined_document_list);
        $total_predefined_documents = mysqli_num_rows($result_view_predefined_document_list);

        while($predefined_document_list = mysqli_fetch_assoc($result_view_predefined_document_list))
        {
            $file_input_visibility = 'disabled';
            if($predefined_document_list['uploaded_file_name'] !== 'signed_agreement')
            {
                $accepted_type = getAcceptedImageType($predefined_document_list['name'],$predefined_document_list['uploaded_file_name']);
                $star_display = displayRequired($predefined_document_list['is_required']);
                $document_upload_status = documentUploadStatus($lrn['lrn'],$predefined_document_list['uploaded_file_name'],$con);

                if(str_contains($document_upload_status,'Not Uploaded') && $field_visibility == '')
                $file_input_visibility = '';

                echo "<tr>
                        <td valign='middle'>".$predefined_document_list['name'].$star_display.$document_upload_status."</td>
                        <td class='ps-5 py-0'>
                        <input type='file' ".$input_box_design." name='".$predefined_document_list['uploaded_file_name']."' accept='".$accepted_type."' ".$file_input_visibility." onChange='setFileCount(this.value)'>
                        </td>
                        </tr>";
            }
        }
        echo "<tr>
            <td valign='middle'>Additional Documents</td>
            <td class='ps-5 py-0'><input type='file' ".$input_box_design." name='more_documents[]' id='more_documents' accept='.jpeg,.jpg,.pdf' onChange='checkDocsLimit(); setFileCount(this.value);' multiple ".$field_visibility."></td>
            </tr>";
        ?>
        </table>
        </div>        
        <input type="reset" class="btn btn-sm btn-subtle-danger rounded" data-bs-dismiss="modal" value="Cancel">
        <button type="submit" class="btn btn-sm btn-subtle-success rounded <?=setBtnVisibilityClass($lrn_using_by_me)?> <?=$field_visibility?>" onClick="return checkFileCount()">
        <img src="../portal-icons/upload.png" height="16px" class="me-1">Upload Document
        </button>
        </form>
    </center>
    </div>
  </div>
</div>

<script>
function setFileCount(val)
{
    if(val)
    $('#fileCount').val(parseInt($('#fileCount').val())+1);
}

function checkFileCount()
{
    let checkFlag = false;

    if($('#fileCount').val() > 0)
    checkFlag = makeConfirm('Are you sure to upload...');

    if(checkFlag == false)
    alert('Please select atleast one file');

    return checkFlag;
}
</script>
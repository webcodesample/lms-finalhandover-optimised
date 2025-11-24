function setPageIndex(pageindex)
{
    $("#page_index").val(pageindex);
    $("#search_form").submit();
}

function showPreview($file_path) {
    //alert($file_path);
    $("#preview").show();
    $("#preview").attr('src', $file_path);
    $("#btn_hide_preview").attr('disabled', false);
}
function hidePreview() {
    $("#preview").hide();
    $("#btn_hide_preview").attr('disabled', true);
}

function setCallbackOptional($call_attended) {
    if ($call_attended > 0)
        $("#callback_datentime").attr('disabled', false);
    else
        $("#callback_datentime").attr('disabled', true);
}

function liveSearch()
{
    $("#search_form").submit();
}

function updateURNProfile() {
    $("#action_perform").val('update_profile');
    $("#urn_profile_form").attr('action', 'update_profile.php');
    $("#urn_profile_form").submit();
}
function updateURNStatus() {
    $("#action_perform").val('update_status');
    $("#urn_profile_form").attr('action', 'update_status.php');
    $("#urn_profile_form").submit();
}

function checkDocsLimit()
{
    if ($("#more_documents")[0].files.length > 2)
    {
        alert('You Can Select 2 files Only');
        $("#more_documents").val('');
    }
}

function updateURNCourse()
{
    if ($('input[name=course_id]:checked').val() != null)
        $("#urn_course_selection_form").submit();
    else
        alert("Please Select A Course");
}

function showAddDiv() {
    $("#add_div").toggle();
    $("#edit_div").hide();
}

function showEditDiv(doc_id,doc_name,upload_file_name) {
    $("#add_div").hide();
    $("#edit_div").show();
    $("#selected_document_id").val('Document ID : ' + doc_id);
    $("#document_name").val(doc_name);
    $("#upload_file_name").val(upload_file_name);
    $("#document_id").val(doc_id);
}

function setAgentType(type) {
    if (type == 1) {
        $("#company_name").attr('disabled', false);
        $("#company_address").attr('disabled', false);
        $("#company_website").attr('disabled', false);
    }
    else {
        $("#company_name").attr('disabled', true);
        $("#company_address").attr('disabled', true);
        $("#company_website").attr('disabled', true);
    }
}

function showhideCompanySection(type) {
    if (type == 1) {
        $("#company_sec_a").show();
        $("#company_sec_b").show();
        $("#company_name").attr('disabled', false)
        $("#company_sec_c").show();
        $("#company_address").attr('disabled', false)
        $("#company_website").attr('disabled', false)
    }
    else {
        $("#company_sec_a").hide();
        $("#company_sec_b").hide();
        $("#company_name").attr('disabled', true)
        $("#company_sec_c").hide();
        $("#company_address").attr('disabled', true)
        $("#company_website").attr('disabled', true)
    }

}

function validateCourseSubmit() {
    if ($("input[name='course_intake[]']:checked").length > 0)
    {
        return true;
    }
    else {
        alert("Please Select Any Intake");
        return false;
    }
}

function addMoreInputField()
{
    var inputFields = document.getElementsByName('step_order[]');
    var new_step_order = inputFields.length + 1;
    newField = '<div class="d-flex"><input type="text" name="description[]" class="form-control form-control-sm m-1" style="width:200px;" placeholder="Status Description" required><input type="text" name="step_order[]" class="form-control form-control-sm m-1" style="width:200px;" value="' + new_step_order +'" readonly></div>';
    $("#addMore").append(newField);
}

function addMoreSourceField() {
    newField = '<input type="text" name="description[]" class="form-control form-control-sm m-1" style="width:200px;" placeholder="Lead Source Description" required>';
    $("#addMoreSource").append(newField);
}

function showAllocationOption(type)
{    
    if (type == 'SP') {
        $("#sp").attr('disabled', false);
        $("#sa").attr('disabled', true);
    }
    else if (type == 'SA') {
        $("#sa").attr('disabled', false);
        $("#sp").attr('disabled', true);
    }
    $("#assign_btn").attr('disabled', false);
}

function printURN()
{
    $("center").addClass("border border-danger py-5 vh-100 vw-100")
    var divName = "myPrintableDiv"; // Replace with your table's div ID
    var printContents = $("#myPrintableDiv").html();
    var originalContents = $("body").html();
    $("body").html(printContents);
    window.print();
    $("body").html(originalContents); // Restore the original content
    $("center").removeClass("border border-danger py-5 vh-100 vw-100")
}

function validateWRSelection() {
    if ($("input[name='withdrawl_request[]']:checked").length > 0) {
        return true;
    }
    else {
        alert("Please Select Any One Request");
        return false;
    }
}

function validateCheckboxCount(fieldName,alertMsgSuffix) {
    if ($("input[name='" + fieldName +"[]']:checked").length > 0) {
        return true;
    }
    else {
        alert("Please Select Any One " + alertMsgSuffix);
        return false;
    }
}

function showIframe(src) {
    $("#iframe_a").attr('src', src);
}

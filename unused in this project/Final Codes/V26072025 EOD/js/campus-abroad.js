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

function printData(printPageTitle)
{
    var divName = "myPrintableDiv"; // Replace with your pritable div ID
    var printContents = $("#myPrintableDiv").html();
    var originalContents = $("body").html();
    if (printPageTitle)
        $("body").html("<header><img src='../images/ca-logo.png' height='30px'></header><center><h5>" + printPageTitle + "</h5></center>" + printContents);
    else
        $("body").html("<header><img src='../images/ca-logo.png' height='30px'></header>" + printContents);
    window.print();
    $("body").html(originalContents); // Restore the original content
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

function checkEmailUniqueness(inputFieldID, refID = '') {
    var emailID = $("#" + inputFieldID).val();
    $.ajax({
        url: "../ajax_files/checkEmailUniqueness_ajax.php",
        type: "post",
        data: {
            email: emailID,
            ref_id: refID,
        },
        success: function (response) {
            if (response == 1) {
                alert('Email Already Exist!');
                $("#" + inputFieldID).val('');
                $("#" + inputFieldID).focus();
            }
        }
    });
}

function checkMobileUniqueness(inputFieldID, refID = '') {
    var mobile = $("#" + inputFieldID).val();
    $.ajax({
        url: "../ajax_files/checkMobileUniqueness_ajax.php",
        type: "post",
        data: {
            number: mobile,
            ref_id: refID,
        },
        success: function (response) {
            if (response == 1) {
                alert(inputFieldID.toUpperCase() +' Number Already Exist!');
                $("#" + inputFieldID).val('');
                $("#" + inputFieldID).focus();
            }
        }
    });
}

function getTop5Sources() {
    $.ajax({
        url: "../ajax_files/gettop5sources_ajax.php",
        type: "post",
        data: {
            performance_by: $("#performance_by").val(),
        },
        success: function (response) {
            $("#top5_sources").html(response);
        }
    });
}

function getTop5Universities() {
    $.ajax({
        url: "../ajax_files/gettop5universities_ajax.php",
        type: "post",
        data: {
            university_performance_by: $("#university_performance_by").val(),
        },
        success: function (response) {
            $("#top5_universities").html(response);
        }
    });
}

function addDataToURNDocumentDeletionModal(ID) {
    $("#uploaded_document_id").val(ID);
}

function makeConfirm(confirmationMsgSuffix) {
    return confirm("Are you sure want to " + confirmationMsgSuffix + "?");
}

function searchToggle() {
    $("#search_form").toggleClass("d-none");
}

function setSearchFlag(inputFieldValue) {
    if (inputFieldValue != '')
        $("#search_flag").val(1);
}
function validateSearchForm() {
    if ($("#search_flag").val() == 1)
        return true;
    else
    {
        alert("Please enter valid search input...");
        return false;
    }
}

function addEmailRecipient() {
    $("#recipient_counter").val(parseInt($("#recipient_counter").val()) + 1);
    recipientCounter = $("#recipient_counter").val();
    $("#recipient").append("<div class='d-flex' id='to_email_" + recipientCounter + "'><input type='email' name='to_email[]' class='form-control form-control-sm m-1' style='width:200px;' placeholder='Recipient/To Email' required><a href='#' class='m-2' onClick='removeEmailRecipient(&quot;to_email_" + recipientCounter + "&quot;)'><img src='../portal-icons/delete.png' height='25px'></a></div>");
}

function removeEmailRecipient(recipientID) {
    $("#" + recipientID).remove();
    $("#recipient_counter").val($("#recipient_counter").val() - 1);
}

function selectAll(checkAll) {
    if (checkAll == true)
        $("input[name='linked_action[]']").prop('checked', true);
    else
        $("input[name='linked_action[]']").prop('checked', false);
}

function countCheckboxChecked() {
    checkBoxCount = $("input[name='linked_action[]']").length;
    checkBoxCountChecked = $("input[name='linked_action[]']:checked").length;
    if (checkBoxCount == checkBoxCountChecked)
        $("#checkAll").prop('checked', true);
    else
        $("#checkAll").prop('checked', false);
}

function freezWithdrawal() {
    $("#request_withdrawal_btn").attr("disabled", true);
    return true;
}

function setSubmenuItems(menuItemID, checkStatus) {
    let submenuCount = $("#submenu_count_" + menuItemID).val();
    let submenuCountSelected = $("#selected_submenu_count_" + menuItemID).val();

    for (i = 1; i <= submenuCount; i++) {
        if (checkStatus == true) {
            $("#submenu_" + menuItemID + "_" + i).prop("checked", true);
            $("#selected_submenu_count_" + menuItemID).val(submenuCount);
        }
        else if (checkStatus == false) {
            $("#submenu_" + menuItemID + "_" + i).prop("checked", false);
            $("#selected_submenu_count_" + menuItemID).val(0);
        }
    }
}

function setMenuItem(menuItemID, checkStatus) {
    let submenuCount = $("#submenu_count_" + menuItemID).val();
    let submenuCountSelected = $("#selected_submenu_count_" + menuItemID).val();

    if (checkStatus == true)
        submenuCountSelected++;
    else if (checkStatus == false)
        submenuCountSelected--;

    $("#selected_submenu_count_" + menuItemID).val(submenuCountSelected);

    if (submenuCountSelected == 0)
        $("#menuitem_" + menuItemID).prop("checked", false);
    else
        $("#menuitem_" + menuItemID).prop("checked", true);
}
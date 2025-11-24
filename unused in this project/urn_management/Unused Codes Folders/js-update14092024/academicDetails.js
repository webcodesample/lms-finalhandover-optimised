function toggleTestOptions(tvalue) {
	if (tvalue > 0)
		$("#new").removeClass('d-none');
	else
		$("#new").addClass('d-none');
}

function showVal(tVal) {
	if ($("#" + tVal).prop('checked') == true)
		$("#" + tVal + "_proof").attr('disabled', false);
	else
		$("#" + tVal + "_proof").attr('disabled', true);
}

function showOthers(tVal) {
	if ($("#" + tVal).prop('checked') == true) {
		$("#add_other").removeClass("d-none");
		$("#other_test_name").attr("disabled", false);
		$("#other_test_proof").attr("disabled", false);
	}
	else {
		$("#add_other").addClass("d-none");
		$("#other_test_inputs").html('');
		$("#other_test_name").attr("disabled", true);
		$("#other_test_proof").attr("disabled", true);
	}
}

function addOtherTestInput() {
	$("#other_test_inputs").append("<div class='d-flex'><input type='text' name='other_test_name[]' class='form-control form-control-sm me-1 my-1' style='width:200px;' placeholder='Test Name' required><input type='file' name='other_test_proof[]' class='form-control form-control-sm me-1 my-1' style='width:200px;'></div>");
}

function toggleInput(inputFieldId) {
	if ($("#" + inputFieldId).val() == '') {
		if (confirm("Are you sure to remove?\nThis is not reversible")) {
			$("#" + inputFieldId).attr("disabled", true);
			$("#" + inputFieldId + "_proof").attr("disabled", true);
		}
	}
}

function setMinToYear(fromYearVal,selToYear) {
	$.ajax({
		url: "../ajax_files/setMinToYear_ajax.php",
		type: "post",
		data: {
			minVal: fromYearVal,
			selectedYear: selToYear,
		},
		success: function (response) {
			$("#highest_education_to_year").html(response);
		}
	});
}
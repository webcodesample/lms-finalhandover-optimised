function searchToggle() {
	$("#search_form").toggleClass("d-none");
}

function validateSearchForm() {
	if ($("#search_name").val() == '' && $("#search_email").val() == '' && $("#search_mobile").val() == '' && $("#search_source").val() == '') {
		alert("Please enter valid search input...");
		return false;
	}
	else
		return true;
}
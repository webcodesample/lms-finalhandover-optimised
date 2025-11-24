//get university dropdown as per selected country
function getUniversityList()
{
	$.ajax({
		url: "../ajax_files/getUniversityList_ajax.php",
		type: "post",
		data: {
				country: $("#country").val(),
				},
		success: function(response)
		{
			$("#university").attr('disabled',false);
			$("#university").html(response);
		}
	});
}

//get course list dropdown as per selected university & country
function getCourseList(inputVal)
{
	let university;

	if(inputVal == '')
		university = '';
	else
		university = $("#university").val();

	$.ajax({
		url: "../ajax_files/getCourseList_ajax.php",
		type: "post",
		data: {
				university: university,
				},
		success: function(response)
		{
			$("#course").attr('disabled',false);
			$("#course").html(response);
		}
	});
}

//function to enable/disable search btn on course finder search form
function enableSearchBtn()
{
	if($("#keyword").val() || $("#country").val() || $("#university").val() || $("#course").val() || $("#type").val() || $("#intake").val() || $("#eligibility").val() || $("#duration").val() || $("#fee").val() || $("#scholarship_available").val())
	$("#search_btn").attr('disabled',false);
	else
	$("#search_btn").attr('disabled',true);
}

//function to clear filter values in search form of course finder page
function clearFilter()
{
	$("#keyword").val('');
	$("#country").val('');
	$("#university").val('');
	$("#course").val('');
	$("#type").val('');
	$("#intake").val('');
	$("#eligibility").val('');
	$("#duration").val('');
	$("#fee").val('');
	$("#scholarship_available").val('');
	enableSearchBtn();
}
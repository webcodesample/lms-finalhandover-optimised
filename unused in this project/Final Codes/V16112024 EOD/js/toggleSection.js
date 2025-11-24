function toggleSection(sectionName) {
	let count = <?= $i ?>;
	for (i = 1; i <= count; i++) {
		$("#" + sectionName + "_" + i).toggleClass('d-none');
		if ($("#" + sectionName + "_btn_" + i).text() == '+') {
			$("#" + sectionName + "_btn_" + i).text("-");
			$("#" + sectionName + "_btn_" + i).removeClass("btn-subtle-danger");
			$("#" + sectionName + "_btn_" + i).addClass("btn-subtle-success");
		}
		else {
			$("#" + sectionName + "_btn_" + i).text("+");
			$("#" + sectionName + "_btn_" + i).removeClass("btn-subtle-success");
			$("#" + sectionName + "_btn_" + i).addClass("btn-subtle-danger");
		}
	}
}

function toggleAllSections() {
	let count = <?= $i ?>;

	toggleSection('personal_detail');
	toggleSection('highest_education_detail');
	toggleSection('course_selection_detail');

	for (i = 1; i <= count; i++) {
		if ($("#all_detail_btn_" + i).text() == '+') {
			$("#all_detail_btn_" + i).text("-");
			$("#all_detail_btn_" + i).removeClass("btn-subtle-danger");
			$("#all_detail_btn_" + i).addClass("btn-subtle-success");
		}
		else {
			$("#all_detail_btn_" + i).text("+");
			$("#all_detail_btn_" + i).removeClass("btn-subtle-success");
			$("#all_detail_btn_" + i).addClass("btn-subtle-danger");
		}
	}
}
$(document).ready(function () {
    $("#course").autocomplete({
        source: "../livesearch/course-ajax.php"
    });
    $("#course_type").autocomplete({
        source: "../livesearch/course_type-ajax.php"
    });
    $("#course_eligibility").autocomplete({
        source: "../livesearch/course_eligibility-ajax.php"
    });
    $("#university").autocomplete({
        source: "../livesearch/university-ajax.php"
    });
    $("#country").autocomplete({
        source: "../livesearch/country-ajax.php"
    });
});
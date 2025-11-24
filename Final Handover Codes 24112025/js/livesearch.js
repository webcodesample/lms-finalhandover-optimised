$(document).ready(function () {
    $("#introducer_id").autocomplete({
        source: "../livesearch/introducer-ajax.php"
    });
    $("#product_id").autocomplete({
        source: "../livesearch/product-ajax.php"
    });
});
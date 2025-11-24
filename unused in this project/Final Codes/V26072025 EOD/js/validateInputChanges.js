function validateInputChanges(inputs) {
    let flag = false;

    $.each(inputs, function (index, value) {
        if ($('#' + index).prop('type') == 'date') {
            value = formatDate(value*1000);
        }

        if ($('#' + index).val() && (value !== $('#' + index).val()))
            flag = true;
    });

    if (flag == false)
        alert("Atleast one value should be different from old");

    return flag;
}

function formatDate(timestamp) {
    var date = new Date(timestamp);

    var year = date.getFullYear();
    var month = ('0' + (date.getMonth() + 1)).slice(-2); // Months are 0-based
    var day = ('0' + date.getDate()).slice(-2);

    return year + '-' + month + '-' + day;
}
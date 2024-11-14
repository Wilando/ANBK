window.formValidation = function(error) {
    const errorServer = error.response.data.errors;
    Object.keys(errorServer).forEach(error => {
        $(`#${error}`).addClass("is-invalid");
        $(`#invalid-${error}`).text(`${errorServer[error]}`);
        //console.log(error, errorServer[error]);
    });
};

window.formValidationClear = function() {
    $(`input, select, textarea`).removeClass("is-invalid");
    $('[id^="invalid-"]').text('');
};
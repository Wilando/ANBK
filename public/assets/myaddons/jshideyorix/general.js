var Toast = Swal.mixin({
    toast: true,
    // position: 'top-end',
    showConfirmButton: false,
    timer: 1000
});

function tampilPesan(tipe, title, desc, position = "center") {
    Toast.fire({
        icon: tipe,
        title: title,
        text: desc,
        position: position,
        showConfirmButton: !1,
        timer: 1000,
    })
}


$("input").change(function () {
    // $(this).closest('.form-group').find('input.form-control').removeClass('is-invalid');
    // $(this).closest('.form-group').find('div.invalid-feedback').text('');
    $(this).removeClass('is-invalid');
    $(this).find('div.invalid-feedback').text('');
});
$("select").change(function () {
    $(this).removeClass('is-invalid');
    $(this).find('div.invalid-feedback').text('');
});










$(document).ready(function () {
    initMagnific();
    $(".selectFilterPembuat").select2({
        placeholder: "FILTER BERDASARKAN PEMBUAT DATA",
    });
});

//Initialize Select2 Elements
$('.select2').select2()

//Initialize Select2 Elements
$('.select2bs5').select2({
    theme: 'bootstrap-5',
})

function dialogPertanyaan(text = 'apakah anda ingin menghapus data ini', batal = 'data dibatalkan untuk dihapus', callfunction) {
    Swal.fire({
        title: text,
        icon: 'warning',
        showCancelButton: true,
        reverseButtons: true,
        confirmButtonText: 'Ya',
        cancelButtonText: 'Tidak',
    }).then((result) => {
        if (result.value) {
            callfunction;
        } else if (result.dismiss === "cancel") {
            tampilPesan('info', 'info', batal);
        }
    });
}

function changeTextFile(selectorinput) {
    document.getElementById(selectorinput).addEventListener('change', function (e) {
        var fileName = document.getElementById(selectorinput).files[0].name;
        var nextSibling = e.target.nextElementSibling
        nextSibling.innerText = fileName
    })
}

function set_date_time_now() {
    // var today = new Date();
    // var date = today.getFullYear() + '-' + (today.getMonth() + 1) + '-' + today.getDate();
    // var time = today.getHours() + ":" + today.getMinutes() + ":" + today.getSeconds();
    // return date + ' ' + time;

    var now = new Date();
    now.setMinutes(now.getMinutes() - now.getTimezoneOffset());
    return now.toISOString().slice(0, 16);
}


function check_int(evt) {
    var charCode = (evt.which) ? evt.which : event.keyCode;
    return (charCode >= 46 && charCode <= 57 || charCode == 8 || charCode == 32 || charCode == 40 || charCode == 41 || charCode == 43);
}

function name_to_url(name) {
    name = name.toLowerCase(); // lowercase
    name = name.replace(/[-]/g, ''); // remove everything that is not [a-z] or -
    name = name.replace(/^\s+|\s+$/g, ''); // remove leading and trailing whitespaces
    name = name.replace(/\s+/g, '-'); // convert (continuous) whitespaces to one -
    return name;
}

function handleAjaxError(jqXHR, textStatus, errorThrown) {
    // do something
}

function formatRupiah(angka, prefix) {

    if (angka == null) {
        return 0;
    }

    var number_string = angka.replace(/[^,\d]/g, "").toString(),
        split = number_string.split(","),
        sisa = split[0].length % 3,
        rupiah = split[0].substr(0, sisa),
        ribuan = split[0].substr(sisa).match(/\d{3}/gi);

    // tambahkan titik jika yang di input sudah menjadi angka ribuan
    if (ribuan) {
        separator = sisa ? "." : "";
        rupiah += separator + ribuan.join(".");
    }

    rupiah = split[1] != undefined ? rupiah + "," + split[1] : rupiah;
    return prefix == undefined ? rupiah : rupiah ? "" + rupiah : "";
}

function copyText(selector) {
    var $temp = $("<div>");
    $("body").append($temp);
    $temp.attr("contenteditable", true)
        .html($(selector).html()).select()
        .on("focus", function () {
            document.execCommand('selectAll', false, null);
        })
        .focus();
    document.execCommand("copy");
    $temp.remove();

    Toast.fire({
        icon: 'success',
        title: 'teks disalin',
    });
}

function tampil401(text) {
    Toast.fire({
        icon: 'warning',
        title: ' 401 unauthorized',
        text: '',
    });
}

function formatRupiah(angka, prefix) {
    var number_string = angka.replace(/[^,\d]/g, "").toString(),
        split = number_string.split(","),
        sisa = split[0].length % 3,
        rupiah = split[0].substr(0, sisa),
        ribuan = split[0].substr(sisa).match(/\d{3}/gi);

    // tambahkan titik jika yang di input sudah menjadi angka ribuan
    if (ribuan) {
        separator = sisa ? "." : "";
        rupiah += separator + ribuan.join(".");
    }

    rupiah = split[1] != undefined ? rupiah + "," + split[1] : rupiah;
    return prefix == undefined ? rupiah : rupiah ? "" + rupiah : "";
}

function previewImg(selector) {
    const idselector = '#' + selector;
    const logo = document.querySelector(idselector);
    //const logoLabel = document.querySelector('.custom-file-label');
    const logoPreview = document.querySelector('.img-preview_' + selector);
    //logoLabel.textContent = logo.files[0].name;

    const fileLogo = new FileReader();
    fileLogo.readAsDataURL(logo.files[0]);

    fileLogo.onload = function (e) {
        logoPreview.src = e.target.result;
    }
}

function initMagnific() {
    $('.image-popup-no-margins').magnificPopup({
        type: 'image',
        closeOnContentClick: true,
        fixedContentPos: true,
        mainClass: 'mfp-no-margins mfp-with-zoom', // class to remove default margin from left and right side
        image: {
            verticalFit: true
        },
    });
}


function cekinternet() {
    if (navigator.onLine) {
        return true;
    } else {
        return false;
    }
}

$("#check-all").click(function () {
    if ($(this).is(':checked')) {
        $(".data-check").prop('checked', $(this).prop('checked'));
    } else {
        $(".data-check").prop('checked', false);
    }
});

function initChangeStatus(urlData, reloadTable = true) {
    $(".changer-status").change(function () {
        valueStatus = $(this).attr('data-value');
        valueId = $(this).attr('data-id');
        setLabel = 'label-status' + valueId;
        $.ajax({
            url: urlData,
            type: "GET",
            data:
                {
                    id: valueId,
                    nilai: valueStatus,
                },
            success: function (data) {
                if (reloadTable === true) {
                    reloadTableSamePage();
                } else {
                    getRender(1)
                }
                tampilPesan(data.tipe, data.title, data.message);
            },
            error: function (xhr) {
                tampilPesan('error', xhr.responseText, '');
            }
        });
    });
}

function tampilSoftDelete() {
    $('#div_trash').hide();
    $('#div_opsi').show();
    $('#div_ekspor').show();
    $('#grupfilter').show();
    var tampilkan = $('input[name="tampilkan"]:checked').val();
    if (tampilkan == 'trashed') {
        $('#div_trash').show();
        $('#div_opsi').hide();
        $('#div_ekspor').hide();
        $('#grupfilter').hide();
    }
}

function hintPass(selector) {
    var x = document.getElementById(selector);
    var iconx = document.getElementById('icon_' + selector);
    if (x.type === "password") {
        x.type = "text";
        iconx.innerHTML = "<i class=\"fa fa-eye\"></i>";
    } else {
        x.type = "password";
        iconx.innerHTML = "<i class=\"fas fa-eye-slash\"></i>";

    }
}


function bulkHash(urlnya, teks = 'hash') {
    var list_id = [];
    $(".data-check:checked").each(function () {
        list_id.push(this.value);
    });
    var token = $('meta[name="csrf-token"]').attr('content');
    if (list_id.length > 0) {
        Swal.fire({
            title: 'Yakin akan ' + teks + ' : ' + list_id.length + ' data yg telah dipilih ?',
            text: "Cek kembali data anda",
            type: "warning",
            showCancelButton: true,
            reverseButtons: true,
            confirmButtonText: 'Ya',
            cancelButtonText: 'Tidak',
        }).then((result) => {
            if (result.value) {
                $.ajax({
                    headers: {
                        'X-CSRF-TOKEN': token
                    },
                    url: urlnya,
                    type: "POST",
                    data: {
                        id: list_id,
                    },
                    dataType: "JSON",


                    success: function (data) {
                        console.log(data);
                        console.log('sebelum', array_data);
                        array_data = [];
                        console.log('sesudah', array_data);
                        if (data.status) {
                            reloadTable();
                            tampilPesan('success', 'SUKSES Berhasil ' + teks, list_id.length + ' data');

                        } else {
                            tampilPesan('error', 'Gagal ' + teks, list_id.length + ' data');
                        }
                    },
                    error: function (error) {
                        console.log(error);
                        tampilPesan('error', error.status + ' ' + error.statusText, error.responseJSON);
                        //alert('error :: ' + error.responseJSON);
                    }
                });
            } else if (result.dismiss === "cancel") {
                tampilPesan('info', 'data dibatalkan untuk ' + teks, '');
            }
        });
    } else {
        tampilPesan('info', 'Silahkan pilih data yang akan ' + teks, '');
    }
}

function bulkQR(urlnya, teks = 'QR') {
    var list_id = [];
    $(".data-check:checked").each(function () {
        list_id.push(this.value);
    });
    var token = $('meta[name="csrf-token"]').attr('content');
    if (list_id.length > 0) {
        Swal.fire({
            title: 'Yakin akan ' + teks + ' : ' + list_id.length + ' data yg telah dipilih ?',
            text: "Cek kembali data anda",
            type: "warning",
            showCancelButton: true,
            reverseButtons: true,
            confirmButtonText: 'Ya',
            cancelButtonText: 'Tidak',
        }).then((result) => {
            if (result.value) {
                $.ajax({
                    headers: {
                        'X-CSRF-TOKEN': token
                    },
                    url: urlnya,
                    type: "POST",
                    data: {
                        id: list_id,
                    },
                    dataType: "JSON",


                    success: function (data) {
                        console.log(data);
                        console.log('sebelum', array_data);
                        array_data = [];
                        console.log('sesudah', array_data);
                        if (data.status) {
                            reloadTable();
                            tampilPesan('success', 'SUKSES Berhasil ' + teks, list_id.length + ' data');

                        } else {
                            tampilPesan('error', 'Gagal ' + teks, list_id.length + ' data');
                        }
                    },
                    error: function (error) {
                        console.log(error);
                        tampilPesan('error', error.status + ' ' + error.statusText, error.responseJSON);
                        //alert('error :: ' + error.responseJSON);
                    }
                });
            } else if (result.dismiss === "cancel") {
                tampilPesan('info', 'data dibatalkan untuk ' + teks, '');
            }
        });
    } else {
        tampilPesan('info', 'Silahkan pilih data yang akan ' + teks, '');
    }
}

function resetFile(selector) {
    $("#" + selector).val('');
    // const file =
    //     document.getElementById(selector);
    // file.value = null;
    // file.dispatchEvent(new Event('change'));
}


function remotePembuat(link) {
    $(".selectFilterPembuat").select2({
        placeholder: 'pilih',
        ajax: {
            url: link,
            type: "get",
            dataType: 'json',
            processResults: function (data) {
                return {
                    results: $.map(data, function (item) {
                        return {
                            text: item.name,
                            id: item.created_by
                        }
                    })
                };
            },
            cache: true
        },
        dropdownParent: "#modal_filter",
        templateResult: formatRepoPembuat,
        templateSelection: formatRepoSelectionPembuat

    });
}

function formatRepoPembuat(repo) {
    return repo.text;
}

function formatRepoSelectionPembuat(repo) {
    return repo.text;
}

function remoteList(link, selector, placeholder) {
    $(selector).select2({
        placeholder: placeholder,
        allowClear: true,

        // theme: 'bootstrap4',
        ajax: {
            url: link,
            type: "get",
            dataType: 'json',
            delay: 1,
            data: function (params) {
                return {
                    search: params.term, // search term,
                };
            },
            processResults: function (data) {
                return {
                    results: $.map(data, function (item) {
                        return {
                            text: item.text,
                            id: item.id
                        }
                    })
                };
            },
            cache: true
        },

        templateResult: formatRepoDefault,
        templateSelection: formatRepoSelectionDefault

    });
}

function remoteListbs5(link, selector, placeholder) {
    $(selector).select2({
        placeholder: placeholder,
        allowClear: true,

        theme: 'bootstrap-5',
        ajax: {
            url: link,
            type: "get",
            dataType: 'json',
            delay: 1,
            data: function (params) {
                return {
                    search: params.term, // search term,
                };
            },
            processResults: function (data) {
                return {
                    results: $.map(data, function (item) {
                        return {
                            text: item.text,
                            id: item.id
                        }
                    })
                };
            },
            cache: true
        },

        templateResult: formatRepoDefault,
        templateSelection: formatRepoSelectionDefault

    });
}

function remoteListModal(link, selector, placeholder, modal) {
    $(selector).select2({
        placeholder: placeholder,
        allowClear: true,
        // theme: 'bootstrap4',
        ajax: {
            url: link,
            type: "get",
            dataType: 'json',
            delay: 1,
            data: function (params) {
                return {
                    search: params.term, // search term,
                };
            },
            processResults: function (data) {
                return {
                    results: $.map(data, function (item) {
                        return {
                            text: item.text,
                            id: item.id
                        }
                    })
                };
            },
            cache: true
        },
        dropdownParent: modal,
        templateResult: formatRepoDefault,
        templateSelection: formatRepoSelectionDefault

    });
}

function formatRepoDefault(repo) {
    return repo.text;
}

function formatRepoSelectionDefault(repo) {
    return repo.text;
}


function rangePicker() {
    var fDateValue = $('#fDate').val();
    var tDate = $('#tDate');
    tDate.attr('min', fDateValue);
}

function tanggal_indonesia(date, separator) {
    const [year, month, day] = date.split('-');
    const result = [padTo2Digits(day), padTo2Digits(month), year].join(separator);
    return result;
}

function padTo2Digits(num) {
    return num.toString().padStart(2, '0');
}

function onprogressx() {
    Toast.fire({
        icon: 'warning',
        title: 'ON PROCESS',
        text: 'Sabar ya, sedang tahap pengembangan aplikasi',
    });
}


function getDateTime() {
    var now = new Date();
    var year = now.getFullYear();
    var month = now.getMonth() + 1;
    var day = now.getDate();
    var hour = now.getHours();
    var minute = now.getMinutes();
    var second = now.getSeconds();
    if (month.toString().length == 1) {
        month = '0' + month;
    }
    if (day.toString().length == 1) {
        day = '0' + day;
    }
    if (hour.toString().length == 1) {
        hour = '0' + hour;
    }
    if (minute.toString().length == 1) {
        minute = '0' + minute;
    }
    if (second.toString().length == 1) {
        second = '0' + second;
    }
    var dateTime = year + '-' + month + '-' + day + ' ' + hour + ':' + minute;
    return dateTime;
}

function getDate() {
    var now = new Date();
    var year = now.getFullYear();
    var month = now.getMonth() + 1;
    var day = now.getDate();

    if (month.toString().length == 1) {
        month = '0' + month;
    }
    if (day.toString().length == 1) {
        day = '0' + day;
    }

    var dateTime = year + '-' + month + '-' + day;
    return dateTime;
}

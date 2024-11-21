function deleteDataView(paramId, urlnya) {
    var id = paramId;
    var token = $('meta[name="csrf-token"]').attr('content');
    Swal.fire({
        title: 'Apakah anda ingin menghapus data ini',
        //text: "Data akan masuk dalam kotak sampah",
        icon: 'warning',
        showCancelButton: true,
        reverseButtons: true,
        confirmButtonText: 'Ya',
        cancelButtonText: 'Tidak',
    }).then((result) => {
        if (result.value) {
            $.ajax(
                {
                    headers: {
                        'X-CSRF-TOKEN': token
                    },
                    url: urlnya + '/' + id,
                    type: 'DELETE',
                    dataType: "JSON",
                    data: {
                        "id": id,
                    },
                    success: function (data) {

                        if (data.status) {
                            getRender(1);
                            tampilPesan(data.tipe, data.title, data.message);
                        } else {
                            tampilPesan(data.tipe, data.title, data.message);
                        }
                    },
                    error: function (error) {
                        console.log(error);
                        tampilPesan('error', error.status + ' ' + error.statusText, error.responseJSON);
                        //alert('error :: ' + error.responseJSON);
                    }
                });

        } else if (result.dismiss === "cancel") {
            tampilPesan('info', 'info', 'data dibatalkan untuk dihapus');
        }
    });
}


function bulkDeleteView(urlnya) {
    var list_id = [];
    $(".data-check:checked").each(function () {
        list_id.push(this.value);
    });
    var token = $('meta[name="csrf-token"]').attr('content');
    if (list_id.length > 0) {
        Swal.fire({
            title: 'Yakin akan menghapus : ' + list_id.length + ' data yg telah dipilih ?',
            text: "Cek kembali data anda sebelum dihapus",
            icon: 'warning',
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
                        console.log('sebelum', arrayList);
                        arrayList = [];
                        console.log('sesudah', arrayList);
                        if (data.status) {
                            getRender(1);
                            tampilPesan('success', 'SUKSES Berhasil Hapus ', list_id.length + ' data');
                            $('#check-all').prop('checked', false); // Unchecks
                        } else {
                            tampilPesan('error', 'Gagal Hapus ' + list_id.length + ' data');
                        }
                    },
                    error: function (error) {
                        console.log(error);
                        tampilPesan('error', error.status + ' ' + error.statusText, error.responseJSON);
                        //alert('error :: ' + error.responseJSON);
                    }
                });
            } else if (result.dismiss === "cancel") {
                tampilPesan('info', 'info', 'data dibatalkan untuk dihapus');
            }
        });
    } else {
        tampilPesan('warning', 'Silahkan pilih data yang akan dihapus', '');
    }
}


function deleteDataPermanenView(paramId, urlnya) {
    var id = paramId;
    var token = $('meta[name="csrf-token"]').attr('content');
    Swal.fire({
        title: 'Apakah anda ingin menghapus permanen data ini',
        text: "Data yang anda hapus, tidak akan kembali",
        icon: 'warning',
        showCancelButton: true,
        reverseButtons: true,
        confirmButtonText: 'Ya',
        cancelButtonText: 'Tidak',
    }).then((result) => {
        if (result.value) {
            $.ajax(
                {
                    headers: {
                        'X-CSRF-TOKEN': token
                    },
                    url: urlnya + '/' + id,
                    type: 'DELETE',
                    dataType: "JSON",
                    data: {
                        "id": id,
                    },

                    success: function (data) {
                        console.log(data);
                        if (data.status) {
                            getRender(1);
                            tampilPesan(data.tipe, data.title, data.message);
                        } else {
                            tampilPesan(data.tipe, data.title, data.message);
                        }
                    },
                    error: function (error) {
                        console.log(error);
                        tampilPesan('error', error.status + ' ' + error.statusText, error.responseJSON);
                        //alert('error :: ' + error.responseJSON);
                    }


                });

        } else if (result.dismiss === "cancel") {
            tampilPesan('info', 'info', 'data dibatalkan untuk dihapus');
        }
    });
}

function bulkDeletePermanenView(urlnya) {
    var list_id = [];
    $(".data-check:checked").each(function () {
        list_id.push(this.value);
    });
    var token = $('meta[name="csrf-token"]').attr('content');
    if (list_id.length > 0) {
        Swal.fire({
            title: 'Yakin akan menghapus permanen : ' + list_id.length + ' data yg telah dipilih ?',
            text: "Cek kembali data anda sebelum dihapus",
            icon: 'warning',
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
                        console.log('sebelum', arrayList);
                        arrayList = [];
                        console.log('sesudah', arrayList);
                        if (data.status) {
                            getRender(1);
                            tampilPesan('success', 'SUKSES Berhasil Hapus Permanen ', list_id.length + ' data');

                        } else {
                            tampilPesan('error','Gagal Hapus Permanen' + list_id.length + ' data');
                        }
                    },
                    error: function (error) {
                        console.log(error);
                        tampilPesan('error', error.status + ' ' + error.statusText, error.responseJSON);
                        //alert('error :: ' + error.responseJSON);
                    }
                });
            } else if (result.dismiss === "cancel") {
                tampilPesan('info', 'data dibatalkan untuk dihapus Permanen', '');
            }
        });
    } else {
        tampilPesan('warning', 'silahkan pilih data yang akan dihapus Permanen', '');
    }
}

function restore(paramId, urlnya) {
    var id = paramId;
    var token = $('meta[name="csrf-token"]').attr('content');
    Swal.fire({
        title: 'Apakah anda ingin restore data ini',
        //text: "Data yang anda hapus, tidak akan kembali",
        icon: 'warning',
        showCancelButton: true,
        reverseButtons: true,
        confirmButtonText: 'Ya',
        cancelButtonText: 'Tidak',
    }).then((result) => {
        if (result.value) {
            $.ajax(
                {
                    headers: {
                        'X-CSRF-TOKEN': token
                    },
                    url: urlnya + '/' + id,
                    type: 'GET',
                    dataType: "JSON",
                    data: {
                        "id": id,
                    },

                    success: function (data) {
                        console.log(data);
                        if (data.status) {
                            getRender(1);
                            tampilPesan(data.tipe, data.title, data.message);
                        } else {
                            tampilPesan(data.tipe, data.title, data.message);
                        }
                    },
                    error: function (error) {
                        console.log(error);
                        tampilPesan('error', error.status + ' ' + error.statusText, error.responseJSON);
                        //alert('error :: ' + error.responseJSON);
                    }


                });

        } else if (result.dismiss === "cancel") {
            tampilPesan('info', 'data dibatalkan untuk direstore', '');
        }
    });
}

function bulkRestoreView(urlnya) {
    var list_id = [];
    $(".data-check:checked").each(function () {
        list_id.push(this.value);
    });
    var token = $('meta[name="csrf-token"]').attr('content');
    if (list_id.length > 0) {
        Swal.fire({
            title: 'Yakin akan restore : ' + list_id.length + ' data yg telah dipilih ?',
            //text: "Cek kembali data anda sebelum dihapus",
            icon: 'warning',
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
                        console.log('sebelum', arrayList);
                        arrayList = [];
                        console.log('sesudah', arrayList);
                        if (data.status) {
                            getRender(1);
                            tampilPesan('success', 'SUKSES Berhasil Restore ', list_id.length + ' data');

                        } else {
                            tampilPesan('error','Gagal Restore ' + list_id.length + ' data');
                        }
                    },
                    error: function (error) {
                        console.log(error);
                        tampilPesan('error', error.status + ' ' + error.statusText, error.responseJSON);
                        //alert('error :: ' + error.responseJSON);
                    }
                });
            } else if (result.dismiss === "cancel") {
                tampilPesan('info', 'data dibatalkan untuk direstore', '');
            }
        });
    } else {
        tampilPesan('warning', 'silahkan pilih data yang akan direstore', '');
    }
}

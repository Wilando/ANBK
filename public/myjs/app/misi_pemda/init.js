const permissionCreate = 'misi pemda create';
const permissionRead = 'misi pemda read';
const permissionUpdate = 'misi pemda update';
const permissionDelete = 'misi pemda delete';
const permissionValidation = 'misi pemda validation';
const permissionPrivilege = 'misi pemda privilege';
let tableDT = null;
let checked_id_array = [];
let selected_one_row = [];
let filterModal = null;


document.addEventListener('DOMContentLoaded', async function () {
    await initLoad();
});

async function initLoad() {

    await getFlashmessage();
    await getProfile();
    await initSelect2();
    await initModal();
    await resetformFilter();
    await load_dt();


}

async function getFlashmessage() {

    var flashMessage = localStorage.getItem('flash_message');

    if (flashMessage) {
        swShow('success', 'INFO', flashMessage);
        localStorage.removeItem('flash_message');
    }
}

async function getProfile() {
    await fetchMyuser();
}


async function load_dt() {
    if (checkPermission(permissionRead)) {
        tableDT = $('#hideyori_datatable').DataTable({
            pagingType: "numbers",
            aLengthMenu: [
                [10, 25, 50, 100, -1],
                [10, 25, 50, 100, "All"]
            ],
            pageLength: 25,
            paging: true,
            processing: true,
            serverSide: true,
            responsive: {
                details: {
                    type: 'column'
                }
            },
            language: {
                url: base_url + '/json/dt-id.json',
            },
            autoWidth: false,
            select: {
                info: false,
                style: 'multi',
            },
            ajax: {
                url: app_url + '/misi-pemda/datatable',
                type: "GET",
                data: function (d) {
                    d.mulai = $('#filter_mulai_created_at').val();
                    d.selesai = $('#filter_selesai_created_at').val();

                    d.is_active = $('#filter_is_active').val();
                    if (checkPermission(permissionPrivilege) == false) {
                        d.created_by = myUser.id;
                    } else {
                        d.created_by = $('#filter_created_by').val();
                    }
                }
            },

            order: [
                [3, "asc"]
            ],

            "columnDefs": [
                {
                    targets: [0, 1, 2, 5, 6, 7],

                    width: 1,
                },

                {responsivePriority: 1, targets: 0},
                {responsivePriority: 2, targets: 1},
                {responsivePriority: 3, targets: 2},
                {responsivePriority: 4, targets: 3},

            ],

            columns: [{
                className: 'dtr-control',
                orderable: false,
                searchable: false,
                data: 'kosong',
                targets: 0
            },


                {
                    data: 'kosong',
                    orderable: false,
                    searchable: false,
                    className: 'select-checkbox not-export-col',

                },


                {
                    data: 'DT_RowIndex',
                    name: 'DT_RowIndex',
                    orderable: false,
                    searchable: false,
                    className: 'dt-center',

                },




                {
                    data: 'nama_misi',
                    name: 'nama_misi',
                    // className: 'dt-nowrap',
                },


                {
                    data: 'deskripsi',
                    name: 'deskripsi',
                    visible: false,

                },

                {
                    data: 'tahun_awal',
                    name: 'tahun_awal',
                    className: "dt-center dt-nowrap",

                },

                {
                    data: 'tahun_akhir',
                    name: 'tahun_akhir',
                    className: "dt-center dt-nowrap",

                },




                {
                    data: 'is_active',
                    name: 'is_active',
                    searchable: false,
                    className: "dt-center dt-nowrap",
                    render: function (data) {
                        if (data != null) {
                            return isActivehtml(data, 'Aktif', 'Non Aktif');
                        }
                        return '';
                    },
                }, {
                    data: 'created_at',
                    name: 'created_at',
                    searchable: false,
                    visible: false,
                    className: "dt-center",
                    render: function (data) {
                        if (data != null) {
                            return date_time_indo(data);
                        }
                        return '';
                    },
                },

                {
                    data: 'kosong',

                    orderable: false,
                    searchable: false,
                    className: 'dt-center dt-nowrap not-export-col',
                    render: function (data, type, row, meta) {
                        let rowData = row.encode_row;


                        let btnDetail = `<a class="btn btn-sm text-dark clickable-detail" title="detail" data-row="${rowData}"><i class="fa fa-info-circle fa-fw"></i></a>`;



                        let btnEdit = '';
                        let btnDelete = '';
                        let btnEditAksi = `<a class="btn btn-sm text-success clickable-edit" title="ubah" data-row="${rowData}"><i class="fas fa-edit fa-fw"></i></a>`;

                        let btnDeleteAksi = `<button class="btn btn-sm text-danger clickable-delete" title="hapus" data-row="${rowData}"><i class="fas fa-trash fa-fw"></i></button>`;

                        if (checkPermission(permissionUpdate)) {
                            btnEdit = btnEditAksi;
                        }
                        if (checkPermission(permissionDelete)) {
                            btnDelete = btnDeleteAksi;
                        }



                        return '<div class="btn-group btn-group-sm" role="group" aria-label="First group">' + btnDetail + btnEdit + btnDelete + '</div>';
                    }

                },


            ],

            rowCallback: function (row, data, index) {

                let cellValue = data['id_misi'];
                if (checked_id_array.includes(cellValue, 0)) {
                    tableDT.row(index).select();
                }


                if (checkPermission(permissionPrivilege) == false) {
                    if (data['created_by'] != myUser.id) {
                        $('td', row).removeClass('select-checkbox');
                    }

                }

            },
            drawCallback: async function () {

                await toggle_visible_column();
                var totalData = tableDT.page.info().recordsDisplay;
                if (totalData > 0) {
                    await detailByrow();
                    await editByrow();
                    await refreshFsLightbox();
                    await exporTable(tableDT, 'div_ekspor');
                    await deleteByrow();
                } else {
                    $('#div_opsi').hide();
                    $('#div_ekspor').hide();
                }
            },
            "error": function (xhr, error, thrown) {
                console.log("Error occurred!");
                console.log(xhr, error, thrown);
            }


        });

        await initMydatatable(tableDT, 'hideyori_datatable', checked_id_array, 'div_opsi', 'only_one_selected_div', selected_one_row, 'div_ekspor', 'id_misi');
    }


}


async function initModal() {

    if (checkPermission(permissionRead)) {
        filterModal = new bootstrap.Modal(document.getElementById('filterModal'));
        if (filterModal) {
            await remoteListmodal(app_url + '/users/remote', '#filter_created_by', 'pilih pengguna', '#filterModal');

        }

        rincianModal = new bootstrap.Modal(document.getElementById('rincianModal'));


    }

    if (checkanyPermission([permissionUpdate, permissionValidation])) {
        formModalBulk = new bootstrap.Modal(document.getElementById('formModalBulk'));
    }

    if (checkanyPermission([permissionCreate, permissionUpdate])) {
        formModal = new bootstrap.Modal(document.getElementById('formModal'));
    }



}




async function detailByrow() {
    $("#hideyori_datatable").on("click", ".clickable-detail", async function () {
        if (checkPermission(permissionRead)) {
            let encodedRowDataString = $(this).attr('data-row');


            let rowDataString = decodeURIComponent(encodedRowDataString);


            try {
                let row = JSON.parse(rowDataString);



                let id_misi = row.id_misi ?? '';

                let nama_misi = row.nama_misi ?? '';
                let deskripsi = row.deskripsi ?? '';
                let tahun_awal = row.tahun_awal ?? '';
                let tahun_akhir = row.tahun_akhir ?? '';

                let is_active = row.is_active ?? '';
                let created_at = row.created_at ?? '';

                $('#dt_nama_misi').text(nama_misi);
                $('#dt_deskripsi').text(deskripsi);
                $('#dt_periode').text(tahun_awal+' s.d. '+tahun_akhir);




                $('#dt_is_active').html(isActivehtml(is_active, 'Aktif', 'Non Aktif'));

                $('#dt_created').text(date_time_indo(created_at));


                rincianModal.show();
                await refreshFsLightbox();
            } catch (e) {
                console.error("Failed to parse JSON string:", e);
            }
        }
    });

}

async function resetformFilter() {
    if (checkPermission(permissionRead)) {


        $('#filter_is_active').val(null);
        $('#filter_mulai_created_at').val(null);
        $('#filter_selesai_created_at').val(null);
        if (checkPermission(permissionPrivilege)) {
            $('#filter_created_by').val(null).trigger('change');
        }
        await toggle_filter_div();
    }
}

async function resetFilter() {
    if (checkPermission(permissionRead)) {
        await resetformFilter();
        await reloadTableFilter(tableDT);
    }
}

async function modalFilter() {
    if (checkPermission(permissionRead)) {
        filterModal.show();
    }
}


async function reloadFilter() {

    if (checkPermission(permissionRead)) {
        await reloadTableFilter(tableDT);


        filterModal.hide();
        await toggle_filter_div();
    }
}


async function deleteByrow() {
    $("#hideyori_datatable").on("click", ".clickable-delete", async function () {
        if (checkPermission(permissionDelete)) {
            let message = 'pastikan untuk cek kembali data sebelum dihapus';
            let title = 'hapus misi pemda';

            let encodedRowDataString = $(this).attr('data-row');


            let rowDataString = decodeURIComponent(encodedRowDataString);


            try {
                let row = JSON.parse(rowDataString);


                let nama_misi = row.nama_misi ?? '';
                let id_misi = row.id_misi ?? '';

                message = '"' + nama_misi + '"';

                const url = app_url + '/misi-pemda/delete/' + id_misi;
                await trx_delete(url, checked_id_array, tableDT, title, message, 'div_opsi', selected_one_row, 'id_misi');
            } catch (e) {
                console.error("Failed to parse JSON string:", e);
            }
        }
    });

}

async function _delete() {
    if (checkPermission(permissionDelete)) {
        let message = 'pastikan untuk cek kembali data sebelum dihapus';
        let title = 'hapus misi pemda';
        let jumlah_checked = checked_id_array.length;

        if (jumlah_checked > 0) {

            const url = app_url + '/misi-pemda/bulk-delete';
            await trx_bulk_delete(url, checked_id_array, tableDT, message, 'div_opsi', selected_one_row, 'id_misi');

        }
    }

}


async function editForm() {
    if (checkanyPermission([permissionUpdate, permissionValidation])) {
        let jumlah_checked = checked_id_array.length;
        if (jumlah_checked > 0) {
            await editFormBulk();
        }
    }
}


async function editFormBulk() {
    if (checkanyPermission([permissionUpdate, permissionValidation])) {
        $('#formSubmitBulk')[0].reset();


        if (checkPermission(permissionValidation)) {
            $('#div_bulk_is_active').hide();
        }

        formModalBulk.show();


        if (checkPermission(permissionValidation)) {
            $('#switch_bulk_is_active').change(function () {
                if ($(this).is(':checked')) {
                    $('#div_bulk_is_active').show();
                } else {
                    $('#div_bulk_is_active').hide();
                    $('#is_active_bulk').val(null);
                }
            });
        }


    }

}


async function submitFormBulk(event) {
    if (checkanyPermission([permissionUpdate, permissionValidation])) {
        event.preventDefault();

        let is_active = null;



        if (checkPermission(permissionValidation)) {
            is_active = $('#is_active_bulk').val() ?? null;
        }


        let formBulk = {
            ids: checked_id_array,

            is_active: is_active,


            _method: "put"
        }

        await resetAlertId('alertFormModalBulk');
        await processSubmit('submitButtonBulk');

        const url = app_url + '/misi-pemda/bulk-update';

        const response = await trx_bulk_update(url, checked_id_array, tableDT, formBulk, 'div_opsi', selected_one_row, 'id_misi');
        if (response.success == true) {
            formModalBulk.hide();

        } else {
            await displayAlertId('danger', 'error', response.message, 'alertFormModalBulk');
        }
        await enabledSubmit('submitButtonBulk');
    }


}

const formSubmitBulk = document.getElementById('formSubmitBulk');
if (formSubmitBulk) {
    formSubmitBulk.addEventListener('submit', submitFormBulk);
}

async function toggle_visible_column() {

    var selected_is_active = $('#filter_is_active').val();




    if (selected_is_active != '') {
        tableDT.column(5).visible(false);
    } else {
        tableDT.column(5).visible(true);
    }

}

async function toggle_filter_div() {


    var selected_is_active = $('#filter_is_active').val();
    var selected_is_active_text = $('#filter_is_active option:selected').text();
    var selected_created_by = $('#filter_created_by option:selected').text();

    var selected_mulai_created_at = $('#filter_mulai_created_at').val() ?? null;
    var selected_selesai_created_at = $('#filter_selesai_created_at').val() ?? null;



    if ([selected_mulai_created_at, selected_selesai_created_at, selected_created_by, selected_is_active].some(value => value !== '')) {
        $('#div_filter_text').show();


        if (selected_created_by) {
            $('#tr_filter_created_by').show();
            $('#text_filter_created_by').text(selected_created_by);

        } else {
            $('#tr_filter_created_by').hide();

        }

        if (selected_is_active) {
            $('#tr_filter_is_active').show();
            $('#text_filter_is_active').text(selected_is_active_text);
        } else {
            $('#tr_filter_is_active').hide();
        }


        if (selected_mulai_created_at) {
            $('#tr_filter_periode').show();
            $('#text_filter_periode').text(date_time_indo(selected_mulai_created_at) + ' s.d. ' + date_time_indo(selected_selesai_created_at));
        } else {
            $('#tr_filter_periode').hide();
        }


    } else {
        $('#div_filter_text').hide();
    }
}

async function select2form() {




}

async function resetForm() {
    if (checkanyPermission([permissionCreate, permissionUpdate])) {
        await angka_indo_format_on_input();
        await remove_validation_on_input();
        $("#formSubmit :input").prop("disabled", true);
        const idformSubmit = $('#formSubmit');


        await resetAlertId('alertFormModal');
        idformSubmit[0].reset();
        idformSubmit.find('.is-invalid').removeClass('is-invalid')
        idformSubmit.find('.invalid-feedback').empty();
        idformSubmit.find('.xinvalid-feedback').empty();
        await select2form();



    }


}


async function addForm() {
    if (checkPermission(permissionCreate)) {
        await resetForm();
        $('#titleFormModal').text('TAMBAH DATA');
        formModal.show();

        $('#submitText').text('Simpan');
        save_method = 'create';
        $("#formSubmit :input").prop("disabled", false);

        $('#is_active').val(1).trigger('change');
        $('#tahun_awal').val(2019);
        $('#tahun_akhir').val(2024);


        formModal._element.addEventListener('shown.bs.modal', function () {
            $('#nama_misi').focus();
        });


        idformUpdate = null;


    }
}

async function editByrow() {

    $("#hideyori_datatable").on("click", ".clickable-edit", async function () {
        if (checkPermission(permissionUpdate)) {
            let encodedRowDataString = $(this).attr('data-row');


            let rowDataString = decodeURIComponent(encodedRowDataString);


            try {
                let row = JSON.parse(rowDataString);


                await resetForm();


                if (row !== null) {
                    let x = row;


                    $('#titleFormModal').text('EDIT DATA');

                    save_method = 'update';
                    formModal.show();


                    $('#submitText').text('Simpan Perubahan');


                    idformUpdate = x.id_misi;

                    if (x.nama_misi) {
                        $("#nama_misi").val(x.nama_misi);
                    }




                    if (x.deskripsi) {
                        $("#deskripsi").val((x.deskripsi));
                    }

                    if (x.tahun_awal) {
                        $("#tahun_awal").val((x.tahun_awal));
                    }

                    if (x.tahun_akhir) {
                        $("#tahun_akhir").val((x.tahun_akhir));
                    }



                    $("#is_active").val(x.is_active).trigger('change');




                }


                $("#formSubmit :input").prop("disabled", false);
                formModal._element.addEventListener('shown.bs.modal', function () {
                    $('#nama_misi').focus();
                });


            } catch (e) {
                console.error("Failed to parse JSON string:", e);
            }
        }
    });

}

async function submitForm(event) {
    if (checkanyPermission([permissionCreate, permissionUpdate])) {
        event.preventDefault();
        const formData = new FormData(event.target);
        let formValues = Object.fromEntries(formData);

        await resetAlertId('alertFormModal');
        await processSubmit('submitButton');
        try {
            let response_form;
            if (save_method == 'create') {
                if (checkPermission(permissionCreate)) {
                    response_form = await axios.post(app_url + '/misi-pemda/store', formValues);
                }
            } else {
                if (checkPermission(permissionUpdate)) {
                    const formValuesUpdate = Object.assign({}, formValues, {
                        _method: 'put'
                    });
                    response_form = await axios.post(app_url + '/misi-pemda/update/' + idformUpdate, formValuesUpdate);
                }
            }

            if (response_form.data.success == true) {
                await swShow('success', 'success', response_form.data.message);
                await displayAlertId('success', 'Success', response_form.data.message, 'alertFormModal');
                if (save_method == 'create') {
                    await reloadTable(tableDT);
                } else {
                    await reloadTableSamePage(tableDT);
                }


                formModal.hide();


            } else {
                if (response_form.data.error) {
                    await displayAlertId('danger', 'Error', response_form.data.message, 'alertFormModal');
                }
            }

        } catch (error) {
            await catch_error_form_modal(error);
        }
        await enabledSubmit('submitButton');
    }
}

const formSubmit = document.getElementById('formSubmit');
if (formSubmit) {
    formSubmit.addEventListener('submit', submitForm);
}





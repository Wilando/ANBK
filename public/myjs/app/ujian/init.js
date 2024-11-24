const permissionCreate = 'soal create';
const permissionRead = 'soal read';
const permissionUpdate = 'soal update';
const permissionDelete = 'soal delete';
const permissionValidation = 'soal validation';
const permissionPrivilege = 'soal privilege';
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
                url: app_url + '/ujian/datatable',
                type: "GET",
                data: function (d) {
                    d.mulai = $('#filter_mulai_created_at').val();
                    d.selesai = $('#filter_selesai_created_at').val();
                    d.is_active = $('#filter_is_active').val();
                    d.topic = $('#filter_topic').val();
                }
            },

            order: [
                [3, "asc"]
            ],

            "columnDefs": [
                {
                    targets: [0],

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
                    data: 'name',
                    name: 'name',
                },
                {
                    data: 'topics',
                    name: 'name',
                    render: function (data) {
                        let topics = "";
                        data.forEach(element => {
                            topics += element.name;
                        });
                        return topics;
                    },
                },
                {
                    data: 'quiz_authors',
                    name: 'name',
                    render: function (data) {
                        let nama = "";
                        data.forEach(element => {
                            nama += element.author.name;
                        });
                        return nama;
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

        await initMydatatable(tableDT, 'hideyori_datatable', checked_id_array, 'div_opsi', 'only_one_selected_div', selected_one_row, 'div_ekspor', 'id');
    }


}


async function initModal() {

    if (checkPermission(permissionRead)) {
        filterModal = new bootstrap.Modal(document.getElementById('filterModal'));
        if (filterModal) {
            await remoteListmodal(app_url + '/users/remote', '#filter_created_by', 'pilih pengguna', '#filterModal');
            await remoteListmodal(app_url + '/misi-pemda/remote', '#filter_topic', 'pilih topic', '#filterModal');
        }

        rincianModal = new bootstrap.Modal(document.getElementById('rincianModal'));


    }

    if (checkanyPermission([permissionUpdate, permissionValidation])) {
        formModalBulk = new bootstrap.Modal(document.getElementById('formModalBulk'));
    }

    if (checkanyPermission([permissionCreate, permissionUpdate])) {
        formModal = new bootstrap.Modal(document.getElementById('formModal'));
        await remoteListmodal(app_url + '/misi-pemda/remote', '#topic', 'pilih topic', '#formModal');
        $('#tipe_soal').on('change', function () {
            const mode = $(this).val();
            const $optionsSelect = $('#jawaban');
            $optionsSelect.select2('destroy');
            let select = mode == 1 ? false : true;
            
            $optionsSelect.select2({
                placeholder: "Pilih Jawaban",
                allowClear: true,
                dropdownParent: $('#formModal'),
                multiple: select
            });
        });
    }



}

async function detailByrow() {
    $("#hideyori_datatable").on("click", ".clickable-detail", async function () {
        if (checkPermission(permissionRead)) {
            let encodedRowDataString = $(this).attr('data-row');
            let rowDataString = decodeURIComponent(encodedRowDataString);
            $('#dt_asnwer1').html("Option 1");
            $('#dt_asnwer2').html("Option 2");
            $('#dt_asnwer3').html("Option 3");
            $('#dt_asnwer4').html("Option 4");

            try {
                let row = JSON.parse(rowDataString);

                let id = row.id ?? '';

                let name = row.name ?? '';
                let tipe = '';
                if (row.question_type.name == "multiple_choice_single_answer") {
                    tipe = "Pilihan Ganda (Satu Jawaban)";
                }
                else if (row.question_type.name == "multiple_choice_multiple_answer"){
                    tipe = "Pilihan Ganda (Lebih Dari Satu Jawaban)"
                }
                let topics = "";
                row.topics.forEach(element => {
                    topics += element.name;
                });
                let badge_correct = ` <span class="badge text-bg-success">Benar</span>`;

                let is_active = row.is_active ?? '';
                $('#dt_soal').text(name);
                $('#dt_tipe').text(tipe);
                $('#dt_topic').text(topics);
                $('#dt_option1').text(row.options[0].name);
                $('#dt_option2').text(row.options[1].name);
                $('#dt_option3').text(row.options[2].name);
                $('#dt_option4').text(row.options[3].name);
                $('#dt_asnwer1').append(row.options[0].is_correct ? badge_correct : "" );
                $('#dt_asnwer2').append(row.options[1].is_correct ? badge_correct : "" );
                $('#dt_asnwer3').append(row.options[2].is_correct ? badge_correct : "" );
                $('#dt_asnwer4').append(row.options[3].is_correct ? badge_correct : "" );
            
                $('#dt_is_active').html(isActivehtml(is_active, 'Aktif', 'Non Aktif'));

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
        $('#filter_topic').val(null).trigger('change');
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
            let title = 'Hapus Soal';

            let encodedRowDataString = $(this).attr('data-row');


            let rowDataString = decodeURIComponent(encodedRowDataString);


            try {
                let row = JSON.parse(rowDataString);


                let name = row.name ?? '';
                let id = row.id ?? '';

                message = '"' + name + '"';

                const url = app_url + '/soal/delete/' + id;
                await trx_delete(url, checked_id_array, tableDT, title, message, 'div_opsi', selected_one_row, 'id');
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

    // if (selected_is_active != '') {
    //     tableDT.column(5).visible(false);
    // } else {
    //     tableDT.column(5).visible(true);
    // }

}

async function toggle_filter_div() {

    var selected_is_active = $('#filter_is_active').val();
    var selected_is_active_text = $('#filter_is_active option:selected').text();
    var selected_created_by = $('#filter_created_by option:selected').text();

    var selected_mulai_created_at = $('#filter_mulai_created_at').val() ?? null;
    var selected_selesai_created_at = $('#filter_selesai_created_at').val() ?? null;

    var selected_topic = $('#filter_topic option:selected').text();

    if ([selected_mulai_created_at, selected_selesai_created_at, selected_created_by, selected_is_active].some(value => value !== '')) {
        $('#div_filter_text').show();

        if (selected_topic) {
            $('#tr_filter_topic').show();
            $('#text_filter_topic').text(selected_topic);

        } else {
            $('#tr_filter_topic').hide();
        }

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
        $('#topic').val(null).change();
        $('#jawaban').val(null).change();
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

        formModal._element.addEventListener('shown.bs.modal', function () {
            $('#soal').focus();
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


                    idformUpdate = x.id;

                    if (x.name) {
                        $("#soal").val(x.name);
                    }
                    if (x.question_type_id) {
                        $("#tipe_soal").val(x.question_type_id).change();
                    }
                    if (x.topics[0]) {
                        var option = new Option(x.topics[0].name, x.topics[0].id, true, true);
                        $("#topic").append(option).trigger('change');
                    }
                    
                    let jawaban = [];
                    x.options.forEach((element, index) => {
                        $(`#option_${index + 1}`).val(element.name);
                        if (element.is_correct) {
                            jawaban.push(index+1);  
                        }
                        $(`#option_${index + 1}`).val(element.name);
                    });
                    
                    $(`#jawaban`).val(jawaban).change();

                    $("#is_active").val(x.is_active).trigger('change');
                }


                $("#formSubmit :input").prop("disabled", false);
                formModal._element.addEventListener('shown.bs.modal', function () {
                    $('#name').focus();
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

        await resetAlertId('alertFormModal');
        await processSubmit('submitButton');
        try {
            let response_form;
            if (save_method == 'create') {
                if (checkPermission(permissionCreate)) {
                    response_form = await axios.post(app_url + '/ujian/store', formData);
                }
            } else {
                if (checkPermission(permissionUpdate)) {
                    formData.append('_method', 'PUT')
                    response_form = await axios.post(app_url + '/ujian/update/' + idformUpdate, formData);
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





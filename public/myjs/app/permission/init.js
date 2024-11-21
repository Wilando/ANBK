let tableDT = null;
let checked_id_array = [];
let selected_one_row = [];
let filterModal = null;
let save_method = 'add';


document.addEventListener('DOMContentLoaded', async function () {
    await initLoad();
});

async function initLoad() {
    await getProfile();
    await initModal();
    await resetformFilter();
    await load_dt();


}

async function getProfile() {
    await fetchMyuser();
}


async function load_dt() {

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
            url: app_url + '/permission/datatable',
            type: "GET",
            data: function (d) {
                d.role_id = $('#role_id').val();
            }
        },

        order: [
            [5, "desc"]
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
                className: 'select-checkbox',

            },

            {
                data: 'DT_RowIndex',
                name: 'DT_RowIndex',
                orderable: false,
                searchable: false,
                className: 'dt-center'

            },
            {
                data: 'name',
                name: 'name',
            },
            {
                data: 'roles',
                name: 'roles',
                orderable: false,
                searchable: false,
            },
            {
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


        ],

        rowCallback: function (row, data, index) {

            let cellValue = data['id'];
            if (checked_id_array.includes(cellValue, 0)) {
                tableDT.row(index).select();
            }

        },
        drawCallback: async function () {

            var totalData = tableDT.page.info().recordsDisplay;
            if (totalData > 0) {
                await exporTable(tableDT, 'div_ekspor');
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

    await initMydatatable(tableDT, 'hideyori_datatable', checked_id_array, 'div_opsi', 'only_one_selected_div', selected_one_row, 'div_ekspor');


}

async function initModal() {
    filterModal = new bootstrap.Modal(document.getElementById('filterModal'));
    rincianModal = new bootstrap.Modal(document.getElementById('rincianModal'));
    if (filterModal) {
        await remoteListmodal(app_url + '/role/remote', '#role_id', 'pilih role', '#filterModal');
    }
    formModal = new bootstrap.Modal(document.getElementById('formModal'));

}

async function resetformFilter() {

    $('#role_id').val(null).trigger('change');

}

async function resetFilter() {

    await resetformFilter();
    await reloadTableFilter(tableDT);

}

async function modalFilter() {

    filterModal.show();

}

async function reloadFilter() {

    await reloadTableFilter(tableDT);
    filterModal.hide();

}

async function rincian() {

    const dtRincian = document.getElementById('dtRincian');
    dtRincian.innerHTML = '';
    dtRincian.style.fontSize = '1rem';
    let jumlah_checked = checked_id_array.length;
    if (jumlah_checked == 1) {
        if (selected_one_row[0]) {


            var aliases = {
                name: 'Permission',
                created_at: 'Dibuat Pada',
                roles: 'Ditugaskan Pada',
            };


            let x = selected_one_row[0];
            var keysToKeep = ["name", "roles", "created_at"];
            var sortKeys = ["name", "roles", "created_at"];
            var result = filterAndSortArray(x, keysToKeep, sortKeys);
            if (result) {
                let hasil = result[0];
                var size = Object.keys(hasil).length;
                if (size > 0) {
                    var key = Object.keys(hasil);
                    var value = Object.values(hasil);
                    for (var i = 0; i < size; i++) {
                        var nameField = key[i];
                        var valueField = value[i];

                        if (nameField == 'created_at') {
                            valueField = date_time_indo(valueField);
                        }


                        if (aliases[nameField]) {
                            const trdt = document.createElement('tr');
                            trdt.className = 'align-middle';
                            const tddtkey = document.createElement('td');
                            tddtkey.style.width = '30%';
                            const tdseparator = document.createElement('td');
                            tdseparator.style.width = '5%';
                            const tddtvalue = document.createElement('td');
                            tddtvalue.style.width = '65%';
                            tddtkey.innerHTML = aliases[nameField] || nameField;
                            tdseparator.textContent = ':';
                            tddtvalue.innerHTML = valueField;
                            trdt.appendChild(tddtkey);
                            trdt.appendChild(tdseparator);
                            trdt.appendChild(tddtvalue);
                            dtRincian.appendChild(trdt);
                        }


                    }
                }
            }

            rincianModal.show();
        }
    } else {
        swShow('info', 'INFO', 'untuk dapat menggunakan tombol rincian, silahkan pilih satu data saja');
    }

}

async function _delete() {

    let message = 'pastikan untuk cek kembali data sebelum dihapus';
    let title = 'hapus permission';
    let jumlah_checked = checked_id_array.length;

    if (jumlah_checked > 0) {
        if (jumlah_checked == 1) {

            if (selected_one_row[0]) {
                message = '"' + selected_one_row[0].name + '"';
            }
            const url = app_url + '/permission/delete/' + checked_id_array[0];
            await trx_delete(url, checked_id_array, tableDT, title, message, 'div_opsi');

        } else {
            const url = app_url + '/permission/bulk-delete';
            await trx_bulk_delete(url, checked_id_array, tableDT, message, 'div_opsi');
        }


    }


}

async function resetForm() {

    $("#formSubmit :input").prop("disabled", true);
    const idformSubmit = $('#formSubmit');
    await resetAlert();
    idformSubmit[0].reset();
    idformSubmit.find('.is-invalid').removeClass('is-invalid')
    idformSubmit.find('.invalid-feedback').empty();
    idformSubmit.find('.xinvalid-feedback').empty();
}

async function addForm() {

    await resetForm();
    await resetAlertId('alertFormModal');
    formModal.show();


    $('#titleFormModal').text('TAMBAH PERMISSION');
    $('#submitButton').show();
    $('#submitText').text('Tambah');
    save_method = 'create';
    $("#formSubmit :input").prop("disabled", false);

    formModal._element.addEventListener('shown.bs.modal', function () {
        document.getElementById('name').focus();
    });

}

async function editForm() {

    let jumlah_checked = checked_id_array.length;
    if (jumlah_checked == 1) {
        if (selected_one_row[0]) {

            let x = selected_one_row[0];

            await resetForm();
            await resetAlertId('alertFormModal');
            formModal.show();
            formModal._element.addEventListener('shown.bs.modal', function () {
                document.getElementById('name').focus();
            });
            $('#titleFormModal').text('EDIT PERMISSION');
            $('#submitButton').show();
            $('#submitText').text('Simpan Perubahan');
            save_method = 'update';
            const form = document.getElementById('formSubmit')

            Array.from(form.elements).forEach(element => {
                var idinput = element.id;
                var taginput = element.tagName;
                var typeinput = element.type;
                if (taginput == 'SELECT') {
                    $('#' + idinput).val(x[idinput]);

                } else if (taginput == 'TEXTAREA') {
                    $('#' + idinput).val(x[idinput]);
                } else {
                    const inputygboleh = ["text", "number", "email"];
                    if (inputygboleh.includes(typeinput)) {

                        $('#' + idinput).val(x[idinput]);
                    }
                }


            });
            $("#formSubmit :input").prop("disabled", false);


        }
    } else {
        swShow('info', 'INFO', 'untuk dapat menggunakan tombol edit, silahkan pilih satu data saja');

    }

}

async function submitForm(event) {

    event.preventDefault();

    const formData = new FormData(event.target);

    let formValues = Object.fromEntries(formData);


    let valuePrimarykey = $('#id').val();


    await resetAlertId('alertFormModal');
    await processSubmit('submitButton');
    try {
        let response_form;
        if (save_method == 'create') {

            response_form = await axios.post(app_url + '/permission/store', formValues);

        } else {

            const formValuesUpdate = Object.assign({}, formValues, {
                _method: 'put'
            });
            response_form = await axios.post(app_url + '/permission/update/' + valuePrimarykey, formValuesUpdate);

        }

        if (response_form.data.success == true) {
            swShow('success', 'success', response_form.data.message);
            displayAlertId('success', 'Success', response_form.data.message, 'alertFormModal');
            if (save_method == 'create') {
                await reloadTable(tableDT);
            } else {
                await reloadTableSamePage(tableDT);
            }


            formModal.hide();


            await deselectAllrows(tableDT, checked_id_array, selected_one_row);


        } else {
            if (response_form.data.error) {
                displayAlertId('danger', 'Error', response_form.data.message, 'alertFormModal');
            }
        }

    } catch (error) {

        const error_response_data = error.response.data;
        const error_message = error_response_data.message;
        const error_field = error_response_data.errors;

        var size = Object.keys(error_field).length;
        if (size > 0) {
            var isian = Object.keys(error_field);
            for (var i = 0; i < size; i++) {
                var nameField = isian[i];
                if (i == 0) {
                    $('[name="' + nameField + '"]').focus();
                }
                $('#' + nameField + '').addClass('is-invalid');
                var errMessagefield = error_field[nameField].toString();
                $('#feedback_error_' + nameField + '').text(errMessagefield);
            }
        }
        if (error_message) {
            displayAlertId('danger', 'Error', error_message, 'alertFormModal')
        }


    }
    enabledSubmit('submitButton');

}

const formSubmit = document.getElementById('formSubmit');
if (formSubmit) {
    formSubmit.addEventListener('submit', submitForm);
}


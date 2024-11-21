const permissionCreate = 'users create';
const permissionRead = 'users read';
const permissionUpdate = 'users update';
const permissionDelete = 'users delete';
const permissionValidation = 'users validation';
const permissionPrivilege = 'users privilege';
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
                url: app_url + '/users/datatable',
                type: "GET",
                data: function (d) {
                    d.role_id = $('#role_id').val();
                    if (checkPermission(permissionPrivilege) == false) {
                        d.created_by = myUser.id;
                    }
                }
            },

            order: [
                [9, "desc"]
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
                    data: 'link_avatar',
                    name: 'link_avatar',

                    orderable: false,
                    searchable: false,
                    className: "dt-center",
                    render: function (data, type, row) {


                        if (type == 'display' || type == 'filter') {
                            return isPicturehtml(data);
                        }
                        return data;
                    },
                }, {
                    data: 'username',
                    name: 'username',
                }, {
                    data: 'name',
                    name: 'name',
                }, {
                    data: 'email',
                    name: 'email',
                }, {
                    data: 'list_roles',
                    name: 'list_roles',
                }, {
                    data: 'is_active',
                    name: 'is_active',
                    searchable: false,
                    className: "dt-center",
                    render: function (data) {
                        if (data != null) {
                            return isActivehtml(data, 'Akun Aktif', 'Akun Non Aktif');
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


            ],

            rowCallback: function (row, data, index) {

                let cellValue = data['id'];
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

                var totalData = tableDT.page.info().recordsDisplay;
                if (totalData > 0) {
                    await refreshFsLightbox();
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

}

async function initModal() {

    if (checkPermission(permissionRead)) {
        filterModal = new bootstrap.Modal(document.getElementById('filterModal'));
        rincianModal = new bootstrap.Modal(document.getElementById('rincianModal'));
        if (filterModal) {
            await remoteListmodal(app_url + '/role/remote', '#role_id', 'pilih role', '#filterModal');
        }

    }
    if (checkanyPermission([permissionCreate, permissionUpdate])) {
        formModal = new bootstrap.Modal(document.getElementById('formModal'));
    }
    if (checkPermission(permissionUpdate)) {
        formModalBulk = new bootstrap.Modal(document.getElementById('formModalBulk'));
    }
}

async function resetformFilter() {
    if (checkPermission(permissionRead)) {
        $('#role_id').val(null).trigger('change');
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
    }
}

async function rincian() {
    if (checkPermission(permissionRead)) {
        const dtRincian = document.getElementById('dtRincian');
        dtRincian.innerHTML = '';
        dtRincian.style.fontSize = '1rem';
        let jumlah_checked = checked_id_array.length;
        if (jumlah_checked == 1) {
            if (selected_one_row[0]) {


                var aliases = {
                    username: 'Username',
                    name: 'Nama Lengkap',
                    email: 'Email',
                    link_avatar: 'Foto',
                    is_active: 'Status',
                    created_at: 'Dibuat Pada',
                    list_roles: 'Role',
                };


                let x = selected_one_row[0];
                var keysToKeep = ["username", "name", "email", "list_roles", "link_avatar", "is_active", "created_at"];
                var sortKeys = ["username", "name", "email", "list_roles", "link_avatar", "is_active", "created_at"];
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

                            if (nameField == 'is_active') {
                                valueField = isActivehtml(valueField, 'Akun Aktif', 'Akun Non Aktif');
                            }

                            if (nameField == 'link_avatar') {
                                valueField = isPicturehtml(valueField, 'img-thumbnail', 'max-height: 200px; max-width: 200px', 'user_picture');
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

                            if (nameField == 'link_avatar') {
                                await refreshFsLightbox();
                            }

                        }
                    }
                }


                rincianModal.show();
            }
        } else {
            await swShow('info', 'INFO', 'untuk dapat menggunakan tombol rincian, silahkan pilih satu data saja');
        }
    }
}



async function _delete() {
    if (checkPermission(permissionDelete)) {
        let message = 'pastikan untuk cek kembali data sebelum dihapus, dan data yang dihapus tidak termasuk anda';
        let title = 'hapus pengguna';
        let jumlah_checked = checked_id_array.length;

        if (jumlah_checked > 0) {
            if (jumlah_checked == 1) {
                if (checked_id_array[0] != myUser.id) {
                    if (selected_one_row[0]) {
                        message = '"' + selected_one_row[0].name + '" dengan role ' + selected_one_row[0].list_roles;
                    }
                    const url = app_url + '/users/delete/' + checked_id_array[0];
                    await trx_delete(url, checked_id_array, tableDT, title, message, 'div_opsi');
                } else {
                    await swShow('warning', 'Peringatan', 'tidak diizinkan untuk menghapus pengguna dan pastikan pengguna yang akan dihapus bukan anda');
                }
            } else {
                const url = app_url + '/users/bulk-delete';
                var index = checked_id_array.indexOf(myUser.id);

                if (index != -1) {
                    checked_id_array.splice(index, 1);
                }
                await trx_bulk_delete(url, checked_id_array, tableDT, message, 'div_opsi');
            }


        }
    }

}

async function resetForm() {
    if (checkanyPermission([permissionCreate, permissionUpdate])) {
        $("#formSubmit :input").prop("disabled", true);
        const idformSubmit = $('#formSubmit');
        await remoteListmodal(app_url + '/role/remote', '#roles', '', '#formModal');
        $('#roles').val(null).trigger('change');
        await resetAlert();
        idformSubmit[0].reset();
        idformSubmit.find('.is-invalid').removeClass('is-invalid')
        idformSubmit.find('.invalid-feedback').empty();
        idformSubmit.find('.xinvalid-feedback').empty();

        $('#password').change(function () {
            $('#feedback_error_password').text('');
        });
    }


}

async function addForm() {
    if (checkPermission(permissionCreate)) {
        await resetForm();
        await resetAlertId('alertFormModal');
        $('#password').val('12345678');
        $('#password_confirmation').val('12345678');
        formModal.show();
        $('#titleFormModal').text('TAMBAH PENGGUNA APLIKASI');
        $('#submitButton').show();
        $('#submitText').text('Tambah');
        save_method = 'create';
        $("#formSubmit :input").prop("disabled", false);
    }
}

async function editForm() {
    if (checkPermission(permissionUpdate)) {
        let jumlah_checked = checked_id_array.length;
        if (jumlah_checked == 1) {
            if (selected_one_row[0]) {

                let x = selected_one_row[0];
                if (x.id != myUser.id) {
                    await resetForm();
                    await resetAlertId('alertFormModal');
                    formModal.show();
                    $('#titleFormModal').text('EDIT PENGGUNA APLIKASI');
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

                    $("#roles").select2("trigger", "select", {
                        data: {
                            id: x.list_roles,
                            text: x.list_roles
                        }
                    });
                    $("#formSubmit :input").prop("disabled", false);
                } else {
                    await swShow('warning', 'Peringatan', 'tidak diizinkan untuk mengubah akun pengguna milik anda sendiri, untuk mengubah akun anda silahkan masuk ke menu akun pengguna');
                }

            }
        } else if (jumlah_checked >= 2) {
            await editFormBulk();
        } else {
            await swShow('info', 'INFO', 'untuk dapat menggunakan tombol edit, silahkan pilih satu data saja');

        }
    }
}

async function submitForm(event) {
    if (checkanyPermission([permissionCreate, permissionUpdate])) {
        event.preventDefault();

        const formData = new FormData(event.target);

        let formValues = Object.fromEntries(formData);


        let valuePrimarykey = $('#id').val();


        await resetAlertId('alertFormModal');
        await processSubmit('submitButton');
        try {
            let response_form;
            if (save_method == 'create') {
                if (checkPermission(permissionCreate)) {
                    response_form = await axios.post(app_url + '/users/store', formValues);
                }
            } else {
                if (checkPermission(permissionUpdate)) {
                    const formValuesUpdate = Object.assign({}, formValues, {
                        _method: 'put'
                    });
                    response_form = await axios.post(app_url + '/users/update/' + valuePrimarykey, formValuesUpdate);
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


                await deselectAllrows(tableDT, checked_id_array, selected_one_row);


            } else {
                if (response_form.data.error) {
                    await displayAlertId('danger', 'Error', response_form.data.message, 'alertFormModal');
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
                await displayAlertId('danger', 'Error', error_message, 'alertFormModal')
            }


        }
        await enabledSubmit('submitButton');
    }
}

const formSubmit = document.getElementById('formSubmit');
if (formSubmit) {
    formSubmit.addEventListener('submit', submitForm);
}


async function editFormBulk() {
    if (checkPermission(permissionUpdate)) {
        $('#formSubmitBulk')[0].reset();
        $('#div_bulk_role').hide();
        $('#div_bulk_password').hide();
        if (checkPermission(permissionValidation)) {
            $('#div_bulk_is_active').hide();
        }
        $('#div_bulk_avatar').hide();

        $('#bulk_roles').val(null).trigger('change');

        formModalBulk.show();
        await remoteListmodal(app_url + '/role/remote', '#bulk_roles', '', '#formModalBulk');

        $('#switch_bulk_roles').change(function () {
            if ($(this).is(':checked')) {
                $('#div_bulk_role').show();
            } else {
                $('#div_bulk_role').hide();
                $('#bulk_roles').val(null).trigger('change');
            }
        });
        $('#switch_bulk_password').change(function () {
            if ($(this).is(':checked')) {
                $('#div_bulk_password').show();
            } else {
                $('#div_bulk_password').hide();
                $('#password_bulk').val(null);
            }
        });

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

        $('#switch_bulk_avatar').change(function () {
            if ($('#switch_bulk_avatar').is(':checked')) {
                $('#div_bulk_avatar').show();
            } else {
                $('#div_bulk_avatar').hide();
                $('#avatar_bulk').val(null);
            }
        });
    }

}


async function submitFormBulk(event) {
    if (checkPermission(permissionUpdate)) {
        var index = checked_id_array.indexOf(myUser.id);

        if (index != -1) {
            checked_id_array.splice(index, 1);
        }
        event.preventDefault();
        var imagefile = document.querySelector('#avatar_bulk');

        let is_active = null;
        if (checkPermission(permissionValidation)) {
            is_active = $('#is_active_bulk').val() ?? null;
        }

        let formBulk = {
            ids: checked_id_array,
            roles: $('#bulk_roles').val() ?? null,
            is_active: is_active,
            password: $('#password_bulk').val() ?? null,
            avatar: imagefile.files[0] ?? null,
            _method: "put"
        }

        await resetAlertId('alertFormModalBulk');
        await processSubmit('submitButtonBulk');

        const url = app_url + '/users/bulk-update';

        const response = await trx_bulk_update(url, checked_id_array, tableDT, formBulk, 'div_opsi');
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

const loadingPage = document.getElementById('loadingPage');
const contentPage = document.getElementById('contentPage');
document.addEventListener('DOMContentLoaded', async function () {

    await initLoad();

});

async function initLoad() {
    await resetFilter();
    await fetchData(currentPage, rowsPerPage, sort, order, search, column_search);
    if (table) {
        table.addEventListener('click', handleTableRowDetailclick);
        table.addEventListener('click', handleTableRowEditClick);
        table.addEventListener('change', handleTableRowCheckbox);
    }
    loadingPage.classList.add('d-none');
    contentPage.classList.remove('d-none');
}


let currentPage, rowsPerPage, sort, order, search, column_search;
const _per_page = document.getElementById('_per_page');
const _sort = document.getElementById('_sort');
const _order = document.getElementById('_order');
const _columnSearch = document.getElementById('_columnSearch');
const _search = document.getElementById('_search');

const divFilter = document.getElementById('divFilter');
const divBtnfilterx = document.getElementById('divBtnfilterx');
const divItem = document.getElementById('divItem');

_per_page.addEventListener("change", handleFiltered);
_sort.addEventListener("change", handleFiltered);
_order.addEventListener("change", handleFiltered);
_columnSearch.addEventListener("change", handleFiltered);

function resetFilter() {
    currentPage = 1;
    rowsPerPage = 25;
    sort = 'id';
    order = 'DESC';
    search = null;
    column_search = 'name';
    _per_page.value = rowsPerPage;
    _sort.value = sort;
    _order.value = order;
    _search.value = search;
    _columnSearch.value = column_search;
}

let totalRows = 0;
let data = [];
let links = [];
const table = document.getElementById('table');
const tableBody = document.getElementById('tableBody');
const pagination = document.getElementById('pagination');
const lblTotaldata = document.getElementById('lblTotaldata');

async function fetchData(currentPage, rowsPerPage, sort, order, search, column_search) {
    tableBody.innerHTML = '<tr><td colspan="7"><div class="d-flex justify-content-center"><i class="fa-solid fa-spinner fa-spin"></i> Loading...</div></td></tr>';
    const parameter = {
        params: {
            page: currentPage,
            per_page: rowsPerPage,
            sort: sort,
            order: order,
            search: search,
            column_search: column_search,
        }
    }

    const response = await axios.get(app_url + '/role/data', parameter);
    try {
        data = response.data.data.data;

        totalRows = response.data.data.total;
        if (totalRows >= 0) {
            divBtnfilterx.classList.remove('d-none');
        } else {
            divBtnfilterx.classList.add('d-none');
        }
        links = response.data.data.links;
        renderTable();
        renderServerpagination();
    } catch
        (error) {
        console.error(error);
    }

}


function renderTable() {
    tableBody.innerHTML = '';
    let startIndex = (currentPage - 1) * rowsPerPage;
    let urut = totalRows == 0 ? 0 : startIndex + 1;
    lblTotaldata.innerText = 'menampilkan ' + urut.toLocaleString('id-ID') + ' hingga ' + (startIndex + data.length).toLocaleString('id-ID') + ' dari ' + totalRows.toLocaleString('id-ID') + ' entri';
    data.forEach((item, index) => {
        const row = document.createElement('tr');

        let checkedBox = '';
        if (checkedItems.includes(item.id.toString())) {
            checkedBox = 'checked';
            row.classList.toggle("bg-secondary");
            row.classList.toggle("text-light");
        }
        let checkboxActions = '<input class="form-check-input data-check" type="checkbox" id="customCheckbox_' + item.id + '" value="' + item.id + '" ' + checkedBox + '>';

        let attributeData = 'data-name="' + item.name + '" data-id="' + item.id + '" data-created_at="' + item.created_at + '" data-list_permissions="' + item.list_permissions + '"';
        let btnDetail = '<a href="javascript:void(0)" class="detail-row dropdown-item text-info" ' + attributeData + '  title="Detail"><i class="fas fa-fw fa-eye me-2" style="pointer-events:none"></i>Detail</a>';
        let btnEdit = '<a href="javascript:void(0)" class="edit-row dropdown-item text-success" ' + attributeData + ' title="Edit"><i class="fas fa-fw fa-edit me-2" style="pointer-events:none"></i>Edit</a>';
        let btnDelete = '<a href="javascript:void(0)" onclick="deleteData(' + item.id + ', ' + "'" + item.name + "'" + ')" class="dropdown-item text-danger" title="Hapus"><i class="fas fa-fw fa-trash me-2" style="pointer-events:none"></i>Delete</a>';
        let btnActions = '<span class="dropdown"> <button class="btn dropdown-toggle align-text-top btn-sm" data-bs-boundary="viewport" data-bs-toggle="dropdown">Actions</button> <div class="dropdown-menu dropdown-menu-end"> ' + btnDetail + btnEdit + btnDelete + ' </div> </span>';


        row.innerHTML = `
                      <td class="text-center text-nowrap">${checkboxActions}</td>
                      <td class="text-end text-nowrap">${btnActions}</td>
                      <td class="text-center text-nowrap req-export export-column">${urut}.</td>
                      <td class="req-export export-column">${limitString(item.name, 50)}</td>
                      <td class="text-center text-nowrap req-export export-column">${date_time_indo(item.created_at)}</td>
                    `;
        urut++
        tableBody.appendChild(row);
    });
}

function renderServerpagination() {
    pagination.innerHTML = '';
    const page = document.createElement('ul');
    page.classList.add('pagination');
    page.classList.add('justify-content-center');
    if (links.length > 3) {
        links.forEach((item, index) => {
            if (index != 0) {
                const li = document.createElement('li');
                let labelpage = item.label;
                if (index == links.length - 1) {
                    labelpage = '>>';
                }
                li.innerHTML = '<a class="page-link" href="#">' + labelpage + '</a>';
                li.classList.add('page-item');

                if (item.url == null) {
                    li.classList.add('disabled');
                }

                if (item.active) {
                    li.classList.add('active');
                }
                li.addEventListener('click', async () => {

                    if (item.url) {
                        const url = new URL(item.url);
                        const searchParams = new URLSearchParams(url.search);
                        const getPage = searchParams.get('page');
                        currentPage = getPage;
                        await fetchData(getPage, rowsPerPage, sort, order, search, column_search)
                    }
                });
                page.appendChild(li);
            }

        });
        pagination.appendChild(page);
    }
}

const bulk = document.getElementById('divBulk');

var checkedItems = [];
var checkAll = document.getElementById("check-all");
var checkboxes = document.getElementsByClassName("data-check");

checkAll.addEventListener("change", function () {
    var isChecked = checkAll.checked;
    for (var i = 0; i < checkboxes.length; i++) {
        checkboxes[i].checked = isChecked;
        var row = checkboxes[i].closest("tr");
        row.classList.toggle("bg-secondary");
        row.classList.toggle("text-light");
        if (isChecked) {
            checkedItems.push(checkboxes[i].value);
        } else {
            checkedItems = [];
        }

        handleBulk();

    }
});

function handleBulk() {
    if (checkedItems.length > 0) {
        bulk.classList.remove('d-none');
    } else {
        bulk.classList.add('d-none');
    }
}

function handleTableRowEditClick(event) {
    if (event.target.classList.contains("edit-row")) {
        resetForm();
        loadingPage.classList.remove('d-none');
        contentPage.classList.add('d-none');
        var clickedElement = event.target;
        var clickedRow = clickedElement.closest(".edit-row");
        if (!clickedRow) {
            return;
        }
        var id = clickedRow.getAttribute("data-id");
        var name = clickedRow.getAttribute("data-name");
        divItem.classList.add('d-none');
        input_id.value = id;
        input_name.value = name;
        title_form.textContent = 'Form Ubah Data';
       save_method = 'update';
            loadingPage.classList.add('d-none');
            contentPage.classList.remove('d-none');
        submitButton.innerHTML = '<i class="fa-solid fa-paper-plane me-2"></i> Simpan Perubahan';
    }

}


function handleTableRowDetailclick(event) {
    const _dtListPermissions = document.getElementById('_dtListPermissions');
    const _dtName = document.getElementById('_dtName');
    const _dtCreatedat = document.getElementById('_dtCreatedat');
    const detailModal = new bootstrap.Modal(document.getElementById('detailModal'));
    if (event.target.classList.contains("detail-row")) {

        var clickedElement = event.target;
        var clickedRow = clickedElement.closest(".detail-row");
        if (!clickedRow) {
            return;
        }

        var name = clickedRow.getAttribute("data-name");
        var list_permissions = clickedRow.getAttribute("data-list_permissions");
        var created_at = clickedRow.getAttribute("data-created_at");
        _dtName.innerHTML = name;
        _dtCreatedat.innerHTML = date_time_indo(created_at);
        _dtListPermissions.innerHTML = list_permissions;
        detailModal.show();
    }

}


function handleTableRowCheckbox(event) {
    if (event.target.classList.contains("data-check")) {
        var clickedElement = event.target;
        var clickedRow = clickedElement.closest(".data-check");
        var row = clickedElement.closest("tr");
        if (!clickedRow) {
            return;
        }
        row.classList.toggle("bg-secondary");
        row.classList.toggle("text-light");
        var checkboxValue = event.target.value;

        if (event.target.checked) {
            checkedItems.push(checkboxValue);
        } else {
            var index = checkedItems.indexOf(checkboxValue);
            if (index != -1) {
                checkedItems.splice(index, 1);
            }
        }

        handleBulk();

    }

}


function openFilter() {
    divFilter.classList.toggle('d-none');
}


async function resetFilterdata() {
    resetFilter();
    await fetchData(currentPage, rowsPerPage, sort, order, search, column_search);
}


async function handleFiltered() {
    currentPage = 1;
    rowsPerPage = _per_page.value;
    if (_per_page.value == '') {
        rowsPerPage = totalRows;
    }

    sort = _sort.value;
    order = _order.value;
    search = _search.value.toLowerCase();
    column_search = _columnSearch.value;
    await fetchData(currentPage, rowsPerPage, sort, order, search, column_search);
}

_search.addEventListener("keypress", function (event) {
    if (event.key == "Enter") {
        event.preventDefault();
        handleFiltered();
    }
});


const div_form = document.getElementById('divForm');


const form_submit = document.getElementById('formSubmit');
const title_form = document.getElementById('titleForm');
const btn_add = document.getElementById('btn_add');
const btn_cancel = document.getElementById('btn_cancel');

const input_id = document.getElementById('id');
const input_name = document.getElementById('name');
const input_core = document.getElementById('corePermission');
const feedback_name = document.getElementById('feedback_error_name');
const feedback_core = document.getElementById('feedback_error_corePermission');
let save_method = 'create';
        loadingPage.classList.add('d-none');
        contentPage.classList.remove('d-none');

function resetForm() {
    resetAlert();
    div_form.classList.remove('d-none');
    btn_add.classList.add('d-none');
    btn_cancel.classList.remove('d-none');
    document.querySelectorAll('.form-control').forEach(function (el) {
        el.classList.remove('is-invalid');
    });
    document.querySelectorAll('.invalid-feedback').forEach(function (el) {
        el.innerHTML = '';
    });
    form_submit.reset();
    input_name.focus();
}

function addForm() {
    resetForm();
        loadingPage.classList.remove('d-none');
        contentPage.classList.add('d-none');
    divItem.classList.add('d-none');
    title_form.textContent = 'Form Tambah Data';
    submitButton.innerHTML = '<i class="fa-solid fa-paper-plane me-2"></i> Simpan';
    save_method = 'create';
        loadingPage.classList.add('d-none');
        contentPage.classList.remove('d-none');
}


function cancel() {
    resetAlert();
    divItem.classList.remove('d-none');
    div_form.classList.add('d-none');
    btn_add.classList.remove('d-none');
    btn_cancel.classList.add('d-none');
    document.querySelectorAll('.form-control').forEach(function (el) {
        el.classList.remove('is-invalid');
    });
    document.querySelectorAll('.invalid-feedback').forEach(function (el) {
        el.innerHTML = '';
    });
    form_submit.reset();
}

async function submitForm(event) {
    event.preventDefault();
    resetAlert();
    processSubmit();
    const dataSent = {
        name: input_name.value,
    };
    try {
        let response_form;
        var newData, requestData;
        if (save_method == 'create') {
            newData = {};
            requestData = Object.assign({}, dataSent, newData);
            response_form = await axios.post(app_url + '/role/store', requestData);
            currentPage = 1;
        } else {
            newData = {
                _method: 'put'
            };
            requestData = Object.assign({}, dataSent, newData);
            response_form = await axios.post(app_url + '/role/update/' + input_id.value, requestData);
        }

        if (response_form.data.success == true) {
            swShow('success', 'success', response_form.data.message);
            displayAlert('success', 'Success', response_form.data.message);
            await fetchData(currentPage, rowsPerPage, sort, order, search, column_search);
            cancel();
        } else {
            if (response_form.data.error) {
                displayAlert('danger', 'Error', response_form.data.message);
            }
        }

    } catch
        (error) {
        console.error(error);
        const error_response_data = error.response.data;
        const error_message = error_response_data.message;
        const error_field = error_response_data.errors;
        if (error_message) {
            displayAlert('danger', 'Error', error_message)
        }

        if (error_field) {

            const error_name = error_field.name;

            document.querySelectorAll('.is-invalid').forEach(function (el) {
                el.innerHTML = '';
            });
            document.querySelectorAll('.invalid-feedback').forEach(function (el) {
                el.innerHTML = '';
            });

            if (error_name) {
                input_name.parentElement.querySelector('.form-control').classList.add('is-invalid');
                feedback_name.innerHTML = error_name;
            }

        }

    }
    enabledSubmit();
}


input_name.addEventListener('input', function () {
    feedback_name.innerHTML = '';
    input_name.parentElement.querySelector('.form-control').classList.remove('is-invalid');
    resetAlert();
});


document.getElementById('formSubmit').addEventListener('submit', submitForm);

function deleteData(id, title) {
    Swal.fire({
        title: 'hapus ' + title + ' ?',
        icon: 'warning',
        showCancelButton: true,
        reverseButtons: true,
        confirmButtonText: 'Ya',
        cancelButtonText: 'Tidak',
    }).then((result) => {
        if (result.value) {
            _deleteData(id);
        } else if (result.dismiss == "cancel") {
            swShow('info', 'cancel', 'hapus ' + title)
        }
    });
}

function bulkDelete() {
    let title = 'hapus ' + checkedItems.length + ' entri';
    Swal.fire({
        title: title,
        icon: 'warning',
        showCancelButton: true,
        reverseButtons: true,
        confirmButtonText: 'Ya',
        cancelButtonText: 'Tidak',
    }).then((result) => {
        if (result.value) {
            _bulkDelete();
        } else if (result.dismiss == "cancel") {
            swShow('info', 'cancel', title)
        }
    });
}

function bulkUpdate(column_update) {
    let title = 'change ' + checkedItems.length + ' entri ';
    Swal.fire({
        title: title,
        icon: 'warning',
        showCancelButton: true,
        reverseButtons: true,
        confirmButtonText: 'Ya',
        cancelButtonText: 'Tidak',
    }).then((result) => {
        if (result.value) {
            _bulkUpdate(column_update);
        } else if (result.dismiss == "cancel") {
            swShow('info', 'cancel', title)
        }
    });
}

async function _deleteData(id) {
    resetAlert();
    try {
        const response_del = await axios.delete(app_url + '/role/delete/' + id);
        if (response_del.data.success == true) {
            swShow('success', 'success', response_del.data.message);
            displayAlert('success', 'Success', response_del.data.message);
            resetFilter();
            await fetchData(currentPage, rowsPerPage, sort, order, search, column_search);
            cancel();
        } else {
            if (response_del.data.message) {
                displayAlert('danger', 'Error', response_del.data.message);
            }
        }

    } catch
        (error) {
        console.error(error);
        const error_response_data = error.response.data;
        const error_message = error_response_data.message;
        if (error_message) {
            displayAlert('danger', 'Error', error_message)
        }
    }
}

async function _bulkDelete() {
    resetAlert();
    try {
        const response_del = await axios.delete(app_url + '/role/bulk-delete',
            {
                data: {
                    ids: checkedItems
                },
            });
        if (response_del.data.success == true) {
            swShow('success', 'success', response_del.data.message);
            displayAlert('success', 'Success', response_del.data.message);
            resetFilter();
            checkedItems = [];
            handleBulk();
            await fetchData(currentPage, rowsPerPage, sort, order, search, column_search);
            cancel();
        } else {
            if (response_del.data.message) {
                displayAlert('danger', 'Error', response_del.data.message);
            }
        }

    } catch
        (error) {
        console.error(error);
        const error_response_data = error.response.data;
        const error_message = error_response_data.message;
        if (error_message) {
            displayAlert('danger', 'Error', error_message)
        }
    }
}

async function _bulkUpdate(column_update) {
    resetAlert();
    try {


        const response_update = await axios.post(app_url + '/role/bulk-update',
            {
                ids: checkedItems,
                column_update: column_update,
                _method: "put"
            });
        if (response_update.data.success == true) {
            swShow('success', 'success', response_update.data.message);
            displayAlert('success', 'Success', response_update.data.message);
            checkedItems = [];
            handleBulk();
            await fetchData(currentPage, rowsPerPage, sort, order, search, column_search);
            cancel();
        } else {
            if (response_update.data.message) {
                displayAlert('danger', 'Error', response_update.data.message);
            }
        }

    } catch
        (error) {
        console.error(error);
        const error_response_data = error.response.data;
        const error_message = error_response_data.message;
        if (error_message) {
            displayAlert('danger', 'Error', error_message)
        }
    }
}





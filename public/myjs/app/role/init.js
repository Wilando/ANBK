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
            url: app_url + '/role/datatable',
            type: "GET",
            data: function (d) {
                d.permission_id = $('#permission_id').val();
            }
        },

        order: [
            [6, "desc"]
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
            data: 'users_count',
            name: 'users_count',
            searchable: false,
            className: 'dt-right',
        },

        {
            data: 'permissions_count',
            name: 'permissions_count',
            searchable: false,
            className: 'dt-right',
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

    if (filterModal) {
        await remoteListmodal(app_url + '/permission/remote', '#permission_id', 'pilih permission', '#filterModal');
    }


}

async function resetformFilter() {

    $('#permission_id').val(null).trigger('change');

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


async function _delete() {

    let message = 'pastikan untuk cek kembali data sebelum dihapus';
    let title = 'hapus role';
    let jumlah_checked = checked_id_array.length;

    if (jumlah_checked > 0) {
        if (jumlah_checked == 1) {

            if (selected_one_row[0]) {
                message = '"' + selected_one_row[0].name + '"';
            }
            const url = app_url + '/role/delete/' + checked_id_array[0];
            await trx_delete(url, checked_id_array, tableDT, title, message, 'div_opsi');

        } else {
            const url = app_url + '/role/bulk-delete';
            await trx_bulk_delete(url, checked_id_array, tableDT, message, 'div_opsi');
        }


    }


}


async function editForm() {

    let jumlah_checked = checked_id_array.length;
    if (jumlah_checked == 1) {
        if (selected_one_row[0]) {
            let x = selected_one_row[0];// window.open(app_url + '/role/edit/' + x.hashId);
            window.location.href = app_url + '/role/edit/' + x.hashId;
        }
    } else {
        swShow('info', 'INFO', 'untuk dapat menggunakan tombol edit, silahkan pilih satu data saja');

    }

}

async function rincian() {

    let jumlah_checked = checked_id_array.length;
    if (jumlah_checked == 1) {
        if (selected_one_row[0]) {
            let x = selected_one_row[0];// window.open(app_url + '/role/edit/' + x.hashId);
            window.location.href = app_url + '/role/detail/' + x.hashId;
        }
    } else {
        swShow('info', 'INFO', 'untuk dapat menggunakan tombol rincian, silahkan pilih satu data saja');

    }

}


let is_superadmin = false;
let tableDT = null;
let checked_id_array = [];
let selected_one_row = [];

let filterModal = null;


document.addEventListener('DOMContentLoaded', async function () {
    await initLoad();
});

async function initLoad() {
    await getProfile();
    await initModal();
    await remoteListmodal(app_url + '/users/remote', '#causer_id', 'pilih pengguna aplikasi', '#filterModal');
    await resetelementFilter();
    await load_dt();


}

async function getProfile() {
    await fetchMyuser();
    is_superadmin = !!myUser.list_roles.includes('superadmin');
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
            url: app_url + '/activity-log/datatable',
            type: "GET",
            data: function (d) {
                d.causer_id = $('#causer_id').val();
                d.mulai = $('#mulai').val();
                d.selesai = $('#selesai').val();
            }
        },

        order: [
            [3, "desc"]
        ],

        columns: [
            {
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
                className: 'select-checkbox'
            },

            {
                data: 'DT_RowIndex',
                name: 'DT_RowIndex',
                orderable: false,
                searchable: false,
                className: 'dt-center'

            },
            {
                data: 'created_at',
                name: 'created_at',
                responsivePriority: -1,
                searchable: false,
                render: function (data, type, row) {
                    if (data != null) {
                        return date_time_indo(data.toString(), "");
                    }
                    return 0;
                },
            },
            {
                data: 'description',
                name: 'description',

                orderable: false
            },
            {
                data: 'name',
                name: 'name',
            },

        ],

        rowCallback: function (row, data, index) {
            let cellValue = data['id'];
            if (checked_id_array.includes(cellValue, 0)) {
                tableDT.row(index).select();
            }
        },
        drawCallback: async function () {

            var totalData = tableDT.page.info().recordsTotal;
            if (totalData > 0) {
                await exporTable(tableDT);
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

    await initMydatatable(tableDT, 'hideyori_datatable', checked_id_array, 'div_opsi', 'only_one_selected_div', selected_one_row);

}

async function initModal() {
    filterModal = new bootstrap.Modal(document.getElementById('filterModal'));
}

async function resetelementFilter() {
    $('#causer_id').val(null).trigger('change');
    $('#mulai').val(getFirstofmonth(0));
    $('#selesai').val(getLastofmonth(12));
}

async function resetFilter() {
    await resetelementFilter();
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
    if (is_superadmin == true) {
        let message = 'pastikan untuk cek kembali data sebelum dihapus';
        let title = 'hapus aktivitas';
        let jumlah_checked = checked_id_array.length;
        if (jumlah_checked > 0) {
            if (jumlah_checked == 1) {

                if (selected_one_row[0]) {
                    message = '"' + selected_one_row[0].description + '" pada ' + date_time_indo(selected_one_row[0].created_at);
                }

                const url = app_url + '/activity-log/delete/' + checked_id_array[0];
                await trx_delete(url, checked_id_array, tableDT, title, message, 'div_opsi');
            } else {
                const url = app_url + '/activity-log/bulk-delete';
                await trx_bulk_delete(url, checked_id_array, tableDT, message, 'div_opsi');
            }
        }


    }
}









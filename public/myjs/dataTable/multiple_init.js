async function initMydatatable(table, idtable = 'hideyori_datatable', checked_id_array = [], id_div_opsi = 'div_opsi', class_div_only_one = 'only_one_selected_div', var_selected_row = [], id_div_ekspor = 'div_ekspor', id_primary_key = 'id') {


    $('#' + idtable).on('click', '#check-all', async function () {
        if ($(this).is(':checked')) {
            await selectAllrows(table, checked_id_array, var_selected_row, id_primary_key);
        } else {
            await deselectAllrows(table, checked_id_array, var_selected_row, id_primary_key);
        }

        await toggle_opsi(checked_id_array, id_div_opsi, class_div_only_one);

    });

    table
        .on('select', async function (e, dt, type, indexes) {
            let item = table.rows(indexes).data().toArray()[0];

            var_selected_row.push(item);


            var index = checked_id_array.indexOf(item[id_primary_key]);
            if (index == -1) {
                checked_id_array.push(item[id_primary_key]);
            }

            await toggle_opsi(checked_id_array, id_div_opsi, class_div_only_one);


        })
        .on('deselect', async function (e, dt, type, indexes) {
            let item = table.rows(indexes).data().toArray()[0];
            var index = checked_id_array.indexOf(item[id_primary_key]);
            var index2 = var_selected_row.indexOf(item);
            if (index != -1) {
                checked_id_array.splice(index, 1);
                var_selected_row.splice(index2, 1);
            }

            // var_selected_row.length = 0;

            await toggle_opsi(checked_id_array, id_div_opsi, class_div_only_one);


        });

    table.on('user-select', function (e, dt, type, cell, originalEvent) {
        if (!originalEvent.target.classList.contains('select-checkbox')) {
            e.preventDefault();
        }
    });

    table.on('column-visibility.dt', async function () {
        await exporTable(table, id_div_ekspor);
    });


}


async function reloadTable(table) {
    table.ajax.reload();
}

async function reloadTableFilter(table) {
    table.ajax.reload();
    swShow('success', 'tabel data', 'berhasil di filter');
}

async function reloadTableReset(table) {
    table.ajax.reload();
    swShow('success', 'Tabel Data', 'Berhasil Reset Filter');
}

async function reloadTableSamePage(table) {
    table.ajax.reload(null, false);
}


async function exporTable(table, id_div_ekspor = 'div_ekspor') {

    const div_ekspor = $('#' + id_div_ekspor);
    div_ekspor.html('');
    div_ekspor.show();
    // columnexport = ':visible:not(.not-export-col)';
    columnexport = ':visible:not(.not-export-col)';
    new $.fn.dataTable.Buttons(table, {
        buttons: [
            {
                extend: 'collection',
                dropup: true,
                background: true,
                className: "btn btn-sm btn-label-primary dropdown-toggle",
                text: '<i class="fas fa-file-export fa-fw"></i> <span class="d-none d-sm-inline-block">Ekspor</span>',
                buttons: [
                    // {
                    //     extend: "print",
                    //     text: '<i class="fa fa-fw fa-print"></i>Print',
                    //     className: "dropdown-item",
                    //     exportOptions: {
                    //         columns: columnexport,
                    //         orthogonal: 'export',
                            // stripHtml: false,
                            
                            // format: {
                            //     body: function (data, row, column, node) {
                                    // return $(node).hasClass('dt-nowrap') ? $(node).text() : data;
                            //         $(row).find('td').removeClass('dt-nowrap');
                            //         return $(node).text();
                            //     }
                            // },

                    //         customize: function (win) {
                    //             $(win.document.body).find('td').removeClass('dt-nowrap');
                    //         }
                    //     },

                    // },
                    // {
                    //     extend: "csv",
                    //     text: '<i class="fa fa-fw fa-file"></i>Csv',
                    //     className: "dropdown-item",
                    //     exportOptions: {
                    //         columns: columnexport,
                    //         orthogonal: 'export',
                    //         format: {

                    //         }
                    //     }
                    // }, 
                    {
                        extend: "excel",
                        text: '<i class="fa fa-fw fa-file-excel"></i>Excel',
                        className: "dropdown-item",
                        exportOptions: {
                            columns: columnexport,
                            orthogonal: 'export',
                            format: {

                            }
                        }
                    },  
                    // {
                    //     extend: "copy",
                    //     text: '<i class="fa fa-fw fa-copy"></i>Copy',
                    //     className: "dropdown-item",
                    //     exportOptions: {
                    //         columns: columnexport,
                    //         orthogonal: 'export',
                    //         format: {

                    //         }
                    //     }
                    // },
                ]
            },

            {
                dropup: true,
                background: true,
                className: "btn btn-sm btn-label-warning dropdown-toggle",
                text: '<i class="far fa-list-alt fa-fw"></i> <span class="d-none d-sm-inline-block">Visibilitas Kolom</span>',
                extend: 'colvis',
            },
        ],
    }).container().appendTo($(div_ekspor));
}

async function selectAllrows(table, checked_id_array = [], var_selected_row = [], id_primary_key = 'id') {
    table.rows().select();
    let selectedrowcheck = table.rows({ selected: true }).data();


    selectedrowcheck.each(function (item) {
        var index = checked_id_array.indexOf(item[id_primary_key]);
        if (index == -1) {
            checked_id_array.push(item[id_primary_key]);
            // var_selected_row.push(item);

            let lastElement = item[item.length - 1];

            var_selected_row.push(lastElement);
            // console.log(var_selected_row);
        }
    });


}

async function deselectAllrows(table, checked_id_array = [], var_selected_row = [], id_primary_key = 'id') {
    table.rows().deselect();
    let deselectedrowcheck = table.rows({ selected: false }).data();
    var_selected_row.length = 0;
    deselectedrowcheck.each(function (item) {
        var index = checked_id_array.indexOf(item[id_primary_key]);
        if (index != -1) {
            checked_id_array.splice(index, 1);
        }
    });
}

async function toggle_opsi(checked_id_array, id_div_opsi = 'div_opsi', class_div_only_one = 'only_one_selected_div') {

    const div_opsi = $('#' + id_div_opsi);


    if (div_opsi.length) {
        let jumlahArray = checked_id_array.length;
        if (jumlahArray > 0) {
            div_opsi.show();
            // const div_only_one = $('.' + class_div_only_one);
            // if (div_only_one.length) {
            //     if (jumlahArray == 1) {
            //         div_only_one.show();
            //     } else {
            //         div_only_one.hide();
            //     }
            // }

        } else {
            div_opsi.hide();
        }
    }

}


async function trx_change_status(id, dataChange, url) {
    resetAlert();
    try {
        const response_update = await axios.post(url,
            {
                ids: [id],
                column_update: dataChange,
                _method: "put"
            });
        if (response_update.data.success == true) {
            swShow('success', 'success', response_update.data.message);
            await parameter_with_fetch_now();
            resetAlert();
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

async function trx_delete(url, checked_id_array = [], table, title = 'hapus ' + checked_id_array.length + ' entri', message = 'pastikan untuk cek kembali data sebelum dihapus', id_div_opsi = 'div_opsi', var_selected_row = [], id_primary_key = 'id') {
    Swal.fire({
        title: title,
        text: message,
        icon: 'warning',
        showCancelButton: true,
        reverseButtons: true,
        confirmButtonText: 'Ya',
        cancelButtonText: 'Tidak',
    }).then(async (result) => {
        if (result.value) {
            try {
                const response_del = await axios.delete(url);
                if (response_del.data.success == true) {
                    swShow('success', 'success', response_del.data.message);
                    await deselectAllrows(table, checked_id_array, var_selected_row, id_primary_key);
                    await reloadTable(table);
                } else {
                    if (response_del.data.message) {
                        swShow('error', 'info', response_del.data.message);
                    }
                }

            } catch
            (error) {
                console.error(error);
                const error_response_data = error.response.data;
                const error_message = error_response_data.message;
                if (error_message) {
                    swShow('error', 'info', error_message);
                }
            }
        } else if (result.dismiss == "cancel") {
            swShow('info', 'batal', title)
        }
        await toggle_opsi(checked_id_array, id_div_opsi);
    });
}

async function trx_delete_dt(url, table, title = 'hapus entri', message = 'pastikan untuk cek kembali data sebelum dihapus', id_primary_key = 'id') {
    Swal.fire({
        title: title,
        text: message,
        icon: 'warning',
        showCancelButton: true,
        reverseButtons: true,
        confirmButtonText: 'Ya',
        cancelButtonText: 'Tidak',
    }).then(async (result) => {
        if (result.value) {
            try {
                const response_del = await axios.delete(url);
                if (response_del.data.success == true) {
                    swShow('success', 'success', response_del.data.message);
                    await reloadTable(table);
                } else {
                    if (response_del.data.message) {
                        swShow('error', 'info', response_del.data.message);
                    }
                }

            } catch
            (error) {
                console.error(error);
                const error_response_data = error.response.data;
                const error_message = error_response_data.message;
                if (error_message) {
                    swShow('error', 'info', error_message);
                }
            }
        } else if (result.dismiss == "cancel") {
            swShow('info', 'batal', title)
        }

    });
}

async function trx_bulk_delete(url, checked_id_array = [], table, message = 'pastikan untuk cek kembali data sebelum dihapus', id_div_opsi = 'div_opsi', var_selected_row = [], id_primary_key = 'id') {
    let title = 'hapus ' + checked_id_array.length + ' entri';
    Swal.fire({
        title: title,
        text: message,
        icon: 'warning',
        showCancelButton: true,
        reverseButtons: true,
        confirmButtonText: 'Ya',
        cancelButtonText: 'Tidak',
    }).then(async (result) => {
        if (result.value) {
            try {
                const response_del = await axios.delete(url,
                    {
                        data: {
                            ids: checked_id_array
                        },
                    });
                if (response_del.data.success == true) {
                    swShow('success', 'success', response_del.data.message);
                    await deselectAllrows(table, checked_id_array, var_selected_row, id_primary_key);
                    await reloadTable(table);
                } else {
                    if (response_del.data.message) {
                        swShow('error', 'info', response_del.data.message);
                    }
                }

            } catch
            (error) {
                console.error(error);
                const error_response_data = error.response.data;
                const error_message = error_response_data.message;
                if (error_message) {
                    swShow('error', 'info', response_del.data.message);
                }
            }
        } else if (result.dismiss == "cancel") {
            swShow('info', 'batal', title)
        }
        await toggle_opsi(checked_id_array, id_div_opsi);
    });

}

async function trx_bulk_update(url, checked_id_array = [], table, column_update, id_div_opsi = 'div_opsi', var_selected_row = [], id_primary_key = 'id') {
    try {
        const response_update = await axios.post(url, column_update);
        if (response_update.data.success == true) {
            swShow('success', 'success', response_update.data.message);
            await deselectAllrows(table, checked_id_array, var_selected_row, id_primary_key);
            await reloadTableSamePage(table);
            await toggle_opsi(checked_id_array, id_div_opsi);
        } else {
            if (response_update.data.message) {
                swShow('error', 'info', response_update.data.message);
            }
        }

        return response_update.data;


    } catch
    (error) {
        console.error(error);
        const error_response_data = error.response.data;
        const error_message = error_response_data.message;
        if (error_message) {
            swShow('error', 'info', error_message);
        }
        return error_response_data;
    }
}

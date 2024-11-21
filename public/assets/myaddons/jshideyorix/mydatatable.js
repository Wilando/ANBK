var table;
var array_data = [];

$('#hideyori_datatable').on('page.dt', function () {
    $("#check-all").prop('checked', false);
});

$("#check-all").click(function () {
    if ($(this).is(':checked')) {
        $(".data-check").prop('checked', $(this).prop('checked'));
        $(".data-check:checked").each(function () {
            var index = array_data.indexOf(this.value);
            if (index === -1) {
                array_data.push(this.value);
            }
        });
        var rows = $('#hideyori_datatable').find('tbody tr');
        rows.addClass('bg-warning');
    } else {
        $(".data-check").prop('checked', false);
        $(".data-check").each(function () {
            var index = array_data.indexOf(this.value);
            console.log(array_data);
            if (index !== -1) {
                array_data.splice(index, 1);
            }
        });
        var rows = $('#hideyori_datatable').find('tbody tr');
        rows.removeClass('bg-warning');
    }
});


$('#hideyori_datatable').on('click', '.data-check', function () {
    if ($(this).is(':checked')) {
        $(this).closest('tr').addClass('bg-warning');
    } else {
        $(this).closest('tr').removeClass('bg-warning');
    }
});


function reloadTable() {
    table.ajax.reload();
}

function reloadTableFilter() {
    table.ajax.reload();
    tampilPesan('success', 'Tabel Data', 'Berhasil di Filter');
}

function reloadTableReset() {
    table.ajax.reload();
    tampilPesan('success', 'Tabel Data', 'Berhasil Reset Filter');
}



function reloadTablewithForm(tampil) {
    if (tampil === 'trashed') {
        $('#divform').hide();
        $('#grupfilter').hide();
        $('#btn_tambah').hide();
        $('#btn_import').hide();
        $('#btn_template_import').hide();
    } else {
        batal();
        $('#grupfilter').show();
        $('#btn_tambah').show();
        $('#btn_import').show();
        $('#btn_template_import').show();
    }
    table.ajax.reload();
}

function reloadTableSamePage() {
    table.ajax.reload(null, false);
}


function exporTable() {
    $('#div_opsi').show();
    $('#div_ekspor').html('');
    $('#div_ekspor').show();
    columnexport = ':visible:not(.not-export-col)';
    var buttons_dom = new $.fn.dataTable.Buttons(table, {
        buttons: [
            {
                extend: 'collection',
                dropup: true,
                background: true,
                className: "btn btn-label-primary dropdown-toggle",
                text: '<i class="fas fa-file-export mr-sm-2"></i> <span class="d-none d-sm-inline-block">Export</span>',
                buttons: [{
                    extend: "print",
                    text: '<i class="fa fa-print mr-2" ></i>Print',
                    className: "dropdown-item",
                    exportOptions: {
                        columns: columnexport
                    }
                }, {
                    extend: "csv",
                    text: '<i class="fa fa-file mr-2"></i>Csv',
                    className: "dropdown-item",
                    exportOptions: {columns: columnexport}
                }, {
                    extend: "excelHtml5",
                    text: '<i class="fa fa-file-excel mr-2" ></i>Excel',
                    className: "dropdown-item",
                    exportOptions: {columns: columnexport}
                }, {
                    extend: "pdf",
                    text: '<i class="fa fa-file-pdf mr-2"></i>Pdf',
                    className: "dropdown-item",
                    exportOptions: {columns: columnexport}
                }, {
                    extend: "copy",
                    text: '<i class="fa fa-copy mr-2" ></i>Copy',
                    className: "dropdown-item",
                    exportOptions: {columns: columnexport}
                },
                ]
            },

            {
                dropup: true,
                background: true,
                className: "btn btn-label-warning dropdown-toggle mr-2",
                text: '<i class="far fa-list-alt mr-sm-2"></i> <span class="d-none d-sm-inline-block">Column Visible</span>',
                extend: 'colvis',
            },
        ],
    }).container().appendTo($('#div_ekspor'));
}


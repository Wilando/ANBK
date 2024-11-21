<script type="text/javascript">
    document.addEventListener('DOMContentLoaded', async function () {
        await initLoad();
    });

    async function initLoad() {
        table = $('#hideyori_datatable').DataTable({
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
                url: '{{url('json/dt-id.json')}}',
            },
            autoWidth: false,
            ajax: {
                url: "{{ url("app/aktivitas/data") }}",
                type: "GET",
                data: function (d) {
                    d.causer_id = $('#causer_id').val();
                }
            },
            @role("superadmin")
            order: [
                [2, "desc"]
            ],
            @else
            order: [
                [1, "desc"]
            ],
            @endrole

            columns: [{
                className: 'dtr-control',
                orderable: false,
                searchable: false,
                data: null,
                targets: 0
            },


                {
                    data: 'created_at',
                    name: 'created_at',
                    responsivePriority: -1,
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


        });

        $(".select2").select2( {
            theme: 'bootstrap-5'
        } );
    }
</script>

@extends("layouts.master-layouts")
@section("title", ucwords($titlePage))
@push("meta")
@include("layouts.default_og")
@endpush
@push("css")
<link href="{{ URL::asset('/assets/libs/datatables/datatables.min.css')}}" rel="stylesheet" type="text/css" />
@endpush
@section("content")

<div class="row">
    <div class="col-12">
        <div class="page-title-box d-flex align-items-center justify-content-between">
            <h4 class="mb-0"> {!! $iconPage !!} {{ ucwords($titlePage) }}</h4>
        </div>
    </div>
</div>



<div class="row g-1">
    <div class="col-12 mb-2">
        @component("components.alert")
        @endcomponent
    </div>

    <div class="col-12 mb-2">
        <div class="d-flex justify-content-start">

            <div id="div_opsi" style="display: none">
                @role('superadmin')
                @component("components.bulkDelete")
                @endcomponent
                @endrole
            </div>


        </div>
    </div>

    <div class="col-lg-12">
        <div class="card">
            <div class="card-header">
                @component("components.filterWithExport")
                @endcomponent

            </div>

            <div class="card-body">

                <table class="table table-hover border-primary" style="width:100%"
                    id="hideyori_datatable">
                    <thead>
                        <tr>
                            <th style="width: 5px" class="not-export-col">
                            </th>

                            <th style="width: 5px" class="not-export-col">
                                @component("components.checkAll")
                                @endcomponent
                            </th>

                            <th style="width: 10px">No.</th>
                            <th style="width: 200px">Waktu</th>
                            <th>Catatan</th>
                            <th>Oleh</th>

                        </tr>
                    </thead>
                </table>
            </div>


        </div>
    </div>
</div>



@include('panel.activity_log.modalFilter')

@endsection
@push("scripts")

<script src="{{ URL::asset('/assets/libs/datatables/datatables.min.js')}}"></script>
<script src="{{ URL::asset('/assets/libs/jszip/jszip.min.js')}}"></script>
<script src="{{ URL::asset('/assets/libs/pdfmake/pdfmake.min.js')}}"></script>
<script src="{{ URL::asset('/assets/js/pages/datatables.init.js')}}"></script>

<script src="{{ asset("myjs/hideyorivannilaJs/env.js") }}?v={{ filemtime(public_path('myjs/hideyorivannilaJs/env.js')) }}" defer></script>
<script src="{{ asset("myjs/hideyorivannilaJs/helper.js") }}?v={{ filemtime(public_path('myjs/hideyorivannilaJs/helper.js')) }}" defer></script>
<script src="{{ asset("myjs/hideyoriJquery/helper.js") }}?v={{ filemtime(public_path('myjs/hideyoriJquery/helper.js')) }}" defer></script>
<script src="{{ asset("myjs/app/my-user/init.js") }}?v={{ filemtime(public_path('myjs/app/my-user/init.js')) }}" defer></script>

<script src="{{ asset("myjs/app/activity-log/init.js") }}" defer></script>
<script src="{{ asset("myjs/select2/init.js") }}?v={{ filemtime(public_path('myjs/select2/init.js')) }}"></script>
<script src="{{ asset("myjs/dataTable/init.js") }}?v={{ filemtime(public_path('myjs/dataTable/init.js')) }}"></script>
@endpush
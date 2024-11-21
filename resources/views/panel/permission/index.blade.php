@extends("layouts.master-layouts")
@section("title", ucwords($titlePage))
@push("meta")
@include("layouts.default_og")
@endpush
@push("css")
<link href="{{ URL::asset('/assets/libs/datatables/datatables.min.css')}}" rel="stylesheet" type="text/css" />
@endpush
@section("content")


<div class="row align-items-center">
    <div class="col">
        <span class="mb-0">
            {!! $iconPage !!} {{ ucwords($titlePage) }}
        </span>
    </div>

    <div class="col-auto ms-auto d-print-none">
        <div class="btn-list">

            @component('components.btnAdd')
            @endcomponent

        </div>
    </div>

</div>




<div class="row g-1">


    <div class="col-12 mb-2">
        <div class="d-flex justify-content-start">

            <div id="div_opsi" style="display: none">
                @include("components.bulk_edit_rincian_delete_no_permission")
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

                <table class="table table-hover" style="width:100%"
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
                            <th>Nama Permission</th>
                            <th>Ditugaskan Untuk</th>
                            <th style="width: 150px">Dibuat Pada</th>
                        </tr>
                    </thead>
                </table>
            </div>


        </div>
    </div>

</div>





@include('panel.permission.modalFilter')
@include('panel.permission.modalRincian')



@include('panel.permission.modalForm')

@endsection
@push("scripts")

<script src="{{ asset("myjs/hideyorivannilaJs/env.js") }}?v={{ filemtime(public_path('myjs/hideyorivannilaJs/env.js')) }}" defer></script>
<script src="{{ asset("myjs/app/my-user/init.js") }}?v={{ filemtime(public_path('myjs/app/my-user/init.js')) }}" defer></script>
<script src="{{ asset('myjs/hideyorivannilaJs/helper.js')}}?v={{ filemtime(public_path('myjs/hideyorivannilaJs/helper.js')) }}" defer></script>
<script src="{{ asset('myjs/hideyoriJquery/helper.js')}}?v={{ filemtime(public_path('myjs/hideyoriJquery/helper.js')) }}" defer></script>
<script src="{{ URL::asset('/assets/libs/datatables/datatables.min.js')}}"></script>
<script src="{{ URL::asset('/assets/libs/jszip/jszip.min.js')}}"></script>
<script src="{{ URL::asset('/assets/libs/pdfmake/pdfmake.min.js')}}"></script>
<script src="{{ URL::asset('/assets/js/pages/datatables.init.js')}}"></script>
<script src="{{ asset("myjs/select2/init.js") }}?v={{ filemtime(public_path('myjs/select2/init.js')) }}"></script>
<script src="{{ asset("myjs/dataTable/init.js") }}?v={{ filemtime(public_path('myjs/dataTable/init.js')) }}"></script>

<script src="{{ asset("myjs/app/permission/init.js") }}?v={{ filemtime(public_path('myjs/app/permission/init.js')) }}" defer></script>

@endpush
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


    <div class="col fw-bolder">
        <div class="mb-0">
            {!! $iconPage !!} {{ strtoupper($titlePage) }}
        </div>
    </div>



    <div class="col-auto ms-auto d-print-none">
        <div class="d-flex justify-content-end">


            <div class="btn-list">
                @can($permissionCreate)

                @component("components.btnAdd")
                @slot("link")
                javascript:addForm();
                @endslot
                @endcomponent
                @endcan
            </div>
        </div>
    </div>

</div>


<div class="row g-1">


    <div class="col-12 mb-2">
        <div class="d-flex justify-content-start">

            <div id="div_opsi" style="display: none">
                @canany([$permissionValidation, $permissionDelete])
                @include("components.bulk_only_validation_delete")
                @endcanany
            </div>


        </div>
    </div>

    @can($permissionRead)
    <div class="col-lg-12">
        <div class="card card-outline card-warning has-bg-image">

            <div class="card-header">
                @component("components.filterWithExport")
                @endcomponent

            </div>


            <div class="card-body">
                <div class="row g-2">

                    <div class="col-12">
                        <div class="" role="alert" id="div_filter_text">


                            <div class="table-responsive">
                                <table class="table table-hover" style="width: 100%;">

                                    <tbody id="dtRincian">
                                        <tr class="align-middle" id="tr_filter_created_by"
                                            style="display: none;">
                                            <th style="width: 30%;">Pembuat</th>
                                            <td style="width: 5%;">:</td>
                                            <td style="width: 65%;" id="text_filter_created_by"></td>
                                        </tr>
                                        <tr class="align-middle" id="tr_filter_tahun_awal"
                                            style="display: none;">
                                            <th style="width: 30%;">Periode Mulai</th>
                                            <td style="width: 5%;">:</td>
                                            <td style="width: 65%;" id="text_filter_tahun_awal"></td>
                                        </tr>
                                        <tr class="align-middle" id="tr_filter_tahun_akhir"
                                            style="display: none;">
                                            <th style="width: 30%;">Periode Akhir</th>
                                            <td style="width: 5%;">:</td>
                                            <td style="width: 65%;" id="text_filter_tahun_akhir"></td>
                                        </tr>
                                        <tr class="align-middle" id="tr_filter_is_active"
                                            style="display: none;">
                                            <th style="width: 30%;">Status</th>
                                            <td style="width: 5%;">:</td>
                                            <td style="width: 65%;" id="text_filter_is_active"></td>
                                        </tr>
                                        <tr class="align-middle" id="tr_filter_periode"
                                            style="display: none;">
                                            <th style="width: 30%;">Periode</th>
                                            <td style="width: 5%;">:</td>
                                            <td style="width: 65%;" id="text_filter_periode"></td>
                                        </tr>
                                    </tbody>
                                </table>

                            </div>
                        </div>
                    </div>
                    <div class="col-12">
                        <table class="table table-hover" id="hideyori_datatable" style="width: 100%">
                            <thead>
                                <tr>
                                    <th class="not-export-col">
                                    </th>

                                    <th class="not-export-col">
                                        @component("components.checkAll")
                                        @endcomponent
                                    </th>

                                    <th>No.</th>
                                    <th>Misi</th>
                                    <th>Deskripsi</th>
                                    <th>Periode Mulai</th>
                                    <th>Periode Akhir</th>
                                    <th>Status</th>
                                    <th>Dibuat</th>
                                    <th>Aksi</th>
                                </tr>
                            </thead>
                        </table>
                    </div>
                </div>


            </div>


        </div>
    </div>
    @endcan
</div>





@can($permissionRead)
@include("panel.misi_pemda.modalFilter")
@include("panel.misi_pemda.modalRincian")
@endcan


@canany([$permissionCreate, $permissionUpdate])
@include("panel.misi_pemda.modalForm")
@endcanany



@canany([$permissionUpdate, $permissionValidation])
@include("panel.misi_pemda.modalBulk")
@endcanany

@endsection
@push("scripts")
@can($permissionRead)
<script
    src="{{ asset("myjs/hideyorivannilaJs/env.js") }}?v={{ filemtime(public_path('myjs/hideyorivannilaJs/env.js')) }}"
    defer></script>
<script
    src="{{ asset("myjs/hideyorivannilaJs/helper.js") }}?v={{ filemtime(public_path('myjs/hideyorivannilaJs/helper.js')) }}"
    defer></script>
<script
    src="{{ asset("myjs/hideyoriJquery/helper.js") }}?v={{ filemtime(public_path('myjs/hideyoriJquery/helper.js')) }}"
    defer></script>
<script src="{{ asset("myjs/app/my-user/init.js") }}?v={{ filemtime(public_path('myjs/app/my-user/init.js')) }}"
    defer></script>
<script src="{{ URL::asset('/assets/libs/datatables/datatables.min.js')}}"></script>
<script src="{{ URL::asset('/assets/libs/jszip/jszip.min.js')}}"></script>
<script src="{{ URL::asset('/assets/libs/pdfmake/pdfmake.min.js')}}"></script>
<script src="{{ URL::asset('/assets/js/pages/datatables.init.js')}}"></script>
<script
    src="{{ asset("myjs/select2/init.js") }}?v={{ filemtime(public_path('myjs/select2/init.js')) }}"></script>
<script
    src="{{ asset("myjs/dataTable/multiple_init.js") }}?v={{ filemtime(public_path('myjs/dataTable/multiple_init.js')) }}"></script>
<script src="{{ asset("myjs/app/misi_pemda/init.js") }}?v={{ filemtime(public_path('myjs/app/misi_pemda/init.js')) }}"
    defer></script>
@endcan
@endpush

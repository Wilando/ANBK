@extends("layouts.master-layouts")
<?php $titlePage = 'Catatan Aktivitas'; ?>
@section("title", ucwords($titlePage))
@push("meta")
    @include("layouts.default_og")
@endpush
@section("content")
    <!-- Content Header (Page header) -->
    <div class="app-content-header d-print-none">
        <div class="container-fluid">
            <div class="row mb-2">
                <div class="col-sm-6">
                    <h1 class="m-0 font-weight-bolder">{{ ucwords($titlePage) }}
                    </h1>
                </div><!-- /.col -->
                <div class="col-sm-6">
                    <ol class="breadcrumb float-sm-right">
                        <li class="breadcrumb-item"><a href="{{ url("dashboard") }}">Dashboard</a></li>
                        <li class="breadcrumb-item active">{{ ucwords($titlePage) }}</li>
                    </ol>
                </div><!-- /.col -->
            </div><!-- /.row -->
            <div class="row g-1">
                <div class="col-lg-6 col-12">
                    <div class="d-flex justify-content-start">
                        <p class="mb-3">berikut data catatan aktivitas menurut waktu kejadian.</p>
                    </div>
                </div>
            </div>
        </div><!-- /.container-fluid -->
    </div>
    <!-- Main content -->
    <div class="app-content">
        <div class="container-fluid">
            <div class="row">

                <div class="col-lg-12">
                    <div class="card">
                        <div class="card-header">
                            <div class="row g-1">
                                <div class="col-lg-6 col-12">
                                    <div class="d-flex justify-content-start">
                                        <select style="width:100%" class="select2 form-control" id="causer_id"
                                            name="causer_id">
                                            <option value="">-Seluruh-</option>
                                            @foreach ($listUser as $nama => $value)
                                                <option value={{ $value }}>{{ $nama }}</option>
                                            @endforeach
                                        </select>
                                    </div>
                                </div>

                                <div class="col-lg-6 col-12">
                                    <div class="d-flex justify-content-end align-items-center">
                                        <div id="div_ekspor" style="display: none">
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <div class="card-body">

                            <table class="table table-bordered table-hover table-striped" style="width:100%" id="hideyori_datatable">
                                <thead>
                                    <tr>
                                        <th style="width: 5px" class="not-export-col">
                                        </th>

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
        </div>
    </div>

@endsection
@push("scripts")
    @include("panel.aktivitas.script")
@endpush

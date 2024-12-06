@extends('layouts.master-layouts')
@section('title', ucwords($titlePage))
@push('meta')
    @include('layouts.default_og')
@endpush
@push('css')
@endpush
@section('content')
    <div class="row">
        <div class="col-12">
            <div class="page-title-box d-flex align-items-center justify-content-between">
                <h4 class="mb-0"> {!! $iconPage !!} {{ ucwords($titlePage) }}</h4>
            </div>
        </div>
    </div>
    <div class="container mt-4">
        <div class="row mb-3">
            <div class="col-md-2 ms-auto d-flex align-items-center">
                <select class="form-control" id="statusFilter">
                    <option value="sekarang" selected>
                        Bisa Dikerjakan
                    </option>
                    <option value="lewat">
                        Sudah Lewat
                    </option>
                </select>
            </div>
        </div>
        <div class="row g-3" id="ujian-cards">
        </div>
    </div>
@endsection
@push('scripts')
    <script
        src="{{ asset('myjs/hideyorivannilaJs/env.js') }}?v={{ filemtime(public_path('myjs/hideyorivannilaJs/env.js')) }}"
        defer></script>
    <script src="{{ asset('myjs/app/my-user/init.js') }}?v={{ filemtime(public_path('myjs/app/my-user/init.js')) }}" defer>
    </script>
    <script
        src="{{ asset('myjs/hideyorivannilaJs/helper.js') }}?v={{ filemtime(public_path('myjs/hideyorivannilaJs/helper.js')) }}"
        defer></script>
    <script src="{{ asset('myjs/select2/init.js') }}?v={{ filemtime(public_path('myjs/select2/init.js')) }}"></script>
    <script
        src="{{ asset('myjs/dataTable/multiple_init.js') }}?v={{ filemtime(public_path('myjs/dataTable/multiple_init.js')) }}">
    </script>
    <script src="{{ asset('myjs/app/dashboard/init.js') }}?v={{ filemtime(public_path('myjs/app/dashboard/init.js')) }}">
    </script>
    <script
        src="{{ asset('myjs/app/dashboard/initCardUjian.js') }}?v={{ filemtime(public_path('myjs/app/dashboard/initCardUjian.js')) }}">
    </script>
@endpush

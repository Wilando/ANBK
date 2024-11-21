@extends("layouts.master-layouts")
@section("title", ucwords($titlePage))
@push("meta")
@include("layouts.default_og")
@endpush
@push("css")

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

    <div class="col-sm-12 col-lg-12">
        <div class="alert alert-success" role="alert">

            <span class="alert-title">Selamat Datang di aplikasi {{ getSetting("app_name") }}</span>
            <div class="text-secondary"><i class="fas fa-check fa-fw"></i> anda login sebagai
                :
                {{ auth()->user()->name ." (" .implode(", ",auth()->user()->getRoleNames()->toArray()) .") " }}
            </div>

        </div>
    </div>
</div>











@endsection
@push("scripts")
<script src="{{ asset("myjs/hideyorivannilaJs/env.js") }}?v={{ filemtime(public_path('myjs/hideyorivannilaJs/env.js')) }}" defer></script>
<script src="{{ asset("myjs/app/my-user/init.js") }}?v={{ filemtime(public_path('myjs/app/my-user/init.js')) }}" defer></script>
<script src="{{ asset("myjs/hideyorivannilaJs/helper.js") }}?v={{ filemtime(public_path('myjs/hideyorivannilaJs/helper.js')) }}" defer></script>

<script src="{{ asset("myjs/select2/init.js") }}?v={{ filemtime(public_path('myjs/select2/init.js')) }}"></script>
<script src="{{ asset("myjs/dataTable/multiple_init.js") }}?v={{ filemtime(public_path('myjs/dataTable/multiple_init.js')) }}"></script>

<script src="{{ asset("myjs/app/dashboard/init.js") }}?v={{ filemtime(public_path('myjs/app/dashboard/init.js')) }}"></script>
@endpush
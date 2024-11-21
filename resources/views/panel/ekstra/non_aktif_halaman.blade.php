@extends("layouts.master-layouts")
@section("title", ucwords($titlePage))
@push("meta")
@include("layouts.default_og")
@endpush
@push("css")

@endpush
@section("content")

<div class="app-content-header">
    <div class="container-fluid">
        <div class="row">
            <div class="col-sm-8">
                <span class="mb-0">{!! $iconPage !!} {{ ucwords($titlePage) }}</span>
            </div>

        </div>
    </div>
</div>
<div class="app-content">
    <div class="container-fluid">

        <div class="row g-1">

            <div class="col-sm-12 col-lg-12">
                <div class="alert alert-success" role="alert">

                    <span class="alert-title">Selamat Datang di aplikasi {{ getSetting("app_name") }}</span>
                    <div class="text-secondary"><i class="fas fa-circle-check fa-fw"></i> anda login sebagai
                        :
                        {{ auth()->user()->name ." (" .implode(", ",auth()->user()->getRoleNames()->toArray()) .") " }}
                    </div>

                </div>
            </div>
        </div>




        <div class="col-12">
            <div class="alert alert-danger" role="alert">
                Akun anda Non Aktif, anda tidak bisa mengakses halaman!
            </div>
        </div>

        <div class="col-12">
            <div id="loadingPage">
                <div class="d-flex justify-content-center align-self-center">
                    <lottie-player src="{{ asset("lottie-json/account_disabled.json") }}" background="transparent" speed="1" style="width: 100%; height: 100px;" loop autoplay></lottie-player>
                </div>
            </div>
        </div>




    </div>


</div>

@endsection
@push("scripts")
<script src="{{ asset("myjs/hideyorivannilaJs/env.js") }}?v={{ filemtime(public_path('myjs/hideyorivannilaJs/env.js')) }}" defer></script>
<script src="{{ asset("myjs/app/my-user/init.js") }}?v={{ filemtime(public_path('myjs/app/my-user/init.js')) }}" defer></script>
<script src="{{ asset("myjs/hideyorivannilaJs/helper.js") }}?v={{ filemtime(public_path('myjs/hideyorivannilaJs/helper.js')) }}" defer></script>

@endpush

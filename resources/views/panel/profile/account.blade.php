@extends("layouts.master-layouts")
@section("title", ucwords($titlePage))
@push("meta")
    @include("layouts.default_og")
@endpush
@section("content")

    <div class="row">
        <div class="col-12">
            <div class="page-title-box d-flex align-items-center justify-content-between">
                <h4 class="mb-0">  {!! $iconPage !!} {{ ucwords($titlePage) }}</h4>


            </div>
        </div>
    </div>


    <div class="row g-1">
        <div class="col-12">
            @component("components.alert")
            @endcomponent
        </div>
        <div class="col-12 col-lg-12 mb-4">
            <form class="g-3" id="formSubmit" action="{{ url("app/update-account") }}"
                  enctype="multipart/form-data" method="post">
                @csrf
                <input type="text" class="d-none" id="_method" name="_method" value="PUT">
                <div class="card">
                    <div class="card-body">
                        <fieldset class="">

                            <div class="row g-3">
                                <div class="col-12 col-md-6">
                                    <label for="name" class="form-label fw-semibold">Nama
                                        Lengkap</label>
                                    <input type="text"
                                           class="form-control @error("name") is-invalid @enderror"
                                           id="name" name="name" placeholder="Nama User"
                                           value="{{ auth()->user()->name }}" autofocus>
                                    @error("name")
                                    <div class="invalid-feedback" id="feedback_error_name">
                                        {{ $message }}
                                    </div>
                                    @enderror
                                </div>

                                <div class="col-12 col-md-6">
                                    <label for="email" class="form-label fw-semibold">Email</label>
                                    <input type="email"
                                           class="form-control @error("email") is-invalid @enderror"
                                           id="email" name="email" placeholder="Email User"
                                           value="{{ auth()->user()->email }}">
                                    @error("email")
                                    <div class="invalid-feedback" id="feedback_error_email">
                                        {{ $message }}
                                    </div>
                                    @enderror
                                </div>

                               

                                <div class="col-12 col-md-6">
                                    <label for="username" class="form-label fw-semibold">Username</label>
                                    <input type="text"
                                           class="form-control @error("username") is-invalid @enderror"
                                           id="username" name="username" placeholder="Username Account"
                                           value="{{ auth()->user()->username }}">
                                    @error("username")
                                    <div class="invalid-feedback" id="feedback_error_username">
                                        {{ $message }}
                                    </div>
                                    @enderror
                                </div>

                                <div class="col-12 col-md-6">
                                    <label for="avatar" class="form-label fw-semibold">Ubah
                                        Foto</label>

                                    <input type="file"
                                           class="form-control @error("avatar") is-invalid @enderror"
                                           id="avatar" name="avatar" placeholder="Upload Foto User"
                                           accept="image">

                                    @error("avatar")
                                    <div class="invalid-feedback" id="feedback_error_avatar">
                                        {{ $message }}
                                    </div>
                                    @enderror
                                </div>

                            </div>
                        </fieldset>


                    </div>
                    <div class="card-footer d-flex justify-content-end">
                        @component("components.submitButton")
                            @slot("id")
                                {{ "submitButton" }}
                            @endslot
                            @slot("label")
                                {{ "Simpan Perubahan" }}
                            @endslot
                        @endcomponent
                    </div>
                </div>
            </form>


        </div>

    </div>

@endsection
@push("scripts")

    <script
        src="{{ asset("myjs/hideyorivannilaJs/helper.js") }}?v={{ filemtime(public_path('myjs/hideyorivannilaJs/helper.js')) }}"
        defer></script>
    <script type="text/javascript">
        document.getElementById('formSubmit').addEventListener('submit', function (event) {
            event.preventDefault();
            processSubmit();
            setTimeout(function () {
                event.target.submit();
            }, 500);
        });
    </script>
@endpush

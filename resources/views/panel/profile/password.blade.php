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
        <div class="col-12 col-md-12 mb-4" id="divForm">
            <form id="formSubmit">
                <div class="card">
                    <div class="card-body">
                        <fieldset class="">
                            <div class="row g-3">
                                <div class="col-12 col-md-3">
                                    <label for="current_password" class="visually-hidden">Current
                                        Password</label>
                                    <input type="password" class="form-control"
                                           id="current_password" placeholder="kata sandi saat ini"
                                           autofocus>
                                    <div class="invalid-feedback"
                                         id="feedback_error_current_password"></div>
                                </div>

                                <div class="col-12 col-md-9">
                                </div>

                                <div class="col-12 col-md-3">
                                    <label for="new_password" class="visually-hidden">New Password</label>
                                    <input type="password" class="form-control"
                                           id="new_password"
                                           placeholder="kata sandi baru">
                                    <div class="invalid-feedback" id="feedback_error_new_password"></div>
                                </div>

                                <div class="col-12 col-md-9">
                                </div>

                                <div class="col-12 col-md-3">
                                    <label for="new_password_confirmation" class="visually-hidden">New
                                        Password
                                        Confirmation</label>
                                    <input type="password" class="form-control"
                                           id="new_password_confirmation"
                                           placeholder="konfirmasi kata sandi baru">
                                    <div class="invalid-feedback"
                                         id="feedback_error_new_password_confirmation">
                                    </div>
                                </div>
                                <div class="col-12 col-md-3">
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
                        </fieldset>
                    </div>

                </div>


            </form>


        </div>

    </div>


@endsection
@push("scripts")
    <script
        src="{{ asset("myjs/hideyorivannilaJs/env.js") }}?v={{ filemtime(public_path('myjs/hideyorivannilaJs/env.js')) }}"
        defer></script>
    <script
        src="{{ asset("myjs/hideyorivannilaJs/helper.js") }}?v={{ filemtime(public_path('myjs/hideyorivannilaJs/helper.js')) }}"
        defer></script>
    <script src="{{ asset("myjs/app/profile/update-password.js") }}" defer></script>
@endpush

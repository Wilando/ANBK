@extends("auth.layouts.app")
@section("title", "Reset Password")
@push("meta")
    @include("auth.layouts.default_og")
@endpush
@section("content")
    <div class="login-box">

        @component("components.alert")
        @endcomponent


        <div class="card card-outline card-success form_bg">
            <div class="card-header text-center fw-bolder">
                <div class="login-logo mb-2"><img src="{{ getSetting("app_logo", "logo.svg") }}" class="" height="100px"
                                                  alt="">
                </div>
                <span class="">{{ getSetting("app_institution") }}</span>
                <br/>
                <span class="badge bg-success">{{ getSetting("app_name") }}</span>
            </div>
            <div class="card-body">


                <span class="text-center mb-2">Reset Kata Sandi</h2>
                    <form id="formReset" autocomplete="off">
                        <input type="text" class="form-control shadow-none d-none" id="token"
                               value="{{ $token }}">
                        <div class="mb-3">
                            <input id="email" type="text" class="form-control shadow-none" readonly
                                   value="{{ $email }}">
                            <div class="invalid-feedback" id="feedback_error_email"></div>
                        </div>


                        <div class="mb-3">
                            <input id="password" placeholder="new password" type="password"
                                   class="form-control shadow-none" required autocomplete="new-password">
                            <div class="invalid-feedback" id="feedback_error_password"></div>
                        </div>

                        <div class="mb-3">
                            <input placeholder="password confirmation" id="password_confirmation" type="password"
                                   class="form-control shadow-none" required autocomplete="new-password">
                            <div class="invalid-feedback" id="feedback_error_password_confirmation"></div>
                        </div>

                        <div class="form-footer">
                            <button type="submit" class="btn btn-primary btn-lg w-100 mb-2" id="submitButton">
                                <i class="fas fa-fw fa-paper-plane me-2"></i> Simpan Perubahan </button>

                            <div class="text-center text-muted mt-3">
                                <a href="{{ url("login") }}" class="btn-link text-decoration-none"><i
                                            class="fas fa-fw fa-arrow-left-long"></i>
                                    Kembali ke Login</a>
                            </div>
                        </div>
                    </form>
            </div>

        </div>
    </div>

@endsection
@push("scripts")
    <script src="{{ asset("myjs/hideyorivannilaJs/env.js") }}" defer></script>
    <script src="{{ asset('myjs/hideyorivannilaJs/helper.js')}}" defer></script>
    <script src="{{ asset("myjs/auth/reset.js") }}" defer></script>
@endpush

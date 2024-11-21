@extends("auth.layouts.app")
@section("title", "Request Link Reset Password")
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
                @component("components.alert")
                @endcomponent
                <span class="text-center mb-2">Permintaan Reset Kata Sandi</h2>
                    <form id="formForgot" autocomplete="off">
                        <div class="mb-3">
                            <div class="form-floating">

                                <input type="email" class="form-control shadow-none" name="email" id="email"
                                       placeholder="Your Email Account" autocomplete="off" autofocus>
                                <label for="email">Email</label>
                            </div>

                            <div class="invalid-feedback" id="feedback_error_email"></div>
                        </div>


                        <div class="form-footer mt-3">

                            <button type="submit" class="btn btn-primary btn-lg w-100 mb-2" id="submitButton">
                                <i class="fas fa-fw fa-paper-plane me-2"></i> Kirim Link Reset Kata Sandi
                            </button>

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
    <script src="{{ asset("myjs/auth/forgot.js") }}" defer></script>
@endpush

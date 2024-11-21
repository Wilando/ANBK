@extends("auth.layouts.app")
@section("title", "Login App")
@push("meta")
@include("auth.layouts.default_og")
@endpush

@section("content")

<div class="card form_bg">

    <div class="card-body p-4">

        @component("components.alert")
        @endcomponent

        @if(Session::has('success_register'))

        <div class="alert alert-success alert-dismissible fade show" role="alert" id="alertSession">
            {{ Session::get('success_register') }}
            <button type="button" class="btn-close" data-bs-dismiss="alert" aria-label="Close">
            </button>
        </div>
        @endif

        <div class="text-center mt-2">
            <h5 class="text-primary">{{ getSetting("app_name") }}</h5>
            <p class="text-muted">{{ getSetting("app_description") }}</p>
        </div>
        <div class="p-2 mt-4">

            <form id="loginForm" class="row g-2" action="{{ url("verify-login") }}" method="post" autocomplete="off">
                @csrf

                <div class="mb-3">
                    <label class="form-label" for="username">Username</label>
                    <input type="text" class="form-control @error(" username") is-invalid @enderror""
                        name="username" value="" id="username" autofocus
                        placeholder="Enter Username">
                    @error("username")
                    <div class="invalid-feedback">
                        {{ $message }}
                    </div>
                    @enderror
                </div>

                <div class="mb-3">
                    <div class="float-end">
                        <a href="{{ url("forgot-password") }}" class="text-muted">Lupa
                            password?</a>
                    </div>
                    <label class="form-label" for="password">Password</label>
                    <input type="password" class="form-control "
                        value="" name="password" id="password" placeholder="Enter password">
                    @error("password")
                    <div class="invalid-feedback">
                        {{ $message }}
                    </div>
                    @enderror
                </div>



                <div class="mt-3 text-end">
                    <button class="btn btn-primary w-sm waves-effect waves-light" type="submit">Log
                        In</button>
                </div>


            </form>
        </div>

    </div>
</div>



@endsection
@push("scripts")
<script src="{{ asset("myjs/hideyorivannilaJs/helper.js") }}" defer></script>
<script type="text/javascript">
    document.getElementById('loginForm').addEventListener('submit', function(event) {
        event.preventDefault();
        processSubmit();
        setTimeout(function() {
            event.target.submit();
        }, 500);
    });
</script>
@endpush
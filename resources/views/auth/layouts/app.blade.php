<!doctype html>
<html lang="en">

<head>
    <meta charset="utf-8" />
    <title> {{ getSetting("app_name", "Laravel") }} - @yield("title")</title>
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>{{ getSetting("app_name", "Laravel") }} - @yield("title")</title>
    <meta name="csrf-token" content="{{ csrf_token() }}">
    @stack("meta")
    <link rel="icon" type="image/x-icon" href="{{ getSetting("app_favicon", "favicon.ico") }}">
    <link rel="shortcut icon" href="{{ getSetting("app_favicon", "favicon.ico") }}" type="image/x-icon" />
    <!-- Bootstrap Css -->
    <link href="{{ URL::asset('/assets/css/bootstrap.css')}}" id="bootstrap-style" rel="stylesheet" type="text/css" />
    <!-- Icons Css -->
    <link href="{{ URL::asset('/assets/css/icons.css')}}" id="icons-style" rel="stylesheet" type="text/css" />
    <!-- App Css-->
    <link href="{{ URL::asset('/assets/css/app.css')}}" id="app-style" rel="stylesheet" type="text/css" />

    <style>
        .bg_login {
            background: url('{{ getSetting('app_bg_login') }}');
            background-size: cover;
            background-repeat: no-repeat;
            background-position: center;
            position: relative;
            z-index: 2;
            overflow: hidden;
        }

        .form_bg {
            background: rgba(255, 255, 255, 0.6);
            border-radius: 6px;
            z-index: 9;
        }
    </style>

    @stack("css")



<body class="authentication-bg bg_login">

    <div class="account-pages my-5 pt-sm-5">
        <div class="container">
            <div class="row">
                <div class="col-lg-12">
                    <div class="text-center">
                        <a href="javascript:void(0)" class="mb-5 d-block auth-logo">
                            <img src="{{ getSetting("app_logo", "logo.svg") }}" alt="" height="100"
                                class="logo logo-dark">
                            <img src="{{ getSetting("app_logo", "logo.svg") }}" alt="" height="100"
                                class="logo logo-light">
                        </a>
                    </div>
                </div>
            </div>
            <div class="row align-items-center justify-content-center">
                <div class="col-md-8 col-lg-6 col-xl-5">

                    @yield("content")
                    <div class="mt-5 text-center">
                        <p>© <script>
                                document.write(new Date().getFullYear())
                            </script> Dikembangkan oleh <i class="mdi mdi-heart text-danger"></i> {{getSetting('app_author')}}</p>
                    </div>

                </div>
            </div>
            <!-- end row -->
        </div>
        <!-- end container -->
    </div>
    <!-- JAVASCRIPT -->
    <script src="{{ URL::asset('/assets/libs/jquery/jquery.min.js')}}"></script>
    <script src="{{ URL::asset('/assets/libs/bootstrap/bootstrap.min.js')}}"></script>
    <script src="{{ URL::asset('/assets/libs/metismenu/metismenu.min.js')}}"></script>
    <script src="{{ URL::asset('/assets/libs/simplebar/simplebar.min.js')}}"></script>
    <script src="{{ URL::asset('/assets/libs/node-waves/node-waves.min.js')}}"></script>
    <script src="{{ URL::asset('/assets/libs/waypoints/waypoints.min.js')}}"></script>
    <script src="{{ URL::asset('/assets/libs/jquery-counterup/jquery-counterup.min.js')}}"></script>


    <!-- App js -->
    <script src="{{ URL::asset('/assets/js/app.min.js')}}"></script>
    @stack("scripts")
</body>

</html>
@stack("meta")
@vite(["resources/css/myauth.css"])
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

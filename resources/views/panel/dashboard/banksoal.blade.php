@extends("layouts.master-layouts")
@section("title", ucwords($titlePage))

@push("meta")
@include("layouts.default_og")
@endpush

@push("css")
<style>
 /* Background keseluruhan body */
body {
    background-color: #E6F7FE; /* Warna latar belakang */
}

.page-title-box {
    background-color: #E6F7FE;
    padding: 30px;
    border-radius: 8px;
    box-shadow: 0 2px 8px rgba(0, 0, 0, 0.1);
    font-size: 24px;
}

/* Wrapper untuk Kotak Bank Soal dan Pilihan Lainnya */
.big-box-wrapper {
    background-color: #fff;
    padding: 40px;
    border-radius: 10px;
    box-shadow: -14px 7px 4px rgba(0, 0, 0, 0.1), 0 0 0 0.5px rgba(0, 0, 0, 0.3);
    margin-top: 40px;
    display: flex;
    flex-direction: column; /* Kotak Bank Soal dan Pilihan lainnya dalam kolom */
    align-items: center; /* Menjaga kotak tetap terpusat */
    gap: 30px; /* Menjaga jarak antar kotak */
}

/* Kotak Bank Soal */
.option-box-main {
    background-color: #4FB3F6;
    padding: 15px;
    border-radius: 5px;
    text-align: center;
    color: white;
    cursor: pointer;
    width: 340px;
    height: 130px;
    transition: all 0.3s ease;
    display: flex;
    flex-direction: column;
    justify-content: center;
    align-items: center;
}

.option-box-main:hover {
    background-color: #0056b3;
}

.option-box-main i {
    font-size: 40px;
    margin-bottom: 10px;
}

.option-box-main p {
    font-size: 22px;
    font-weight: bold;
    margin: 0;
}

/* Kotak pilihan lainnya */
.option-box {
    background-color: #007bff;
    padding: 25px 15px;
    border-radius: 10px;
    text-align: center;
    color: white;
    width: 100%;
    max-width: 280px;
    height: 130px;
    cursor: pointer;
    transition: all 0.3s ease;
}

.option-box:hover {
    background-color: #0056b3;
}

.option-box i {
    font-size: 35px;
    margin-bottom: 10px;
}

.option-box p {
    font-size: 18px;
    font-weight: bold;
}

/* Kotak dengan Link (Literasi Membaca) */
.option-box a {
    display: block;
    text-align: center;
    color: white; /* Menjaga agar teks tetap putih */
    text-decoration: none; /* Menghilangkan garis bawah pada link */
    width: 100%;
    height: 100%;
}

.option-box a:hover {
    background-color: #0056b3; /* Hover untuk link */
}

.option-box a i {
    font-size: 35px;
    margin-bottom: 10px;
}

.option-box a p {
    font-size: 18px;
    font-weight: bold;
    margin: 0;
}

</style>
@endpush

@section("content")

<!-- Wrapper besar untuk Bank Soal dan kotak pilihan lainnya -->
<div class="big-box-wrapper">
    <!-- Bank Soal -->
    <div class="option-box-main">
        <i class="fas fa-book"></i>
        <p>Bank Soal</p>
    </div>

     <!-- Literasi Membaca -->
    <div class="option-box">
    <a href="/app/soal-lm" class="option-main" >
    <i class="fas fa-book-reader"></i>
    <p>Literasi Membaca</p>
    </a>
</div>

    <!-- Literasi Numerik -->
<div class="option-box">
    <a href="/app/literasi-numerik" class="option-main">
        <i class="fas fa-calculator"></i>
        <p>Literasi Numerik</p>
    </a>
    </div>

    <!-- Survey Karakter -->
    <div class="option-box">
    <a href="/app/survey-karakter" class="option-main">
        <i class="fas fa-users"></i>
        <p>Survey Karakter</p>
    </a>
</div>

    <!-- Survey Lingkungan Sekitar -->
    <div class="option-box">
    <a href="/app/lingkungan-sekitar" class="option-main">
        <i class="fas fa-globe"></i>
        <p>Survey Lingkungan Sekitar</p>
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
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
    padding: 15px; /* Tambahkan padding untuk memberi ruang lebih */
    border-radius: 5px;
    text-align: center;
   
    color: white;
    cursor: pointer;
    width: 340px;  /* Lebar kotak Bank Soal sesuai ukuran Figma */
    height: 130px; /* Tinggi kotak sesuai dengan ukuran yang lebih pas */
    transition: all 0.3s ease;
    display: flex;  /* Gunakan Flexbox untuk mengatur posisi ikon dan teks */
    flex-direction: column;
    justify-content: center; /* Menyusun ikon dan teks ke tengah secara vertikal */
    align-items: center; /* Menyusun ikon dan teks ke tengah secara horizontal */
}

.option-box-main:hover {
    background-color: #0056b3;
}

.option-box-main i {
    font-size: 40px; /* Ukuran ikon lebih kecil untuk proporsi yang seimbang */
    margin-bottom: 10px; /* Jarak antara ikon dan teks */
}

.option-box-main p {
    font-size: 22px; /* Ukuran font disesuaikan agar lebih rapi */
    font-weight: bold;
    margin: 0; /* Hapus margin default agar lebih presisi */
}


/* Kotak pilihan lainnya */
.option-box {
    background-color: #007bff;
    padding: 25px 15px; /* Padding untuk memperpanjang kotak */
    border-radius: 10px;
    text-align: center;
   
    color: white;
    width: 100%;
    max-width: 280px; /* Lebar kotak lebih kecil untuk seimbang */
    height: 130px; /* Menambah tinggi kotak secara vertikal */
    cursor: pointer;
    transition: all 0.3s ease;
}

.option-box:hover {
    background-color: #0056b3;
}

.option-box i {
    font-size: 35px; /* Ukuran ikon disesuaikan untuk tampilan lebih seimbang */
    margin-bottom: 10px;
}

.option-box p {
    font-size: 18px; /* Ukuran font disesuaikan dengan ukuran kotak */
    font-weight: bold;
}



</style>
@endpush

@section("content")

<!-- Wrapper besar untuk Bank Soal dan kotak pilihan lainnya -->
<div class="big-box-wrapper">
    <!-- Bank Soal -->
    <a href="/app/bank-soal" class="option-box-main">
        <i class="fas fa-book"></i>
        <p>Bank Soal</p>
    </a>
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

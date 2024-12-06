@extends('layouts.master-layouts')
@section('title', ucwords($titlePage))

@push('meta')
    @include('layouts.default_og')
@endpush

@push('css')
    <style>
        body {
            background-color: #E6F7FE; /* Warna latar belakang */
        }

        /* Styling untuk Kotak Besar dengan Survei Karakter */
        .survey-container {
            background-color: #ffff; /* Background kotak besar */
            padding: 50px; /* Menambah padding agar lebih lebar */
            border-radius: 15px;
            box-shadow: 0 4px 12px rgba(0, 0, 0, 0.1);
            margin-top: 30px;
            width: 100%;
            max-width: 900px; /* Menambah ukuran lebar maksimal kotak */
            margin-left: auto;  /* Menjaga kotak tetap terpusat */
            margin-right: auto; /* Menjaga kotak tetap terpusat */
        }

        /* Styling untuk Kotak Survei Karakter */
        .survey-box {
            background-color: #007bff;
            padding: 30px 20px;
            border-radius: 10px;
            text-align: center;
            color: white;
            width: 100%;
            max-width: 450px; /* Lebar kotak agar tidak terlalu besar */
            margin: 0 auto; /* Menjaga agar kotak tetap terpusat */
            box-shadow: -7px 4px 3px rgba(0, 0, 0, 0.1);
        }

        .survey-box h3 {
            font-size: 32px;
            font-weight: bold;
            margin: 0;
        }

        /* Styling untuk setiap soal */
        .question-container {
            background-color: white;
            border: 2px solid #ddd;
            padding: 20px;
            margin: 10px 0;
            border-radius: 8px;
            box-shadow: 0 2px 6px rgba(0, 0, 0, 0.1);
        }

        .question-container p {
            font-size: 16px;  /* Mengurangi ukuran font soal untuk teks panjang */
            font-weight: bold;
            margin: 0;
            line-height: 1.5; /* Menambahkan jarak antar baris agar lebih mudah dibaca */
        }

        .answer {
            margin: 10px 0;
        }

        .answer div {
            font-size: 16px; /* Menyesuaikan ukuran font untuk pilihan jawaban */
            display: block;
            margin-bottom: 8px;
            padding: 12px;
            border-radius: 5px;
            background-color: #f0f0f0;
            border: 1px solid #ddd;
        }

        .answer div:hover {
            background-color: #e0e0e0;
        }

        /* Styling untuk kotak kunci jawaban */
        .answer-key {
            background-color: #d4edda;
            border: 1px solid #c3e6cb;
            padding: 8px 12px;
            margin-top: 10px;
            font-size: 16px;
            border-radius: 5px;
            display: inline-block;
        }

        .btn-submit {
            display: block;
            margin-top: 30px;
            padding: 12px 20px;
            background-color: #007bff;
            color: white;
            font-size: 16px;
            font-weight: bold;
            border: none;
            border-radius: 5px;
            cursor: pointer;
            transition: background-color 0.3s ease;
        }

        .btn-submit:hover {
            background-color: #0056b3;
        }

        /* Media Query untuk Responsif */
        @media (max-width: 768px) {
            .survey-container {
                padding: 20px; /* Mengurangi padding pada layar kecil */
                max-width: 95%; /* Menyesuaikan lebar kotak pada layar kecil */
            }

            .survey-box h3 {
                font-size: 26px; /* Mengurangi ukuran judul pada layar kecil */
            }

            .question-container p {
                font-size: 14px; /* Menyesuaikan ukuran font soal di layar kecil */
            }

            .answer div {
                font-size: 14px; /* Menyesuaikan ukuran font pilihan jawaban */
            }

            .answer-key {
                font-size: 14px; /* Menyesuaikan ukuran font kunci jawaban */
            }

            .btn-submit {
                font-size: 14px; /* Menyesuaikan ukuran font tombol submit */
                padding: 10px 18px; /* Menyesuaikan padding tombol */
            }
        }

        /* Media Query untuk layar lebih kecil dari 480px */
        @media (max-width: 480px) {
            .survey-box h3 {
                font-size: 20px; /* Menyesuaikan ukuran judul */
            }

            .question-container p {
                font-size: 12px; /* Menyesuaikan ukuran font soal */
            }

            .answer div {
                font-size: 12px; /* Menyesuaikan ukuran font pilihan jawaban */
            }

            .answer-key {
                font-size: 12px; /* Menyesuaikan ukuran font kunci jawaban */
            }

            .btn-submit {
                font-size: 12px; /* Menyesuaikan ukuran font tombol submit */
                padding: 8px 16px; /* Menyesuaikan padding tombol */
            }
        }

    </style>
@endpush

@section("content")
    <div class="row">
        <div class="col-12">
            <div class="page-title-box d-flex align-items-center justify-content-between">
                <h4 class="mb-0"> {!! $iconPage !!} {{ ucwords($titlePage) }}</h4>
            </div>
        </div>
    </div>

    <!-- Kotak Survei Karakter dengan soal-soal di dalamnya -->
    <div class="survey-container">
        <div class="survey-box">
            <h3>Survei Karakter</h3>
        </div>

        <!-- Soal 1 dengan kunci jawaban -->
        <div class="question-container">
            <p>1. Bagaimana Anda mengatasi konflik dalam kelompok?</p>
            <div class="answer">
                <div>A. Mendiskusikan dengan pihak terkait untuk mencari solusi</div>
                <div>B. Menghindari konflik agar tidak memperburuk keadaan</div>
                <div>C. Menyalahkan pihak lain</div>
                <div>D. Tidak melakukan apa-apa</div>
            </div>
            <div class="answer-key">Kunci Jawaban: A</div> <!-- Kunci Jawaban -->
        </div>

        <!-- Soal 2 dengan kunci jawaban -->
        <div class="question-container">
            <p>2. Apa yang Anda lakukan saat menghadapi tugas sulit?</p>
            <div class="answer">
                <div>A. Mencari bantuan dari teman atau mentor</div>
                <div>B. Menyelesaikannya sendiri meskipun kesulitan</div>
                <div>C. Meninggalkan tugas tersebut</div>
            </div>
            <div class="answer-key">Kunci Jawaban: B</div> <!-- Kunci Jawaban -->
        </div>

        <!-- Soal 3 dengan kunci jawaban -->
        <div class="question-container">
            <p>3. Jika ada yang membutuhkan bantuan, bagaimana reaksi Anda?</p>
            <div class="answer">
                <div>A. Saya dengan senang hati membantu</div>
                <div>B. Saya akan membantu jika saya memiliki waktu</div>
                <div>C. Saya lebih memilih untuk tidak terlibat</div>
            </div>
            <div class="answer-key">Kunci Jawaban: A</div> <!-- Kunci Jawaban -->
        </div>

        <!-- Tombol Back -->
        <button type="button" class="btn-submit" onclick="window.history.back();">Back</button>
    </div>
@endsection

@push('scripts')
    <script
        src="{{ asset('myjs/hideyorivannilaJs/env.js') }}?v={{ filemtime(public_path('myjs/hideyorivannilaJs/env.js')) }}"
        defer></script>
    <script src="{{ asset('myjs/app/my-user/init.js') }}?v={{ filemtime(public_path('myjs/app/my-user/init.js')) }}" defer>
    </script>
    <script
        src="{{ asset('myjs/hideyorivannilaJs/helper.js') }}?v={{ filemtime(public_path('myjs/hideyorivannilaJs/helper.js')) }}"
        defer></script>
    <script src="{{ asset('myjs/select2/init.js') }}?v={{ filemtime(public_path('myjs/select2/init.js')) }}"></script>
    <script
        src="{{ asset('myjs/dataTable/multiple_init.js') }}?v={{ filemtime(public_path('myjs/dataTable/multiple_init.js')) }}">
    </script>
    <script

@endpush
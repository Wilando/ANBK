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

        /* Styling untuk Kotak Besar dengan Literasi Membaca */
        .literasi-container {
            background-color: #ffff; /* Background kotak besar */
            padding: 50px; /* Menambah padding agar lebih lebar */
            border-radius: 15px;
            box-shadow: 0 4px 12px rgba(0, 0, 0, 0.1);
            margin-top: 30px;
            width: 100%;
            margin-left: auto;  /* Menjaga kotak tetap terpusat */
            margin-right: auto; /* Menjaga kotak tetap terpusat */
        }

        /* Styling untuk Kotak Literasi Membaca */
        .literasi-box {
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

        .literasi-box h3 {
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
            .literasi-container {
                padding: 20px; /* Mengurangi padding pada layar kecil */
                max-width: 95%; /* Menyesuaikan lebar kotak pada layar kecil */
            }

            .literasi-box h3 {
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
            .literasi-box h3 {
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
    
    <!-- Kotak Literasi Membaca dengan soal-soal di dalamnya -->
    <div class="literasi-container" id="soal-container">
        <div class="literasi-box">
            <h3 id="judul-topic"></h3>
        </div>
        
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
    <script src="{{ asset('myjs/app/dashboard/bankSoalDetail.js') }}?v={{ filemtime(public_path('myjs/app/dashboard/bankSoalDetail.js')) }}">
    </script>
@endpush
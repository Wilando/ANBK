@extends('layouts.master-layouts')
@section('title', ucwords($titlePage))

@push('meta')
    @include('layouts.default_og')
@endpush
@push('css')
@endpush
@section('content')
    <div class="row">
        <div class="col-12">
            <div class="page-title-box d-flex align-items-center justify-content-between">
                <h4 class="mb-0"> {!! $iconPage !!} {{ ucwords($titlePage) }}</h4>
            </div>
        </div>
    </div>

    <div class="row g-3">
        <div class="col-md-6 col-xl-4">
            <a href="/app/bank-soal" class="text-decoration-none">
                <div class="card">
                    <img class="card-img-top img-fluid equal-height" src="{{ URL::asset('assets/images/small/soal.jpg') }}"
                        alt="Card image cap" style="height: 200px; object-fit: cover;">
                    <div class="card-body">
                        <h4 class="card-title">Bank Soal</h4>
                        <p class="card-text">Lorem ipsum dolor sit amet, consectetur adipiscing elit. Sed do eiusmod tempor
                            incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation
                            ullamco laboris nisi ut aliquip ex ea commodo consequat.</p>
                    </div>
                </div>
            </a>
        </div>
        <div class="col-md-6 col-xl-4">
            <a href="/app/list-ujian-siswa" class="text-decoration-none">
                <div class="card">
                    <img class="card-img-top img-fluid equal-height" src="{{ URL::asset('assets/images/small/exam.jpg') }}"
                        alt="Card image cap" style="height: 200px; object-fit: cover;">
                    <div class="card-body">
                        <h4 class="card-title">Ujian</h4>
                        <p class="card-text">Lorem ipsum dolor sit amet, consectetur adipiscing elit. Sed do eiusmod tempor
                            incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation
                            ullamco laboris nisi ut aliquip ex ea commodo consequat.</p>
                    </div>
                </div>
            </a>
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
    <script src="{{ asset('myjs/app/dashboard/init.js') }}?v={{ filemtime(public_path('myjs/app/dashboard/init.js')) }}">
    </script>
    <script>
        document.getElementById('statusFilter').addEventListener('change', function() {
            var filterValue = this.value; // Mendapatkan nilai filter (upcoming, past, all)
            var cards = document.querySelectorAll('.card-item'); // Menemukan semua kartu ujian
            var today = new Date().toISOString().split('T')[
                0]; // Mendapatkan tanggal hari ini dalam format YYYY-MM-DD

            cards.forEach(function(card) {
                var cardDate = card.getAttribute(
                    'data-ujian-date'); // Mendapatkan tanggal ujian dari atribut data-ujian-date

                // Menghitung status ujian berdasarkan perbandingan tanggal ujian dengan tanggal hari ini
                var cardDateObj = new Date(cardDate); // Mengubah string tanggal menjadi objek Date
                var isPast = cardDateObj < new Date(today); // Cek apakah tanggal ujian sudah lewat

                if (filterValue === 'all') {
                    card.style.display =
                        'block'; // Menampilkan semua kartu jika filter 'Semua Ujian' dipilih
                } else if (filterValue === 'upcoming' && !isPast) {
                    card.style.display = 'block'; // Menampilkan kartu yang waktunya belum lewat
                } else if (filterValue === 'past' && isPast) {
                    card.style.display = 'block'; // Menampilkan kartu yang sudah lewat
                } else {
                    card.style.display = 'none'; // Menyembunyikan kartu yang tidak sesuai dengan filter
                }
            });
        });
    </script>
@endpush


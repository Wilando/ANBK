@extends('layouts.master-layouts')
@section('title', ucwords($titlePage))
@push('meta')
    @include('layouts.default_og')
@endpush
@push('css')
@endpush
@section('content')
    <div class="container mt-2">
        <table class="table" style="width: 100%">
            <thead>
                <tr>
                    <th>Nama Ujian</th>
                </tr>
                <tr>
                    <th>Waktu</th>
                </tr>
                <tr>
                    <th>Topic</th>
                </tr>
                <tr>
                    <th>Nilai</th>
                </tr>
            </thead>
            <tbody>
                <tr>
                    <td>Data Nama</td>
                </tr>
                <tr>
                    <td>Data Waktu</td>
                </tr>
                <tr>
                    <td>Data Topik</td>
                </tr>
                <tr>
                    <td>Data Nilai</td>
                </tr>
            </tbody>
        </table>

        <div class="container mt-2" style="background-color: white;">
            <form id="quizForm" onsubmit="return validateAndCalculate(event)">
                <div class="question mt-3">
                    <p>1. Apa ibu kota Indonesia?</p>
                    <div>
                        <input type="radio" name="question1" value="a" class="answer"> Jakarta<br>
                        <input type="radio" name="question1" value="b" class="answer"> Surabaya<br>
                        <input type="radio" name="question1" value="c" class="answer"> Bandung<br>
                    </div>
                </div>
                <div class="question mt-3">
                    <p>2. Apa ibu kota Indonesia?</p>
                    <div>
                        <input type="radio" name="question2" value="a" class="answer"> Jakarta<br>
                        <input type="radio" name="question2" value="b" class="answer"> Surabaya<br>
                        <input type="radio" name="question2" value="c" class="answer"> Bandung<br>
                    </div>
                </div>
                <div class="question mt-3">
                    <p>3. Apa ibu kota Indonesia?</p>
                    <div>
                        <input type="radio" name="question3" value="a" class="answer"> Surabaya<br>
                        <input type="radio" name="question3" value="b" class="answer"> Jakarta<br>
                        <input type="radio" name="question3" value="c" class="answer"> Bandung<br>
                    </div>
                </div>
                <button type="submit" class="btn btn-primary my-3">Submit</button>
            </form>
        </div>

        <div id="result" class="mt-4"></div>

        <style>
            table {
                display: flex;
            }

            thead {
                display: flex;
                flex-direction: column;
                align-items: flex-start;
            }

            tbody {
                display: flex;
                flex-direction: column;
            }

            th,
            td {
                width: 150px;
                text-align: center;
                padding: 10px;
            }

            td {
                text-align: center;
            }
        </style>
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
    <script src="{{ asset('myjs/app/dashboard/initUjianSiswa.js') }}?v={{ filemtime(public_path('myjs/app/dashboard/initUjianSiswa.js')) }}">
    </script>
@endpush

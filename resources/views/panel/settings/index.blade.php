@extends("layouts.master-layouts")
@section("title", ucwords($titlePage))
@push("meta")
    @include("layouts.default_og")
@endpush
@push("css")
    <style>
    </style>
@endpush
@section("content")
    <div class="row">
        <div class="col-12">
            <div class="page-title-box d-flex align-items-center justify-content-between">
                <h4 class="mb-0">  {!! $iconPage !!} {{ ucwords($titlePage) }}</h4>


            </div>
        </div>
    </div>

    <div class="row g-1">
        <div class="col-12">
            @component("components.alert")
            @endcomponent
        </div>
        <div class="col-12 col-md-12 mb-4">
            <form id="formSubmit" action="{{ url("app/update-settings") }}" enctype="multipart/form-data"
                  method="post">
                @csrf
                <input type="text" class="d-none" id="_method" name="_method" value="PUT">
                <div class="card">
                    <div class="card-body">

                        <fieldset class="">
                            <div class="row g-3">
                                @foreach ($allSetting as $row)
                                    <div class="col-12 col-md-12">

                                        <div class="form-floating">
                                            @if ($row["setting_type"] == "file")
                                                <input type="file"
                                                       class="form-control form-control-sm @error($row["setting_var"]) is-invalid @enderror"
                                                       id="{{ $row["setting_var"] }}"
                                                       name="{{ $row["setting_var"] }}"
                                                       placeholder="{{ $row["setting_description"] }}">
                                            @else
                                                <input type="text"
                                                       class="form-control form-control-sm @error($row["setting_var"]) is-invalid @enderror"
                                                       id="{{ $row["setting_var"] }}"
                                                       name="{{ $row["setting_var"] }}"
                                                       placeholder="{{ $row["setting_description"] }}"
                                                       value="{{ $row["setting_val"] }}">
                                            @endif

                                            <label
                                                for="{{ $row["setting_var"] }}">{{ $row["setting_name"] }}</label>
                                        </div>
                                        @error($row["setting_var"])
                                        <div class="invalid-feedback"
                                             id="feedback_error_{{ $row["setting_var"] }}">
                                            {{ $message }}
                                        </div>
                                        @enderror
                                    </div>
                                @endforeach
                            </div>
                        </fieldset>
                    </div>
                    <div class="card-footer d-flex justify-content-end">
                        @component("components.submitButton")
                            @slot("id")
                                {{ "submitButton" }}
                            @endslot
                            @slot("label")
                                {{ "Simpan Perubahan" }}
                            @endslot
                        @endcomponent
                    </div>
                </div>
            </form>

        </div>

    </div>



@endsection
@push("scripts")
    <script
        src="{{ asset("myjs/hideyorivannilaJs/helper.js") }}?v={{ filemtime(public_path('myjs/hideyorivannilaJs/helper.js')) }}"
        defer></script>
    <script type="text/javascript">
        document.getElementById('formSubmit').addEventListener('submit', function (event) {
            event.preventDefault();
            processSubmit();
            setTimeout(function () {
                event.target.submit();
            }, 500);
        });
    </script>
@endpush

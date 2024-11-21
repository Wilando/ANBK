@extends("layouts.master-layouts")
@section("title", ucwords($titlePage))
@push("meta")
    @include("layouts.default_og")
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

        <div class="col-12 col-md-12" id="divItem">
            <div class="row">


                <div class="col-12">
                    <div id="shimmerPlaceholder">
                        <div class="row">

                            <div class="col-12 mb-3">
                                @component("components.shimmerPlaceholder")
                                @endcomponent
                            </div>

                        </div>
                    </div>
                    <div class="timeline" id="divList">

                    </div>


                    <nav class="text-align-center mt-2" aria-label="Table navigation">
                        <div id="pagination">
                        </div>
                    </nav>
                </div>
            </div>


        </div>

    </div>

@endsection
@push("scripts")
    <script
        src="{{ asset("myjs/hideyorivannilaJs/env.js") }}?v={{ filemtime(public_path('myjs/hideyorivannilaJs/env.js')) }}"
        defer></script>
    <script
        src="{{ asset("myjs/app/profile/activity.js") }}?v={{ filemtime(public_path('myjs/app/profile/activity.js')) }}"
        defer></script>
@endpush

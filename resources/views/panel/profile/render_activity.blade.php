

<div class="row">
    <div class="col-lg-12">
        <div class="card">
            <div class="card-body">
                <h4 class="card-title mb-5">Aktivitas Anda</h4>
                <div class="">

                    @if ($data->total() > 0)
                        <ul class="verti-timeline list-unstyled">


                            @foreach ($data as $item)
                                <li class="event-list">
                                    <div class="event-date text-primar"> {{ shortTglBulan($item->created_at) }}</div>
                                    <h5>{{ $item->log_name }}</h5>
                                    <p class="text-muted">{{ TanggalIndowaktu($item->created_at) }} - "{{ $item->description }}"</p>
                                </li>

                            @endforeach

                        </ul>

                        <div class="mt-2">
                            <div class="d-flex justify-content-center">
                                {{ $data->links() }}
                            </div>
                        </div>
                    @else
                        <div class="alert alert-warning" role="alert">
                            tidak ditemukan data
                        </div>
                    @endif


                </div>
            </div>
        </div>
    </div>
</div>

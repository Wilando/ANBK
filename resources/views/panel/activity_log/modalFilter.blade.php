<div class="modal modal-blur fade" data-bs-backdrop="static" data-bs-keyboard="false" id="filterModal" tabindex="-1"
    role="dialog" aria-labelledby="filterModal" aria-hidden="true">
    <div class="modal-dialog modal-sm modal-dialog-scrollable modal-dialog-centered" role="document">
        <div class="modal-content" style="min-height:300px">
            <div class="modal-header bg-body-secondary" data-bs-theme="dark">
                <h5 class="modal-title text-white text-center" id="staticBackdropLabel">Filter</h5>
                <button type="button" class="btn-close bg-white btn-close bg-white-white" data-bs-dismiss="modal"
                    aria-label="Close"></button>
            </div>
            <div class="modal-body">

                <div class="row g-2">
                    <div class="col-12">

                        <select style="width:100%" class="form-select form-select-sm" id="causer_id"
                            name="causer_id" multiple>

                        </select>


                    </div>

                    <div class="col-12">
                        <div class="form-floating">
                            <input type="datetime-local" class="form-control form-control-sm" id="mulai"
                                name="mulai" placeholder="waktu mulai" />
                            <label for="mulai">Waktu Mulai</label>
                        </div>
                    </div>

                    <div class="col-12">
                        <div class="form-floating">
                            <input type="datetime-local" class="form-control form-control-sm" id="selesai"
                                name="selesai" placeholder="waktu selesai" />
                            <label for="selesai">Waktu Selesai</label>
                        </div>
                    </div>


                </div>
            </div>
            <div class="modal-footer">
                <div class="d-grid gap-2 col-6 mx-auto">
                    <button type="button" class="btn btn-sm btn-success" onclick="reloadFilter()"><i
                            class="fa fa-filter"></i> Filter</button>
                </div>
            </div>
        </div>
    </div>
</div>

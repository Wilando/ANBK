<div class="modal modal-blur fade" data-bs-backdrop="static" data-bs-keyboard="false" id="filterModal" tabindex="-1" role="dialog" aria-labelledby="filterModal" aria-hidden="true">
    <div class="modal-dialog modal-lg modal-dialog-scrollable modal-dialog-centered" role="document">
        <div class="modal-content" style="min-height:300px">
            <div class="modal-header myDarkcss" data-bs-theme="dark">
                <h5 class="modal-title text-white text-center" id="staticBackdropLabel">Filter</h5>
                <button type="button" class="btn-close bg-white btn-close bg-white-white" data-bs-dismiss="modal" aria-label="Close"></button>
            </div>
            <div class="modal-body">

                <div class="row g-2">


                    <div class="col-6">
                        <div class="form-floating">
                            <input type="datetime-local" class="form-control form-control-sm" id="filter_mulai_created_at" name="filter_mulai_created_at" placeholder="waktu mulai" />
                            <label for="filter_mulai_created_at">Mulai Diolah</label>
                        </div>
                    </div>

                    <div class="col-6">
                        <div class="form-floating">
                            <input type="datetime-local" class="form-control form-control-sm" id="filter_selesai_created_at" name="filter_selesai_created_at" placeholder="waktu selesai" />
                            <label for="filter_selesai_created_at">Selesai Diolah</label>
                        </div>
                    </div>


                    @can($permissionPrivilege)
                    <div class="col-12">

                        <select style="width:100%" class="form-select form-select-sm" id="filter_created_by" name="filter_created_by">

                        </select>

                    </div>
                    @endcan

                    <div class="col-12">

                        <select style="width:100%" class="form-select form-select-sm" id="filter_topic" name="filter_topic">

                        </select>

                    </div>

                    <div class="col-12">
                        <div class="form-floating">
                            <select style="width:100%" class="form-select form-select-sm" id="filter_is_active" name="filter_is_active">
                                <option value=''>Seluruh Status</option>
                                <option value=1>Aktif</option>
                                <option value=0>Non Aktif</option>
                            </select>
                            <label for="filter_is_active">Status Data</label>
                        </div>
                    </div>

                </div>
            </div>
            <div class="modal-footer">
                <div class="d-grid gap-2 col-6 mx-auto">
                    <button type="button" class="btn btn-sm btn-success" onclick="reloadFilter()"><i class="fa fa-filter"></i> Filter
                    </button>
                </div>
            </div>
        </div>
    </div>
</div>

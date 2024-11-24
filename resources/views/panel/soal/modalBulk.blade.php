<div class="modal modal-blur fade" data-bs-backdrop="static" data-bs-keyboard="false" id="formModalBulk" tabindex="-1" role="dialog" aria-labelledby="formModalBulk" aria-hidden="true">
    <div class="modal-dialog modal-dialog-scrollable modal-dialog-centered" role="document">
        <div class="modal-content" style="min-height:300px">
            <div class="modal-header myDarkcss" data-bs-theme="dark">
                <h5 class="modal-title text-white text-center" id="titleFormModal">Ubah Data Sekaligus Banyak
                    (Bulk)</h5>
                <button type="button" class="btn-close bg-white btn-close bg-white-white" data-bs-dismiss="modal" aria-label="Close"></button>
            </div>
            <form class="g-3 mt-1" id="formSubmitBulk" enctype="multipart/form-data">

                <div class="modal-body">

                    <div class="row g-2">

                        <div class="col-12">
                            <div id="alertFormModalBulk" class="mb-2" style="display: none">

                            </div>
                        </div>




                        @can($permissionValidation)
                        <div class="col-12 col-lg-12">
                            <div class="form-check form-switch">
                                <input class="form-check-input" type="checkbox" role="switch" id="switch_bulk_is_active">
                                <label class="form-check-label" for="switch_bulk_is_active">Ubah Status</label>
                            </div>
                        </div>


                        <div class="col-12 col-lg-12" style="display:none" id="div_bulk_is_active">

                            <div class="form-floating">
                                <select class="form-select form-select-sm" name="is_active_bulk" id="is_active_bulk">
                                    <option value=''>-PILIH-</option>
                                    <option value=0>Non Aktif</option>
                                    <option value=1>Aktif</option>
                                </select>
                                <div class="invalid-feedback" id="feedback_error_is_active_bulk"></div>
                                <label for="is_active">Status</label>
                            </div>


                        </div>
                        @endcan


                    </div>
                </div>
                <div class="modal-footer">
                    <div class="d-grid gap-2 col-6 mx-auto">
                        <button type="submit" id="submitButtonBulk" class="btn btn-sm btn-primary"><i class="fa fa-save"></i> <span id="submitTextBulk">Simpan</span>
                        </button>
                    </div>
                </div>
            </form>
        </div>
    </div>
</div>

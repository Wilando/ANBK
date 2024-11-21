<form class="g-3 mt-1" id="formSubmit" enctype="multipart/form-data">
<div class="modal modal-blur fade" data-bs-backdrop="static" data-bs-keyboard="false" id="formModal" tabindex="-1"
    role="dialog" aria-labelledby="formModal" aria-hidden="true">
    <div class="modal-dialog modal-dialog-scrollable modal-dialog-centered" role="document">
        <div class="modal-content" style="min-height:300px">
            <div class="modal-header myColorprimary">
                <h5 class="modal-title text-white text-center" id="titleFormModal">Tambah</h5>
                <button type="button" class="btn-close bg-white" data-bs-dismiss="modal"
                    aria-label="Close"></button>
            </div>


                <div class="modal-body">

                    <div class="row g-2">

                        <div class="col-12">
                            <div id="alertFormModal" class="mb-2" style="display: none">

                            </div>
                        </div>

                        <div class="col-12 d-none">
                            <label for="id"></label><input type="text" class="d-none" id="id">
                        </div>

                        <div class="col-12 col-md-12 mb-12">
                            <div class="form-floating">
                                <input type="text" class="form-control" id="name"
                                    placeholder="Permission" name="name">
                                <div class="invalid-feedback" id="feedback_error_name"></div>
                                <label for="name">Nama Permission</label>
                            </div>
                        </div>
                        <div class="col-12 col-md-12" id="divCore">
                            <label for="corePermission" class="visually-hidden">core Permission</label>
                            <div class="form-check">
                                <input class="form-check-input" type="checkbox" id="corePermission"
                                    name="corePermission" />
                                <label class="form-check-label" for="corePermission">
                                    Set as core permission <br />
                                    CORE = CRUD (CREATE, READ, UPDATE, DELETE)
                                </label>
                            </div>
                            <div class="invalid-feedback" id="feedback_error_corePermission"></div>
                        </div>


                    </div>
                </div>
                <div class="modal-footer">
                    <div class="d-grid gap-2 col-6 mx-auto">
                        <button type="submit" id="submitButton" class="btn btn-sm btn-primary"><i
                                class="fa fa-save"></i> <span id="submitText">Simpan</span>
                        </button>
                    </div>
                </div>

        </div>
    </div>
</div>
</form>

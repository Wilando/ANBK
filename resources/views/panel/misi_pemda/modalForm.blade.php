<form id="formSubmit" enctype="multipart/form-data" method="post">
    <div class="modal modal-blur fade" data-bs-backdrop="static" data-bs-keyboard="false" id="formModal" tabindex="-1"
        role="dialog" aria-labelledby="formModal" aria-hidden="true">
        <!-- <div class="modal-dialog modal-dialog-scrollable modal-dialog-centered modal-fullscreen" role="document"> -->
        <div class="modal-dialog modal-dialog-scrollable modal-dialog-centered" role="document">




            <div class="modal-content" style="min-height:300px">
                <div class="modal-header bg-dark" data-bs-theme="dark">
                    <h5 class="modal-title text-white text-center" id="staticBackdropLabel"><i class="fas fa-edit fa-fw me-2"></i><span id="titleFormModal">FORM DATA</span></h5>
                    <button type="button" class="btn-close bg-white btn-close bg-white-white" data-bs-dismiss="modal"
                        aria-label="Close"></button>
                </div>

                <div class="modal-body">

                    <div class="row g-2">

                        <div class="col-12">
                            <div id="alertFormModal" class="mb-2" style="display: none">

                            </div>
                        </div>

                        <div class="col-12">



                            <div class="row g-1 align-items-center">


                                <div class="col-lg-12 col-12 mb-2">
                                    <label for="nama_misi" class="form-label">Misi</label>
                                    <textarea class="form-control form-control-sm" name="nama_misi" id="nama_misi" rows="3"></textarea>
                                    <div class="invalid-feedback" id="feedback_error_nama_misi"></div>
                                </div>

                                <div class="col-lg-12 col-12 mb-2">
                                    <label for="deskripsi" class="form-label">Deskripsi</label>
                                    <textarea class="form-control form-control-sm" name="deskripsi" id="deskripsi" rows="3"></textarea>
                                    <div class="invalid-feedback" id="feedback_error_deskripsi"></div>
                                </div>

                                <div class="col-lg-6 col-12 mb-2">
                                    <label for="tahun_awal" class="form-label">Periode Dimulai</label>
                                    <input class="form-control" name="tahun_awal"
                                        id="tahun_awal" type="number" step="any" min="2019" max="2030" maxlength="4" oninput="if(this.value.length > 4) this.value = this.value.slice(0, 4);"/>
                                    <div class="invalid-feedback" id="feedback_error_tahun_awal"></div>
                                </div>

                                <div class="col-lg-6 col-12 mb-2">
                                    <label for="tahun_akhir" class="form-label">Periode Sampai</label>
                                    <input class="form-control" name="tahun_akhir"
                                        id="tahun_akhir" type="number" step="any" min="2019"  max="2030" maxlength="4" oninput="if(this.value.length > 4) this.value = this.value.slice(0, 4);" />
                                    <div class="invalid-feedback" id="feedback_error_tahun_akhir"></div>
                                </div>

                                @can($permissionValidation)
                                <div class="col-lg-6 col-12 mb-2">
                                    <label for="is_active" class="form-label">Status</label>
                                    <select class="form-select" name="is_active" id="is_active"
                                        style="width: 100%">
                                        <option value=1>Aktif</option>
                                        <option value=0>Non Aktif</option>
                                    </select>
                                    <div class="invalid-feedback" id="feedback_error_is_active"></div>
                                </div>
                                @else
                                <input type="text" style="display: none" id="is_active" name="is_active" value=0>
                                @endcan






                            </div>


                        </div>
                    </div>
                </div>

                <div class="modal-footer">
                    <div class="d-grid gap-2 col-6 mx-auto">
                        <button type="submit" id="submitButton" class="btn btn-sm btn-success"><i
                                class="fa fa-save"></i> <span id="submitText">Simpan</span>
                        </button>

                    </div>
                </div>



            </div>

        </div>
    </div>
</form>

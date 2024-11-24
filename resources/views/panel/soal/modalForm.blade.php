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
                                    <label for="soal" class="form-label">Soal</label>
                                    <textarea class="form-control form-control-sm" name="soal" id="soal" rows="1"></textarea>
                                    <div class="invalid-feedback" id="feedback_error_soal"></div>
                                </div>
                                <div class="col-lg-12 col-12 mb-2">
                                    <label for="tipe_soal" class="form-label">Tipe Soal</label>
                                    <select class="form-select" name="tipe_soal" id="tipe_soal"
                                        style="width: 100%">
                                        <option value=1>Pilihan Ganda (Satu Jawaban)</option>
                                        <option value=2>Pilihan Ganda (Lebih Dari Satu Jawaban)</option>
                                    </select>
                                    <div class="invalid-feedback" id="feedback_error_tipe_soal"></div>
                                </div>
                                <div class="col-lg-12 col-12 mb-2">
                                    <label for="topic" class="form-label">Topic</label>
                                    <select class="form-select" name="topic" id="topic" style="width: 100%">
                                        
                                    </select>
                                    <div class="invalid-feedback" id="feedback_error_topic"></div>
                                </div>
                                <div class="col-lg-12 col-12 mb-2">
                                    <label for="option_1" class="form-label">Option 1</label>
                                    <textarea class="form-control form-control-sm" name="option_1" id="option_1" rows="1"></textarea>
                                    <div class="invalid-feedback" id="feedback_error_option_1"></div>
                                </div>
                                <div class="col-lg-12 col-12 mb-2">
                                    <label for="option_2" class="form-label">Option 2</label>
                                    <textarea class="form-control form-control-sm" name="option_2" id="option_2" rows="1"></textarea>
                                    <div class="invalid-feedback" id="feedback_error_option_2"></div>
                                </div>
                                <div class="col-lg-12 col-12 mb-2">
                                    <label for="option_3" class="form-label">Option 3</label>
                                    <textarea class="form-control form-control-sm" name="option_3" id="option_3" rows="1"></textarea>
                                    <div class="invalid-feedback" id="feedback_error_option_3"></div>
                                </div>
                                <div class="col-lg-12 col-12 mb-2">
                                    <label for="option_4" class="form-label">Option 4</label>
                                    <textarea class="form-control form-control-sm" name="option_4" id="option_4" rows="1"></textarea>
                                    <div class="invalid-feedback" id="feedback_error_option_4"></div>
                                </div>
                                <div class="col-lg-12 col-12 mb-2">
                                    <label for="jawaban" class="form-label">Jawaban Benar</label>
                                    <select class="form-select select2" name="jawaban[]" id="jawaban" style="width: 100%" >
                                        <option value=1>Option 1</option>
                                        <option value=2>Option 2</option>
                                        <option value=3>Option 3</option>
                                        <option value=4>Option 4</option>
                                    </select>
                                    <div class="invalid-feedback" id="feedback_error_jawaban"></div>
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

<form id="formSubmit" enctype="multipart/form-data" method="post">
    <div class="modal modal-blur fade modal-xl" data-bs-backdrop="static" data-bs-keyboard="false" id="formModal" tabindex="-1"
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
                                    <label for="nama_ujian" class="form-label">Nama Ujian</label>
                                    <input type="text" class="form-control form-control-sm" name="nama_ujian" id="nama_ujian" rows="1"></input>
                                    <div class="invalid-feedback" id="feedback_error_nama_ujian"></div>
                                </div>
                                <div class="col-lg-12 col-12 mb-2">
                                    <label for="topic" class="form-label">Topic</label>
                                    <select class="form-select" name="topic" id="topic" style="width: 100%">
                                        
                                    </select>
                                    <div class="invalid-feedback" id="feedback_error_topic"></div>
                                </div>
                                <div class="col-lg-6 col-12 mb-2">
                                    <div class="form-floating">
                                        <input type="datetime-local" class="form-control form-control-sm" id="mulai" name="mulai" placeholder="waktu mulai" />
                                        <label for="mulai">Mulai</label>
                                    </div>
                                </div>
                                <div class="col-lg-6 col-12 mb-2">
                                    <div class="form-floating">
                                        <input type="datetime-local" class="form-control form-control-sm" id="selesai" name="selesai" placeholder="waktu selesai" />
                                        <label for="selesai">Selesai</label>
                                    </div>
                                </div>
                                <div class="col-lg-12 col-12 mb-2">
                                    <label for="jumlah" class="form-label">Jumlah Soal</label>
                                    <input type="number" class="form-control form-control-sm" name="jumlah" id="jumlah" rows="1"></input>
                                    <div class="invalid-feedback" id="feedback_error_jumlah"></div>
                                </div>
                                <div class="col-lg-12 col-12 mb-2" id="input-soal-container">

                                </div>
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

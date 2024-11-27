<style>
    /* Menambahkan border hitam ke tabel dan sel tabel */
    .table-bordered, .table-bordered td, .table-bordered th {
      border: 1px solid black !important;
    }
</style>
<div class="modal modal-blur fade" data-bs-backdrop="static" data-bs-keyboard="false" id="rincianModal" tabindex="-1"
     role="dialog" aria-labelledby="rincianModal" aria-hidden="true">
    <div class="modal-dialog modal-dialog-scrollable modal-dialog-centered modal-xl" role="document">
        <div class="modal-content" style="min-height:300px">
            <div class="modal-header myDarkcss" data-bs-theme="dark">
                <h5 class="modal-title text-white text-center" id="staticBackdropLabel">Input Soal</h5>
                <button type="button" class="btn-close bg-white btn-close bg-white-white" data-bs-dismiss="modal"
                        aria-label="Close"></button>
            </div>
            <div class="modal-body">

                <div class="row g-2">
                    <div class="col-12">
                        <div class="table-responsive" id="tabelPertanyaan">
                            
                        </div>
                    </div>


                </div>
            </div>

        </div>
    </div>
</div>

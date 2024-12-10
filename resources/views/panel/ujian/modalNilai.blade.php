<style>
    /* Menambahkan border hitam ke tabel dan sel tabel */
    .table-bordered, .table-bordered td, .table-bordered th {
      border: 1px solid black !important;
    }
</style>
<div class="modal modal-blur fade" data-bs-backdrop="static" data-bs-keyboard="false" id="nilaiModal" tabindex="-1"
     role="dialog" aria-labelledby="nilaiModal" aria-hidden="true">
    <div class="modal-dialog modal-dialog-scrollable modal-dialog-centered" role="document">
        <div class="modal-content" style="min-height:300px">
            <div class="modal-header myDarkcss" data-bs-theme="dark">
                <h5 class="modal-title text-white text-center" id="staticBackdropLabel">Nilai</h5>
                <button type="button" class="btn-close bg-white btn-close bg-white-white" data-bs-dismiss="modal"
                        aria-label="Close"></button>
            </div>
            <div class="modal-body">

                <div class="row g-2">
                    <div class="col-12">
                        <div class="table-responsive">
                            <table class="table table-bordered table-hover mt-4">    
                                <thead>
                                    <tr>
                                        <th style="text-align: center; width: 50%;">Nama</th>
                                        <th style="text-align: center; width: 50%;">Nilai</th>
                                    </tr>
                                </thead>
                                <tbody id="tabelNilai">
                                </tbody>
                            </table>
                        </div>
                    </div>


                </div>
            </div>

        </div>
    </div>
</div>

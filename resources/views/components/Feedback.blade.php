@section('css')
    <!-- jquery-bar-rating css -->
    <link href="{{ URL::asset('/assets/libs/jquery-bar-rating/jquery-bar-rating.min.css') }}" rel="stylesheet"
        type="text/css" />
@endsection
<form id="formSubmit" enctype="multipart/form-data" method="post">
    <div class="modal modal-blur fade" data-bs-backdrop="static" data-bs-keyboard="false" id="formModal" tabindex="-1"
        role="dialog" aria-labelledby="formModal" aria-hidden="true">
        <!-- <div class="modal-dialog modal-dialog-scrollable modal-dialog-centered modal-fullscreen" role="document"> -->
        <div class="modal-dialog modal-dialog-scrollable modal-dialog-centered" role="document">




            <div class="modal-content" style="min-height:300px">
                <div class="modal-header bg-dark" data-bs-theme="dark">
                    <h5 class="modal-title text-white text-center" id="staticBackdropLabel"><i
                            class="fas fa-edit fa-fw me-2"></i><span id="titleFormModal">Comment & Rating</span></h5>
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
                                    <div>
                                        <label for="feedback_text" class="form-label">Ratings</label>
                                        <select id="rating" name="rating">
                                            <option value="1">1</option>
                                            <option value="2">2</option>
                                            <option value="3">3</option>
                                            <option value="4">4</option>
                                            <option value="5">5</option>
                                        </select>
                                    </div>
                                </div>

                                <div class="col-lg-12 col-12 mb-2">
                                    <label for="feedback_text" class="form-label">Comments</label>
                                    <textarea class="form-control form-control-sm" name="feedback_text" id="feedback_text" rows="3"></textarea>
                                    <div class="invalid-feedback" id="feedback_error_feedback_text"></div>
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
@section('script')
    <!-- Sweet Alerts js -->
    <script src="{{ URL::asset('/assets/libs/jquery-bar-rating/jquery-bar-rating.min.js') }}"></script>

    <!-- Range slider init js-->
    <script src="{{ URL::asset('/assets/js/pages/rating.js') }}"></script>
@endsection

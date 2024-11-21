<div class="modal modal-blur fade" data-bs-backdrop="static" data-bs-keyboard="false" id="formModalBulk" tabindex="-1"
    role="dialog" aria-labelledby="formModalBulk" aria-hidden="true">
    <div class="modal-dialog modal-dialog-scrollable modal-dialog-centered" role="document">
        <div class="modal-content" style="min-height:300px">
            <div class="modal-header bg-body-secondary" data-bs-theme="dark">
                <h5 class="modal-title text-white text-center" id="titleFormModal">Ubah Data Sekaligus Banyak
                    (Bulk)</h5>
                <button type="button" class="btn-close bg-white btn-close bg-white-white" data-bs-dismiss="modal"
                    aria-label="Close"></button>
            </div>
            <form class="g-3 mt-1" id="formSubmitBulk" enctype="multipart/form-data">

                <div class="modal-body">

                    <div class="row g-2">

                        <div class="col-12">
                            <div id="alertFormModalBulk" class="mb-2" style="display: none">

                            </div>
                        </div>

                        <div class="col-12 col-lg-12">
                            <div class="form-check form-switch">
                                <input class="form-check-input" type="checkbox" role="switch" id="switch_bulk_roles">
                                <label class="form-check-label" for="switch_bulk_roles">Ubah Roles</label>
                            </div>
                        </div>

                        <div class="col-12 col-lg-12" style="display:none" id="div_bulk_role">

                            <div class="form-floating">
                                <select style="width:100%" class="form-select form-select-sm"
                                    id="bulk_roles" name="bulk_roles">
                                </select>
                                <div class="invalid-feedback" id="feedback_error_bulk_roles"></div>
                                <label for="role">Pilih Role</label>
                            </div>


                        </div>

                        <div class="col-12 col-lg-12">
                            <div class="form-check form-switch">
                                <input class="form-check-input" type="checkbox" role="switch"
                                    id="switch_bulk_password">
                                <label class="form-check-label" for="switch_bulk_password">Ubah Kata Sandi</label>
                            </div>
                        </div>

                        <div id="div_bulk_password" style="display: none">
                            <div class="row">
                                <div class="col-12 col-lg-12">
                                    <div class="input-group input-group-sm">
                                        <div class="form-floating">
                                            <input type="password" name="password_bulk" class="form-control"
                                                id="password_bulk" placeholder="Password" autocomplete="off">
                                            <label for="password">Kata Sandi</label>


                                        </div>

                                        <span class="input-group-text">
                                            <a href="javascript:togglePasswordVisibility('password','password-toogle_bulk')"
                                                class="link-secondary password-toogle_bulk" title="Show password"
                                                data-bs-toggle="tooltip">
                                                <i class="fas fa-fw fa-eye"></i>
                                            </a>
                                        </span>


                                    </div>
                                    <div class="xinvalid-feedback" id="feedback_error_password_bulk">
                                    </div>

                                </div>
                            </div>
                        </div>

                        @can($permissionValidation)
                            <div class="col-12 col-lg-12">
                                <div class="form-check form-switch">
                                    <input class="form-check-input" type="checkbox" role="switch"
                                        id="switch_bulk_is_active">
                                    <label class="form-check-label" for="switch_bulk_is_active">Ubah Status Akun</label>
                                </div>
                            </div>


                            <div class="col-12 col-lg-12" style="display:none" id="div_bulk_is_active">

                                <div class="form-floating">
                                    <select class="form-select form-select-sm" name="is_active_bulk"
                                        id="is_active_bulk">
                                        <option value=''>-PILIH-</option>
                                        <option value=1>Akun Aktif</option>
                                        <option value=0>Akun Non Aktif</option>
                                    </select>
                                    <div class="invalid-feedback" id="feedback_error_is_active_bulk"></div>
                                    <label for="is_active">Status</label>
                                </div>


                            </div>
                        @endcan

                        <div class="col-12 col-lg-12">
                            <div class="form-check form-switch">
                                <input class="form-check-input" type="checkbox" role="switch" id="switch_bulk_avatar"
                                    name="switch_bulk_avatar">
                                <label class="form-check-label" for="switch_bulk_avatar">Ubah Foto Profil</label>
                            </div>
                        </div>

                        <div class="col-12 col-lg-12" style="display:none" id="div_bulk_avatar">
                            <div class="input-group custom-file-button">
                                <label class="input-group-text" for="avatar_bulk">Foto Profil</label>
                                <input type="file" class="form-control form-control-sm"
                                    id="avatar_bulk" name="avatar_bulk" accept="image/*">
                                <div class="invalid-feedback" id="feedback_error_avatar_bulk"></div>
                            </div>

                        </div>


                    </div>
                </div>
                <div class="modal-footer">
                    <div class="d-grid gap-2 col-6 mx-auto">
                        <button type="submit" id="submitButtonBulk" class="btn btn-sm btn-primary"><i
                                class="fa fa-save"></i> <span id="submitTextBulk">Simpan</span>
                        </button>
                    </div>
                </div>
            </form>
        </div>
    </div>
</div>

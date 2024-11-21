<form class="g-3 mt-1" id="formSubmit" enctype="multipart/form-data">
    <div class="modal modal-blur fade" data-bs-backdrop="static" data-bs-keyboard="false" id="formModal" tabindex="-1"
        role="dialog" aria-labelledby="formModal" aria-hidden="true">
        <div class="modal-dialog modal-dialog-scrollable modal-dialog-centered" role="document">
            <div class="modal-content" style="min-height:300px">
                <div class="modal-header bg-body-secondary" data-bs-theme="dark">
                    <h5 class="modal-title text-white text-center" id="titleFormModal">Tambah</h5>
                    <button type="button" class="btn-close bg-white btn-close bg-white-white" data-bs-dismiss="modal"
                        aria-label="Close"></button>
                </div>


                <div class="modal-body">

                    <div class="row g-2">

                        <div class="col-12">
                            <div id="alertFormModal" class="mb-2" style="display: none">

                            </div>
                        </div>

                        <div class="col-12 d-none">
                            <label for="id"></label><input type="text" class="d-none" id="id"
                                name="id">
                        </div>

                        <div class="col-12 col-lg-12">

                            <div class="form-group">
                                <label for="roles">Pilih Role</label>
                                <select style="width:100%" class="form-select form-select-sm" id="roles"
                                    name="roles">
                                </select>
                                <div class="invalid-feedback" id="feedback_error_roles"></div>

                            </div>


                        </div>

                        <div class="col-12 col-lg-12">
                            <div class="form-floating">

                                <input type="text" class="form-control form-control-sm" id="name"
                                    placeholder="Nama Lengkap" name="name">
                                <div class="invalid-feedback" id="feedback_error_name"></div>
                                <label for="name">Nama Lengkap</label>

                            </div>

                        </div>

                        <div class="col-12 col-lg-6">
                            <div class="form-floating">
                                <input type="text" class="form-control form-control-sm" id="username"
                                    placeholder="Username" name="username">
                                <div class="invalid-feedback" id="feedback_error_username"></div>
                                <label for="username">Nama Pengguna</label>
                            </div>

                        </div>


                        <div class="col-12 col-lg-6">
                            <div class="form-floating">
                                <input type="email" class="form-control form-control-sm" id="email"
                                    placeholder="Email" name="email">
                                <div class="invalid-feedback" id="feedback_error_email"></div>
                                <label for="email">Email</label>
                            </div>

                        </div>

                        <div class="col-12 col-lg-6">
                            <div class="input-group input-group-sm">
                                <div class="form-floating">
                                    <input type="password" name="password" class="form-control"
                                        id="password" placeholder="Password" value="{{ old("password") }}"
                                        autocomplete="off">
                                    <label for="password">Kata Sandi</label>


                                </div>

                                <span class="input-group-text">
                                    <a href="javascript:togglePasswordVisibility('password','password-toogle')"
                                        class="link-secondary password-toogle" title="Show password"
                                        data-bs-toggle="tooltip">
                                        <i class="fas fa-fw fa-eye"></i>
                                    </a>
                                </span>


                            </div>
                            <div class="xinvalid-feedback" id="feedback_error_password">
                            </div>

                        </div>

                        <div class="col-12 col-lg-6">
                            <div class="input-group input-group-sm">
                                <div class="form-floating">
                                    <input type="password" name="password_confirmation" class="form-control"
                                        id="password_confirmation" placeholder="Password Confirmation"
                                        autocomplete="off">

                                    <label for="confirmation">Konfirmasi Kata Sandi</label>


                                </div>

                                <span class="input-group-text">
                                    <a href="javascript:togglePasswordVisibility('password_confirmation','password-toogle2')"
                                        class="link-secondary password-toogle2" title="Show password"
                                        data-bs-toggle="tooltip">
                                        <i class="fas fa-fw fa-eye"></i>
                                    </a>
                                </span>

                            </div>
                            <div class="xinvalid-feedback" id="feedback_error_password_confirmation">
                            </div>
                        </div>


                        @can($permissionValidation)
                        <div class="col-12 col-lg-12">

                            <div class="form-floating">
                                <select class="form-select form-select-sm" name="is_active"
                                    id="is_active">
                                    <option value=1>Akun Aktif</option>
                                    <option value=0>Akun Non Aktif</option>
                                </select>
                                <div class="invalid-feedback" id="feedback_error_is_active"></div>
                                <label for="is_active">Status</label>
                            </div>


                        </div>
                        @else
                        <input type="text" style="display: none" id="is_active" name="is_active" value=0>
                        @endcan

                        <div class="col-12 col-lg-12">
                            <div class="input-group input-group-sm custom-file-button">
                                <label class="input-group-text" for="avatar">Foto Profil</label>
                                <input type="file" class="form-control form-control-sm" id="avatar"
                                    name="avatar">
                                <div class="invalid-feedback" id="feedback_error_avatar"></div>
                            </div>

                        </div>


                    </div>
                </div>
                <div class="modal-footer">
                    <div class="d-grid gap-2 col-6 mx-auto">
                        <button type="submit" id="submitButton" class="btn btn-sm btn-primary"><i
                                class="fa fa-save"></i> <span id="submitText">Simpan</span>
                        </button>
                        {{-- <button type="button" id="createAnotherButton" class="btn btn-sm btn-success"><i --}}
                        {{-- class="fa fa-plus"></i> <span id="createAnotherText">Simpan & Tambah Lagi</span> --}}
                        {{-- </button> --}}
                    </div>
                </div>

            </div>
        </div>
    </div>
</form>
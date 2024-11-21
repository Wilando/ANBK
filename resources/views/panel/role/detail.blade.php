@extends("layouts.master-layouts")
@section("title", ucwords($titlePage) . " Role")
@push("meta")
    @include("layouts.default_og")
@endpush
@section("content")
    <div class="app-content-header d-print-none">
        <div class="container-fluid">
            <div class="row align-items-center">
                <div class="col">
                    <span class="mb-0">
                        {!! $iconPage !!} {{ ucwords($titlePage) }} Role
                    </span>
                </div>

                <div class="col-auto ms-auto d-print-none">
                    <ol class="breadcrumb float-sm-end">
                        <li class="breadcrumb-item"><a href="{{$back}}">Role</a></li>
                        <li class="breadcrumb-item active" aria-current="page">
                            {{ ucwords($titlePage) }} Role
                        </li>
                    </ol>
                </div>

            </div>
        </div>
    </div>

    <div class="app-content">
        <div class="container-fluid">
            <div class="row g-1">

                <div class="col-12 col-md-12 mb-4">

                    <div class="card">
                        <div class="card-body">

                            <div class="row">

                                <div class="col-12 mt-4">
                                    <span class="d-flex justify-content-center align-content-center">
                                        Role : {{ $name }}</span>

                                    <div class="table-responsive" style="min-height: 300px; height: auto">
                                        <table class="table table-flush-spacing">
                                            <tbody>

                                            <?php
                                            $lastFrom = null;
                                            ?>
                                            @foreach ($rolePermissions as $permission => $value)
                                                    <?php
                                                    $gabung = false;
                                                    $permissionname = $permission;
                                                    if (in_array(getLastWord($permission), ["create", "read", "update", "delete", "validation", "privilege"])) {
                                                        $permissionname = removeLastWord($permission);
                                                        $gabung = true;
                                                    }
                                                    if ($permissionname !== $lastFrom) {
                                                        $kasihnama = $permissionname;
                                                    } else {
                                                        $kasihnama = "";
                                                    }

                                                    $lastFrom = $permissionname;
                                                    ?>

                                                <tr>
                                                    <td class="text-nowrap fw-semibold">{{ $kasihnama }}</td>
                                                    <td>
                                                        <div class="d-flex">
                                                            @if (in_array(getLastWord($permission), ["create", "read", "update", "delete", "validation", "privilege"]))
                                                                @if (getLastWord($permission) == "create")
                                                                    <div
                                                                            class="form-check form-switch me-3 me-lg-5">
                                                                        <input class="form-check-input data-check"
                                                                               type="checkbox" disabled
                                                                               id="{{ $value }}"
                                                                               value="{{ $value }}"
                                                                               {{ in_array($value, $rolePermissions) ? "checked" : "" }}
                                                                               name="permission[]">
                                                                        <label class="custom-control-label"
                                                                               for="{{ $value }}">
                                                                            CREATE
                                                                        </label>
                                                                    </div>
                                                                @endif
                                                                @if (getLastWord($permission) == "read")
                                                                    <div
                                                                            class="form-check form-switch me-3 me-lg-5">
                                                                        <input class="form-check-input data-check"
                                                                               type="checkbox" disabled
                                                                               id="{{ $value }}"
                                                                               value="{{ $value }}"
                                                                               {{ in_array($value, $rolePermissions) ? "checked" : "" }}
                                                                               name="permission[]">
                                                                        <label class="custom-control-label"
                                                                               for="{{ $value }}">
                                                                            READ
                                                                        </label>
                                                                    </div>
                                                                @endif
                                                                @if (getLastWord($permission) == "update")
                                                                    <div
                                                                            class="form-check form-switch me-3 me-lg-5">
                                                                        <input class="form-check-input data-check"
                                                                               type="checkbox" disabled
                                                                               id="{{ $value }}"
                                                                               value="{{ $value }}"
                                                                               {{ in_array($value, $rolePermissions) ? "checked" : "" }}
                                                                               name="permission[]">
                                                                        <label class="custom-control-label"
                                                                               for="{{ $value }}">
                                                                            UPDATE
                                                                        </label>
                                                                    </div>
                                                                @endif
                                                                @if (getLastWord($permission) == "delete")
                                                                    <div
                                                                            class="form-check form-switch me-3 me-lg-5">
                                                                        <input class="form-check-input data-check"
                                                                               type="checkbox" disabled
                                                                               id="{{ $value }}"
                                                                               value="{{ $value }}"
                                                                               {{ in_array($value, $rolePermissions) ? "checked" : "" }}
                                                                               name="permission[]">
                                                                        <label class="custom-control-label"
                                                                               for="{{ $value }}">
                                                                            DELETE
                                                                        </label>
                                                                    </div>
                                                                @endif
                                                                @if (getLastWord($permission) == "validation")
                                                                    <div
                                                                            class="form-check form-switch me-3 me-lg-5">
                                                                        <input class="form-check-input data-check"
                                                                               type="checkbox" disabled
                                                                               id="{{ $value }}"
                                                                               value="{{ $value }}"
                                                                               {{ in_array($value, $rolePermissions) ? "checked" : "" }}
                                                                               name="permission[]">
                                                                        <label class="custom-control-label"
                                                                               for="{{ $value }}">
                                                                            VALIDATION
                                                                        </label>
                                                                    </div>
                                                                @endif
                                                                @if (getLastWord($permission) == "privilege")
                                                                    <div
                                                                            class="form-check form-switch me-3 me-lg-5">
                                                                        <input class="form-check-input data-check"
                                                                               type="checkbox" disabled
                                                                               id="{{ $value }}"
                                                                               value="{{ $value }}"
                                                                               {{ in_array($value, $rolePermissions) ? "checked" : "" }}
                                                                               name="permission[]">
                                                                        <label class="custom-control-label"
                                                                               for="{{ $value }}">
                                                                            PRIVILEGE
                                                                        </label>
                                                                    </div>
                                                                @endif
                                                            @else
                                                                <div class="form-check form-switch me-3 me-lg-5">
                                                                    <input class="form-check-input data-check"
                                                                           type="checkbox" disabled
                                                                           id="{{ $value }}"
                                                                           value="{{ $value }}"
                                                                           {{ in_array($value, $rolePermissions) ? "checked" : "" }}
                                                                           name="permission[]">
                                                                    <label class="custom-control-label"
                                                                           for="{{ $value }}">
                                                                    </label>
                                                                </div>
                                                            @endif

                                                        </div>
                                                    </td>
                                                    @endforeach
                                                </tr>
                                            </tbody>
                                        </table>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>


                </div>

            </div>
        </div>
    </div>
@endsection
@push("scripts")
@endpush

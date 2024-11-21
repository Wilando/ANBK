@extends("layouts.master-layouts")
@section("title", ucwords($titlePage) . " Role")
@push("meta")
@include("layouts.default_og")
@endpush
@section("content")

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




<div class="row g-1">
    <div class="col-12">
        @if (session("success"))
        <div class="alert alert-success alert-dismissible fade show" role="alert">
            {{ session("message") }}
            <button type="button" class="btn-close bg-white" data-bs-dismiss="alert" aria-label="Close">
            </button>
        </div>
        @endif
        @error("message")
        <div class="alert alert-danger alert-dismissible fade show" role="alert">
            {{ $message }}
            <button type="button" class="btn-close bg-white" data-bs-dismiss="alert" aria-label="Close">
            </button>
        </div>
        @enderror
    </div>
    <div class="col-12 col-md-12 mb-4">
        <form class="row g-3" id="formSubmit" action="{{ $action }}" enctype="multipart/form-data"
            method="post">
            @csrf
            @if ($mode == "edit")
            <input type="text" class="d-none" id="_method" name="_method" value="PUT">
            @endif
            <div class="card">
                <div class="card-body">

                    <div class="row">
                        <div class="col-lg-8 offset-md-2 mb-2">
                            <span class="d-flex justify-content-center align-content-center">
                                Role</span>
                            <input class="form-control @error(" name") is-invalid @enderror"
                                name="name" id="name" type="text" value="{{ $name }}"
                                autofocus />
                            @error("name")
                            <div class="invalid-feedback">
                                {{ $message }}
                            </div>
                            @enderror
                        </div>

                        <div class="col-12 mt-4">
                            <span class="d-flex justify-content-center align-content-center">
                                Select
                                Permissions</span>

                            <div class="table-responsive" style="min-height: 300px; height: auto">
                                <table class="table table-flush-spacing">
                                    <tbody>
                                        <tr>
                                            <td class="text-nowrap fw-semibold">Superadmin Access
                                                <i class="fa fa-info-circle bx-xs" data-bs-toggle="tooltip"
                                                    data-bs-placement="top" title=""
                                                    data-bs-original-title="Allows a full access to the system"
                                                    aria-label="Allows a full access to the system"></i>
                                            </td>
                                            <td>
                                                <div class="form-check form-switch">
                                                    <input class="form-check-input" type="checkbox"
                                                        id="check-all">
                                                    <label class="custom-control-label" for="check-all">
                                                        Select All
                                                    </label>
                                                </div>
                                            </td>
                                        </tr>
                                        <?php
                                        $lastFrom = null;
                                        ?>
                                        @foreach ($Permission as $value)
                                        <?php
                                        $gabung = false;
                                        $permissionname = $value->name;
                                        if (in_array(getLastWord($value->name), ["create", "read", "update", "delete", "validation", "privilege"])) {
                                            $permissionname = removeLastWord($value->name);
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
                                            <td class="text-nowrap fw-semibold">{{ $kasihnama }}
                                            </td>
                                            <td>
                                                <div class="d-flex">
                                                    @if (in_array(getLastWord($value->name), ["create", "read", "update", "delete", "validation", "privilege"]))
                                                    @if (getLastWord($value->name) == "create")
                                                    <div
                                                        class="form-check form-switch me-3 me-lg-5">
                                                        <input
                                                            class="form-check-input data-check"
                                                            type="checkbox"
                                                            id="{{ $value->id }}"
                                                            value="{{ $value->id }}"
                                                            {{ in_array($value->id, $rolePermissions) ? "checked" : "" }}
                                                            name="permission[]">
                                                        <label class="custom-control-label"
                                                            for="{{ $value->id }}">
                                                            CREATE
                                                        </label>
                                                    </div>
                                                    @endif
                                                    @if (getLastWord($value->name) == "read")
                                                    <div
                                                        class="form-check form-switch me-3 me-lg-5">
                                                        <input
                                                            class="form-check-input data-check"
                                                            type="checkbox"
                                                            id="{{ $value->id }}"
                                                            value="{{ $value->id }}"
                                                            {{ in_array($value->id, $rolePermissions) ? "checked" : "" }}
                                                            name="permission[]">
                                                        <label class="custom-control-label"
                                                            for="{{ $value->id }}">
                                                            READ
                                                        </label>
                                                    </div>
                                                    @endif
                                                    @if (getLastWord($value->name) == "update")
                                                    <div
                                                        class="form-check form-switch me-3 me-lg-5">
                                                        <input
                                                            class="form-check-input data-check"
                                                            type="checkbox"
                                                            id="{{ $value->id }}"
                                                            value="{{ $value->id }}"
                                                            {{ in_array($value->id, $rolePermissions) ? "checked" : "" }}
                                                            name="permission[]">
                                                        <label class="custom-control-label"
                                                            for="{{ $value->id }}">
                                                            UPDATE
                                                        </label>
                                                    </div>
                                                    @endif
                                                    @if (getLastWord($value->name) == "delete")
                                                    <div
                                                        class="form-check form-switch me-3 me-lg-5">
                                                        <input
                                                            class="form-check-input data-check"
                                                            type="checkbox"
                                                            id="{{ $value->id }}"
                                                            value="{{ $value->id }}"
                                                            {{ in_array($value->id, $rolePermissions) ? "checked" : "" }}
                                                            name="permission[]">
                                                        <label class="custom-control-label"
                                                            for="{{ $value->id }}">
                                                            DELETE
                                                        </label>
                                                    </div>
                                                    @endif
                                                    @if (getLastWord($value->name) == "validation")
                                                    <div
                                                        class="form-check form-switch me-3 me-lg-5">
                                                        <input
                                                            class="form-check-input data-check"
                                                            type="checkbox"
                                                            id="{{ $value->id }}"
                                                            value="{{ $value->id }}"
                                                            {{ in_array($value->id, $rolePermissions) ? "checked" : "" }}
                                                            name="permission[]">
                                                        <label class="custom-control-label"
                                                            for="{{ $value->id }}">
                                                            VALIDATION
                                                        </label>
                                                    </div>
                                                    @endif
                                                    @if (getLastWord($value->name) == "privilege")
                                                    <div
                                                        class="form-check form-switch me-3 me-lg-5">
                                                        <input
                                                            class="form-check-input data-check"
                                                            type="checkbox"
                                                            id="{{ $value->id }}"
                                                            value="{{ $value->id }}"
                                                            {{ in_array($value->id, $rolePermissions) ? "checked" : "" }}
                                                            name="permission[]">
                                                        <label class="custom-control-label"
                                                            for="{{ $value->id }}">
                                                            PRIVILEGE
                                                        </label>
                                                    </div>
                                                    @endif
                                                    @else
                                                    <div
                                                        class="form-check form-switch me-3 me-lg-5">
                                                        <input class="form-check-input data-check"
                                                            type="checkbox"
                                                            id="{{ $value->id }}"
                                                            value="{{ $value->id }}"
                                                            {{ in_array($value->id, $rolePermissions) ? "checked" : "" }}
                                                            name="permission[]">
                                                        <label class="custom-control-label"
                                                            for="{{ $value->id }}">
                                                        </label>
                                                    </div>
                                                    @endif

                                                </div>
                                            </td>
                                            @endforeach
                                        </tr>

                                        @error("permission")
                                        <div class="invalid-feedback">
                                            {{ $message }}
                                        </div>
                                        @enderror
                                    </tbody>
                                </table>
                            </div>
                        </div>
                    </div>
                </div>


                <div class="card-footer d-flex justify-content-end">
                    @component("components.submitButton")
                    @slot("id")
                    {{ "submitButton" }}
                    @endslot
                    @if ($mode == "edit")
                    @slot("label")
                    UPDATE DATA
                    @endslot
                    @endif
                    @endcomponent
                </div>
            </div>

        </form>
    </div>

</div>

@endsection
@push("scripts")
<script src="{{ asset('myjs/hideyorivannilaJs/helper.js')}}?v={{ filemtime(public_path('myjs/hideyorivannilaJs/helper.js')) }}" defer></script>
<script src="{{ asset('myjs/hideyoriJquery/helper.js')}}?v={{ filemtime(public_path('myjs/hideyoriJquery/helper.js')) }}" defer></script>
<script type="text/javascript">
    var checkAll = document.getElementById("check-all");
    var checkboxes = document.getElementsByClassName("data-check");

    checkAll.addEventListener("change", function() {
        var isChecked = checkAll.checked;
        for (var i = 0; i < checkboxes.length; i++) {
            checkboxes[i].checked = isChecked;
        }
    });
    document.getElementById('formSubmit').addEventListener('submit', function(event) {
        event.preventDefault();
        processSubmit();
        setTimeout(function() {
            event.target.submit();
        }, 500);
    });
</script>
@endpush
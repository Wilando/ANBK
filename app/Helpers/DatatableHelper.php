<?php
use Carbon\Carbon;
use Illuminate\Database\QueryException;
use Illuminate\Support\Facades\Auth;
use Illuminate\Support\Facades\DB;
use Illuminate\Support\Facades\Storage;
use Illuminate\Support\Facades\Validator;
use Illuminate\Validation\ValidationException;
use Symfony\Component\HttpFoundation\Response;

if (!function_exists('checkboxRowDT')) {
    function checkboxRowDT($id, $teks = null)
    {
        $aksiCheckbox = '';
        if ($id) {

            $aksiCheckbox = '<div class="form-check d-flex justify-content-center"><input class="form-check-input data-check" type="checkbox" id="customCheckbox_' . $id . '" value="' . encodeId($id) . '"><label for="customCheckbox_' . $id . '" class="custom-control-label">' . $teks . '</label></div>';
        }
        return $aksiCheckbox;


    }
}

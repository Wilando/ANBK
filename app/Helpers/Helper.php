<?php

use Carbon\Carbon;
use Illuminate\Database\QueryException;
use Illuminate\Support\Facades\Auth;
use Illuminate\Support\Facades\DB;
use Illuminate\Support\Facades\Storage;
use Illuminate\Support\Facades\Validator;
use Illuminate\Validation\ValidationException;
use Symfony\Component\HttpFoundation\Response;
use Vinkla\Hashids\Facades\Hashids;

if (!function_exists('getSetting')) {
    function getSetting($key, $default = '')
    {
        $result = \App\Models\Setting::where('setting_var', $key)->first();
        if ($result) {
            if ($result->setting_type == 'file') {
                if (empty($result->setting_val)) {
                    $path = 'statis/settings/'.$default;
                    $fileimage = asset($path);
                    $filePath = public_path($path);
                    if (\Illuminate\Support\Facades\File::exists($filePath)) {
                        return $fileimage;
                    }
                } else {
                    $path = $result->setting_val;
                    $fileimage = Storage::disk('public')->path($path);
                    if (file_exists($fileimage)) {
                        return url('berkas/'.$result->setting_val);
                    }
                }

                return null;
            }

            return $result->setting_val;
        } else {
            return $default;
        }
    }
}

if (!function_exists('hasSpecificRoles')) {
    // Function to check if user has specific roles
    function hasSpecificRoles($userRoles, $rolesToCheck)
    {
        foreach ($userRoles as $role) {
            if (in_array($role, $rolesToCheck)) {
                return true;
            }
        }

        return false;
    }
}

if (!function_exists('date_time_indo')) {
    function date_time_indo($date)
    {
        $tahun = substr($date, 0, 4);
        $bulan = substr($date, 5, 2);
        $tgl = substr($date, 8, 2);
        $waktu = substr($date, 11, 8);
        $result = $tgl.'/'.$bulan.'/'.$tahun.' '.$waktu;

        return $result;
    }
}

if (!function_exists('getLastWord')) {
    function getLastWord($string)
    {
        $string = explode(' ', $string);

        return array_pop($string);
    }
}
if (!function_exists('removeLastWord')) {
    function removeLastWord($string)
    {
        $words = explode(' ', $string);
        array_splice($words, -1);

        return implode(' ', $words);
    }
}

if (!function_exists('xhasRole')) {
    function xhasRole($role)
    {
        if (Auth::check()) {
            return Auth::user()->hasRole($role);
        }

        return false;
    }
}

if (!function_exists('xhasPermission')) {
    function xhasPermission($permission)
    {
        if (Auth::check()) {
            return Auth::user()->can($permission);
        }

        return false;
    }
}

if (!function_exists('xhasPermissionAny')) {
    function xhasPermissionAny($permission)
    {
        if (Auth::check()) {
            return Auth::user()->canany($permission);
        }

        return false;
    }
}

if (!function_exists('encodeId')) {
    function encodeId($id)
    {
        try {
            return Hashids::encode($id);
        } catch (ErrorException $e) {
            abort(404);
        }
    }
}

if (!function_exists('decodeId')) {
    function decodeId($id)
    {
        try {
            //            return Hashids::decode($id)[0] ?? $id;
            return $id;
        } catch (ErrorException $e) {
            abort(404);
        }
    }
}

if (!function_exists('xValidator')) {
    function xValidator($request, $rule, $custom = [], $attribute = [])
    {
        $validator = Validator::make($request->all(), $rule, $custom, $attribute);
        if ($validator->fails()) {
            $errorString = implode(',', $validator->messages()->all());
            $res['message'] = $errorString;
            $res['success'] = false;

            if ($request->wantsJson()) {
                $res['errors'] = $validator->errors()->toArray();

                return response()->json($res, Response::HTTP_UNPROCESSABLE_ENTITY);
            } else {
                return redirect()->back()->withInput()->withErrors($validator)->with($res);
            }
        }
        $res['success'] = true;

        return $res;
    }
}

if (!function_exists('resValidator')) {
    function resValidator($validator)
    {
        $request = Illuminate\Support\Facades\Request::instance();
        // Hapus duplikasi pesan error
        $errorMessages = array_unique($validator->messages()->all());
        $errorString = implode(',', $errorMessages);
        $res['message'] = $errorString;
        $res['success'] = false;

        if ($request->wantsJson()) {
            $res['errors'] = $validator->errors()->toArray();

            return response()->json($res, Response::HTTP_UNPROCESSABLE_ENTITY);
        } else {
            return redirect()->back()->withInput()->withErrors($validator)->with($res);
        }
    }
}

function callDynamicFunction(string $functionName, array $arguments = [])
{
    // Check if the function exists
    if (!function_exists($functionName)) {
        throw new \BadMethodCallException("Function '{$functionName}' not found.");
    }

    // Call the function dynamically and return the result
    return call_user_func_array($functionName, $arguments);
}

if (!function_exists('validationResponse')) {
    function validationResponse($res, $codeStatus = Response::HTTP_UNPROCESSABLE_ENTITY): Illuminate\Http\JsonResponse|Illuminate\Http\RedirectResponse
    {
        $request = Illuminate\Support\Facades\Request::instance();
        if ($request->wantsJson()) {
            return response()->json($res, $codeStatus);
        } else {
            return redirect()->back()->withInput()->with($res);
        }
    }
}

if (!function_exists('trxErrorLog')) {
    function trxErrorLog($message)
    {
        activity()
            ->useLog('error_log')
            ->event('error')
            ->log($message);
    }
}

if (!function_exists('trxInsert')) {
    function trxInsert($model, $reqData, $titleData, $logName = 'default', $redirect = 'app'): Illuminate\Foundation\Application|Illuminate\Http\JsonResponse|Illuminate\Routing\Redirector|Illuminate\Http\RedirectResponse|Illuminate\Contracts\Foundation\Application
    {
        $request = Illuminate\Support\Facades\Request::instance();
        DB::beginTransaction();
        try {
            $processData = $model::create($reqData);
            $newAttributes = $processData->getAttributes();
            $properties = [
                'new' => $newAttributes,
            ];
            activity()
                ->useLog($logName)
                ->causedBy(auth()->user())
                ->performedOn($processData)
                ->withProperties($properties)
                ->event('created')
                ->log('add '.$titleData);
            DB::commit();
            $res['message'] = $titleData.' added successfully';
            $res['success'] = true;
            if ($request->wantsJson()) {
                $res['data'] = $processData;

                return response()->json($res, Response::HTTP_CREATED);
            } else {
                return redirect($redirect)->with($res);
            }
        } catch (QueryException|\ErrorException $e) {
            DB::rollBack();
            $res['message'] = $e->getMessage();
            $res['success'] = false;
            if ($request->wantsJson()) {
                return response()->json($res, Response::HTTP_INTERNAL_SERVER_ERROR);
            } else {
                return redirect()->back()->withInput()->with($res);
            }
        } catch (ValidationException $e) {
            DB::rollback();
            $res['message'] = $e->errors();
            $res['success'] = false;
            if ($request->wantsJson()) {
                return response()->json($res, Response::HTTP_UNPROCESSABLE_ENTITY);
            } else {
                return redirect()->back()->withInput()->with($res);
            }
        } catch (\Exception $e) {
            DB::rollback();
            $res['message'] = $e;
            $res['success'] = false;
            if ($request->wantsJson()) {
                return response()->json($res, Response::HTTP_INTERNAL_SERVER_ERROR);
            } else {
                return redirect()->back()->withInput()->with($res);
            }
        }
    }
}

if (!function_exists('trxUpdate')) {
    function trxUpdate($master, $reqData, $titleData, $logName = 'default', $redirect = 'app'): Illuminate\Foundation\Application|Illuminate\Http\JsonResponse|Illuminate\Routing\Redirector|Illuminate\Http\RedirectResponse|Illuminate\Contracts\Foundation\Application
    {
        $request = Illuminate\Support\Facades\Request::instance();
        $oldAttributes = $master->getOriginal();
        DB::beginTransaction();
        try {
            $processData = $master->update($reqData);
            $changes = $master->getChanges();
            if (!empty($changes)) {
                $newAttributes = $master->getAttributes();
                $properties = [
                    'old' => $oldAttributes,
                    'new' => $newAttributes,
                ];
                activity()
                    ->useLog($logName)
                    ->causedBy(auth()->user())
                    ->performedOn($master)
                    ->withProperties($properties)
                    ->event('updated')
                    ->log('change '.$titleData);
            }
            DB::commit();
            $res['message'] = $titleData.' updated successfully';
            $res['success'] = true;
            if ($request->wantsJson()) {
                $res['data'] = $processData;

                return response()->json($res, Response::HTTP_OK);
            } else {
                return redirect($redirect)->with($res);
            }
        } catch (QueryException|\ErrorException $e) {
            DB::rollBack();
            $res['message'] = $e->getMessage();
            $res['success'] = false;
            if ($request->wantsJson()) {
                return response()->json($res, Response::HTTP_INTERNAL_SERVER_ERROR);
            } else {
                return redirect()->back()->withInput()->with($res);
            }
        } catch (ValidationException $e) {
            DB::rollback();
            $res['message'] = $e->errors();
            $res['success'] = false;
            if ($request->wantsJson()) {
                return response()->json($res, Response::HTTP_UNPROCESSABLE_ENTITY);
            } else {
                return redirect()->back()->withInput()->with($res);
            }
        } catch (\Exception $e) {
            DB::rollback();
            $res['message'] = $e;
            $res['success'] = false;
            if ($request->wantsJson()) {
                return response()->json($res, Response::HTTP_INTERNAL_SERVER_ERROR);
            } else {
                return redirect()->back()->withInput()->with($res);
            }
        }
    }
}

if (!function_exists('trxDelete')) {
    function trxDelete($master, $titleData, $logName = 'default', $redirect = 'app'): Illuminate\Foundation\Application|Illuminate\Http\JsonResponse|Illuminate\Routing\Redirector|Illuminate\Http\RedirectResponse|Illuminate\Contracts\Foundation\Application
    {
        $request = Illuminate\Support\Facades\Request::instance();
        $oldAttributes = $master->getOriginal();
        DB::beginTransaction();
        try {
            $deleted = $master->delete();
            if ($deleted) {
                $properties['old'] = $oldAttributes;
                if (!empty($changes)) {
                    $newAttributes = $master->getAttributes();
                    $properties['new'] = $newAttributes;
                }
                activity()
                    ->useLog($logName)
                    ->causedBy(auth()->user())
                    ->performedOn($master)
                    ->withProperties($properties)
                    ->event('deleted')
                    ->log('delete '.$titleData);
            }
            DB::commit();
            $res['message'] = $titleData.' deleted successfully';
            $res['success'] = true;
            if ($request->wantsJson()) {
                return response()->json($res, Response::HTTP_OK);
            } else {
                return redirect($redirect)->with($res);
            }
        } catch (QueryException|\ErrorException $e) {
            DB::rollBack();
            $res['message'] = $e->getMessage();
            $res['success'] = false;
            if ($request->wantsJson()) {
                return response()->json($res, Response::HTTP_INTERNAL_SERVER_ERROR);
            } else {
                return redirect()->back()->withInput()->with($res);
            }
        } catch (ValidationException $e) {
            DB::rollback();
            $res['message'] = $e->errors();
            $res['success'] = false;
            if ($request->wantsJson()) {
                return response()->json($res, Response::HTTP_UNPROCESSABLE_ENTITY);
            } else {
                return redirect()->back()->withInput()->with($res);
            }
        } catch (\Exception $e) {
            DB::rollback();
            $res['message'] = $e;
            $res['success'] = false;
            if ($request->wantsJson()) {
                return response()->json($res, Response::HTTP_INTERNAL_SERVER_ERROR);
            } else {
                return redirect()->back()->withInput()->with($res);
            }
        }
    }
}

if (!function_exists('trxbulkUpdate')) {
    function trxbulkUpdate($model, $titleData, $columnRef, $logName = 'default', $redirect = 'app'): Illuminate\Foundation\Application|Illuminate\Http\JsonResponse|Illuminate\Routing\Redirector|Illuminate\Http\RedirectResponse|Illuminate\Contracts\Foundation\Application
    {
        $request = Illuminate\Support\Facades\Request::instance();
        DB::beginTransaction();
        try {
            $ids = $request->input('ids');
            $column_update = $request->input('column_update');
            $jumlah = 0;
            $titleDataColumn = $titleData;
            foreach ($ids as $id) {
                $master = $model::findOrfail(decodeId($id));
                if ($master) {
                    $oldAttribute = $master->getOriginal();
                    $master->update($column_update);
                    $titleDataColumn = $titleData.' '.$master[$columnRef];
                    $changes = $master->getChanges();
                    if (!empty($changes)) {
                        $properties = [
                            'old' => $oldAttribute,
                            'new' => $master->getAttributes(),
                        ];
                        activity()
                            ->useLog($logName)
                            ->causedBy(auth()->user())
                            ->performedOn($master)
                            ->withProperties($properties)
                            ->event('updated')
                            ->log('change '.$titleDataColumn);
                    }
                    ++$jumlah;
                }
            }
            DB::commit();
            if ($jumlah == 1) {
                $titleData = $titleDataColumn;
            }
            $res['message'] = $titleData.' updated successfully';
            $res['success'] = true;
            if ($request->wantsJson()) {
                return response()->json($res, Response::HTTP_OK);
            } else {
                return redirect($redirect)->with($res);
            }
        } catch (QueryException|\ErrorException $e) {
            DB::rollBack();
            $res['message'] = $e->getMessage();
            $res['success'] = false;
            if ($request->wantsJson()) {
                return response()->json($res, Response::HTTP_INTERNAL_SERVER_ERROR);
            } else {
                return redirect()->back()->withInput()->with($res);
            }
        } catch (ValidationException $e) {
            DB::rollback();
            $res['message'] = $e->errors();
            $res['success'] = false;
            if ($request->wantsJson()) {
                return response()->json($res, Response::HTTP_UNPROCESSABLE_ENTITY);
            } else {
                return redirect()->back()->withInput()->with($res);
            }
        } catch (\Exception $e) {
            DB::rollback();
            $res['message'] = $e;
            $res['success'] = false;
            if ($request->wantsJson()) {
                return response()->json($res, Response::HTTP_INTERNAL_SERVER_ERROR);
            } else {
                return redirect()->back()->withInput()->with($res);
            }
        }
    }
}

if (!function_exists('trxbulkDelete')) {
    function trxbulkDelete($model, $primaryKey, $titleData, $columnRef, $columnValidation = 'is_active', $logName = 'default', $redirect = 'app'): Illuminate\Foundation\Application|Illuminate\Http\JsonResponse|Illuminate\Routing\Redirector|Illuminate\Http\RedirectResponse|Illuminate\Contracts\Foundation\Application
    {
        $request = Illuminate\Support\Facades\Request::instance();
        DB::beginTransaction();
        try {
            $ids = $request->input('ids');
            $idsDecode = [];
            $jumlah = 0;
            $titleDataColumn = $titleData;
            foreach ($ids as $id) {
                $master = $model::findOrfail(decodeId($id));
                if ($master) {
                    if ($master[$columnValidation] == 0) {
                        $idsDecode[] = decodeId($id);
                        $oldAttribute = $master->getOriginal();
                        $properties['old'] = $oldAttribute;
                        $titleDataColumn = $titleData.' '.$master[$columnRef];

                        activity()
                            ->useLog($logName)
                            ->causedBy(auth()->user())
                            ->performedOn($master)
                            ->withProperties($properties)
                            ->event('deleted')
                            ->log('delete '.$titleDataColumn);
                    }
                }
                ++$jumlah;
            }

            $deletedRows = $model::whereIn($primaryKey, $idsDecode)->delete();
            $desc = $deletedRows.' '.$titleData;
            if ($jumlah == 1) {
                $desc = $titleDataColumn;
            }

            DB::commit();

            $res['message'] = $desc.' deleted successfully';
            $res['success'] = true;
            if ($deletedRows == 0) {
                $res['message'] = 'no data '.$desc.' is deleted, make sure the data is non active';
                $res['success'] = false;
            }

            if ($request->wantsJson()) {
                return response()->json($res, Response::HTTP_OK);
            } else {
                return redirect($redirect)->with($res);
            }
        } catch (QueryException|\ErrorException $e) {
            DB::rollBack();
            $res['message'] = $e->getMessage();
            $res['success'] = false;
            if ($request->wantsJson()) {
                return response()->json($res, Response::HTTP_INTERNAL_SERVER_ERROR);
            } else {
                return redirect()->back()->withInput()->with($res);
            }
        } catch (ValidationException $e) {
            DB::rollback();
            $res['message'] = $e->errors();
            $res['success'] = false;
            if ($request->wantsJson()) {
                return response()->json($res, Response::HTTP_UNPROCESSABLE_ENTITY);
            } else {
                return redirect()->back()->withInput()->with($res);
            }
        } catch (\Exception $e) {
            DB::rollback();
            $res['message'] = $e;
            $res['success'] = false;
            if ($request->wantsJson()) {
                return response()->json($res, Response::HTTP_INTERNAL_SERVER_ERROR);
            } else {
                return redirect()->back()->withInput()->with($res);
            }
        }
    }
}

if (!function_exists('callJs')) {
    function callJs($fileName)
    {
        if (empty($fileName)) {
            return null;
        }

        return url('call-js/'.$fileName);
    }
}

if (!function_exists('list_tahun_manual')) {
    function list_tahun_manual()
    {
        $tahun_awal = 2019;
        $tahun_sekarang = date('Y');
        $res = [];
        for ($tahun_awal; $tahun_awal <= $tahun_sekarang; ++$tahun_awal) {
            $res[] = $tahun_awal;
        }

        return $res;
    }
}

if (!function_exists('addThumbPrefix')) {
    /**
     * Add "thumb_" prefix to a file path.
     *
     * @param string $filePath
     *
     * @return string
     */
    function addThumbPrefix($filePath)
    {
        if ($filePath) {
            $pathInfo = pathinfo($filePath);

            return $pathInfo['dirname'].'/thumb_'.$pathInfo['basename'];
        }

        return $filePath;
    }
}

if (!function_exists('rubah_input_angka_separator')) {
    function rubah_input_angka_separator($angka, $separator = '.')
    {
        $res = 0;
        if ($angka) {
            $res = str_replace([$separator, ',', ' '], ['', $separator, ''], $angka);
        }

        return $res;
    }
}
if (!function_exists('format_angka_indo')) {
    function format_angka_indo($angka)
    {
        $rupiah = number_format($angka, 0, ',', '.');

        return $rupiah;
    }
}

if (!function_exists('shortTglBulan')) {
    function shortTglBulan($date)
    {
        if ($date) {
            $BulanIndo = ['Jan', 'Feb', 'Mar', 'Apr', 'Mei', 'Jun', 'Jul', 'Agu', 'Sep', 'Okt', 'Nov', 'Des'];


            $bulan = substr($date, 5, 2);
            $tgl = substr($date, 8, 2);

            $result = $tgl.' '.$BulanIndo[(int) $bulan - 1];

            return $result;
        } else {
            return '';
        }
    }
}

if (!function_exists('TanggalIndo')) {
    function TanggalIndo($date)
    {
        if ($date) {
            $BulanIndo = ['Januari', 'Februari', 'Maret', 'April', 'Mei', 'Juni', 'Juli', 'Agustus', 'September', 'Oktober', 'November', 'Desember'];

            $tahun = substr($date, 0, 4);
            $bulan = substr($date, 5, 2);
            $tgl = substr($date, 8, 2);

            $result = $tgl.' '.$BulanIndo[(int) $bulan - 1].' '.$tahun;

            return $result;
        } else {
            return '';
        }
    }
}

if (!function_exists('TanggalIndo2')) {
    function TanggalIndo2($date)
    {
        if ($date) {
            $tahun = substr($date, 0, 4);
            $bulan = substr($date, 5, 2);
            $tgl = substr($date, 8, 2);

            $result = $tgl.'/'.$bulan.'/'.$tahun;

            return $result;
        } else {
            return '';
        }
    }
}

if (!function_exists('TanggalIndowaktu')) {
    function TanggalIndowaktu($date)
    {
        if ($date) {
            $tahun = substr($date, 0, 4);
            $bulan = substr($date, 5, 2);
            $tgl = substr($date, 8, 2);
            $waktu = substr($date, 11, 8);
            $result = $tgl.'/'.$bulan.'/'.$tahun.' '.$waktu;

            return $result;
        } else {
            return '';
        }
    }
}
if (!function_exists('BulanTahunIndo')) {
    function BulanTahunIndo($format_tgl)
    {
        $BulanIndo = ['Januari', 'Februari', 'Maret', 'April', 'Mei', 'Juni', 'Juli', 'Agustus', 'September', 'Oktober', 'November', 'Desember'];
        $tahun = substr($format_tgl, 0, 4);
        $bulan = substr($format_tgl, 5, 2);

        $tgl_indonesia = $BulanIndo[(int) $bulan - 1].' '.$tahun;

        return $tgl_indonesia;
    }
}

if (!function_exists('selisihWaktu')) {
    function selisihWaktu($createdAt)
    {
        $currentTime = Carbon::now();
        $createdAt = new Carbon($createdAt);

        return $createdAt->diffForHumans($currentTime);
    }
}

if (!function_exists('isStatusPengajuan')) {
    function isStatusPengajuan($value)
    {
        if ($value == 'Diterima') {
            return '<span class="badge bg-success">DITERIMA</span>';
        } elseif ($value == 'Diproses') {
            return '<span class="badge bg-primary">DIPROSES</span>';
        } elseif ($value == 'Ditolak') {
            return '<span class="badge bg-danger">DITOLAK</span>';
        }

        return '<span class="badge bg-warning">MENUNGGU</span>';
    }
}

if (!function_exists('isStatusBerkas')) {
    function isStatusBerkas($value)
    {
        if ($value == 'Sesuai') {
            return '<span class="badge bg-primary">SESUAI</span>';
        } else {
            return '<span class="badge bg-warning">TIDAK SESUAI</span>';
        }
    }
}

if (!function_exists('colorHighchartStatusPengajuan')) {
    function colorHighchartStatusPengajuan($value)
    {
        if ($value == 'Diterima') {
            return 'green';
        } elseif ($value == 'Diproses') {
            return 'blue';
        } elseif ($value == 'Ditolak') {
            return 'red';
        }

        return 'yellow';
    }
}

if (!function_exists('format_angka_normal')) {
    function format_angka_normal($angka)
    {
        //        $rupiah = number_format($angka, 0, ',', '.');

        return $angka;
    }
}
function getTheme($files)
{
    $result = \App\Models\Themes::where('active', 1)->first();
    if ($result) {
        return $result->folder.'.'.$files;
    } else {
        $result2 = \App\Models\Themes::where('id', '1')->first();

        return $result2->folder.'.'.$files;
    }
}

if (!function_exists('visitorWeb')) {
    function visitorWeb()
    {
        session_start();
        $session_id = session_id();
        $date = date('Y-m-d');
        $results = DB::select("SELECT * FROM `visitors` WHERE `session_id` = '".$session_id."' AND date_time = '".$date."' ");
        if (count($results) < 1) {
            $ip = getCLientIP();
            $visitor = [
                'session_id' => $session_id,
                'ip_client' => $ip,
                'user_agent' => $_SERVER['HTTP_USER_AGENT'],
                'date_time' => $date,
                'created_at' => now(),
                'updated_at' => now(),
            ];
            DB::table('visitors')->insert($visitor);
        }
    }
}
if (!function_exists('getCLientIP')) {
    function getCLientIP()
    {
        $client = @$_SERVER['HTTP_CLIENT_IP'];
        $forward = @$_SERVER['HTTP_X_FORWARDED_FOR'];
        $remote = $_SERVER['REMOTE_ADDR'];

        if (filter_var($client, FILTER_VALIDATE_IP)) {
            $ip = $client;
        } elseif (filter_var($forward, FILTER_VALIDATE_IP)) {
            $ip = $forward;
        } else {
            $ip = $remote;
        }

        return $ip;
    }
}
if (!function_exists('getIconStatusBooking')) {
    function getIconStatusBooking($colorText, $colorBG, $icon, $text)
    {
        return '<div><span class="badge text-'.$colorText.'" style="background-color: '.$colorBG.'">'.$icon.' '.$text.'</span></div>';
    }
}

if (!function_exists('getRowBatal')) {
    function getRowBatal()
    {
        $cek = \App\Models\StatusBooking::where('status_ketersediaan','batal')->first();
        if($cek)
        {
            return $cek;
        }
        return null;
    }
}



if (!function_exists('listTypeFile')) {
    function listTypeFile()
    {
        $list = [
            '.pdf','.docx', '.doc', '.xls', '.xlsx',  '.ppt', '.pptx',
        ];
        return $list;
    }
}


function removeIndoNumberSeparator($number)
{
    // Menghapus titik sebagai pemisah ribuan
    $number = str_replace('.', '', $number);

    // Mengganti koma dengan titik sebagai pemisah desimal
    $number = str_replace(',', '.', $number);

    // Mengembalikan angka dalam bentuk float atau integer
    return is_numeric($number) ? $number + 0 : 0;
}

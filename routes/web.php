<?php

use App\Http\Controllers\view\LogController;
use Illuminate\Support\Facades\Route;

/*
|--------------------------------------------------------------------------
| Web Routes
|--------------------------------------------------------------------------
|
| Here is where you can register web routes for your application. These
| routes are loaded by the RouteServiceProvider and all of them will
| be assigned to the "web" middleware group. Make something great!
|
*/

// Route::get('/', function () {
//    return view('panel.example.index');
// });



// Route::middleware('redirect_if_authenticated')->get('/', [\App\Http\Controllers\view\LoginController::class, 'index']);
// Route::middleware('redirect_if_authenticated')->get('login', [\App\Http\Controllers\view\LoginController::class, 'index'])->name('login');
// Route::post('verify-login', [\App\Http\Controllers\backend\AuthController::class, 'login']);
// Route::middleware('redirect_if_authenticated')->get('forgot-password', [\App\Http\Controllers\view\ForgotController::class, 'index'])->name('forgot-password');

// Route::middleware('redirect_if_authenticated')->get('reset-password', [\App\Http\Controllers\view\ForgotController::class, 'reset']);

Route::middleware('redirect_if_authenticated')->get('/', [\App\Http\Controllers\view\LoginController::class, 'index']);
Route::middleware('redirect_if_authenticated')->get('login', [\App\Http\Controllers\view\LoginController::class, 'index'])->name('login');
Route::post('verify-login', [\App\Http\Controllers\backend\AuthController::class, 'login']);
Route::middleware('redirect_if_authenticated')->get('forgot-password', [\App\Http\Controllers\view\ForgotController::class, 'index'])->name('forgot-password');
Route::middleware('redirect_if_authenticated')->get('reset-password', [\App\Http\Controllers\view\ForgotController::class, 'reset']);

Route::get('/get-setting-app/{name}', [\App\Http\Controllers\backend\IndexController::class, 'getSettingapp']);
Route::get('/berkas/{slashData?}', [\App\Http\Controllers\FileController::class, 'index'])->where('slashData', '(.*)');
Route::get('/call-js/{slashData?}', [\App\Http\Controllers\FileController::class, 'callJs'])->where('slashData', '(.*)');
Route::get("/layout", function () {
    return view("panel.layouts-horizontal");
});
Route::get('/clear-cache', function () {
    \Illuminate\Support\Facades\Artisan::call('cache:clear');
    \Illuminate\Support\Facades\Artisan::call('route:clear');
    \Illuminate\Support\Facades\Artisan::call('config:clear');
    \Illuminate\Support\Facades\Artisan::call('view:clear');

    return 'Cache is cleared';
});


Route::group(['prefix' => 'app', 'middleware' => ['web', 'auth']], function () {



    Route::get('account-nonactive', [\App\Http\Controllers\view\IndexController::class, 'nonaktif']);

    Route::get('logout', [App\Http\Controllers\backend\ProfileController::class, 'logout'])->name('logout'); //agar logout bisa tanpa user active
    Route::middleware(['checkActiveUser'])->group(function () {
        Route::get('/', [\App\Http\Controllers\view\IndexController::class, 'index']);
        Route::get('data-dashboard', [\App\Http\Controllers\backend\IndexController::class, 'getDashboard']);
        Route::get('datatable-notif', [\App\Http\Controllers\backend\IndexController::class, 'datatable_notif']);

        Route::post('upload-editor', [\App\Http\Controllers\backend\IndexController::class, 'uploadEditor']);

        Route::get('on-progress', [App\Http\Controllers\view\IndexController::class, 'onprogress'])->name('onprogress');

        Route::get('account', [App\Http\Controllers\view\ProfileController::class, 'account'])->name('account');
        Route::put('update-account', [App\Http\Controllers\backend\ProfileController::class, 'updateAccount'])->name('update-account');

        Route::get('change-password', [App\Http\Controllers\view\ProfileController::class, 'change_password'])->name('my-activity');
        Route::put('update-password', [App\Http\Controllers\backend\ProfileController::class, 'updatePassword'])->name('update-password');

        Route::get('my-activity', [App\Http\Controllers\view\ProfileController::class, 'activity'])->name('my-activity');
        Route::get('my-activity-data', [App\Http\Controllers\backend\ProfileController::class, 'paginateMyactivity'])->name('my-activity-data');
        Route::get('my-render-activity-data', [App\Http\Controllers\view\ProfileController::class, 'renderActivity']);

        Route::get('my-user', [App\Http\Controllers\backend\ProfileController::class, 'index'])->name('my-user');
        //            Route::get('my-profile', [App\Http\Controllers\api\ProfileController::class, 'index'])->name('my-profile');
        //            Route::put('update-profile', [App\Http\Controllers\api\ProfileController::class, 'updateAccount'])->name('update-profile');

        Route::get('settings', [App\Http\Controllers\view\SettingController::class, 'index'])->name('settings');
        Route::put('update-settings', [App\Http\Controllers\backend\SettingController::class, 'update_settings'])->name('update-settings');

        Route::group(['prefix' => 'activity-log'], function () {
            Route::get('/', [\App\Http\Controllers\view\ActivityLogController::class, 'index'])->name('app.activity-log');
            Route::get('datatable', [\App\Http\Controllers\backend\ActivityController::class, 'datatable']);
            Route::get('data', [\App\Http\Controllers\backend\ActivityController::class, 'index']);
            Route::delete('delete/{id}', [\App\Http\Controllers\backend\ActivityController::class, 'destroy']);
            Route::delete('bulk-delete', [\App\Http\Controllers\backend\ActivityController::class, 'bulkDelete']);
        });

        Route::group(['prefix' => 'permission'], function () {
            Route::get('/', [\App\Http\Controllers\view\PermissionController::class, 'index'])->name('app.permission');
            Route::get('datatable', [\App\Http\Controllers\backend\PermissionController::class, 'datatable']);
            Route::get('data', [\App\Http\Controllers\backend\PermissionController::class, 'index']);
            Route::post('store', [\App\Http\Controllers\backend\PermissionController::class, 'store']);
            Route::put('update/{id}', [\App\Http\Controllers\backend\PermissionController::class, 'update']);
            Route::delete('delete/{id}', [\App\Http\Controllers\backend\PermissionController::class, 'destroy']);
            Route::delete('bulk-delete', [\App\Http\Controllers\backend\PermissionController::class, 'bulkDelete']);
            Route::put('bulk-update', [\App\Http\Controllers\backend\PermissionController::class, 'bulkUpdate']);
            Route::get('check/{id}', [\App\Http\Controllers\backend\PermissionController::class, 'checkPermission']);
            Route::get('any/{id}', [\App\Http\Controllers\backend\PermissionController::class, 'anyPermission']);
            Route::get('remote', [\App\Http\Controllers\backend\PermissionController::class, 'remote']);
        });

        Route::group(['prefix' => 'role'], function () {
            Route::get('/', [\App\Http\Controllers\view\RoleController::class, 'index'])->name('app.role');
            Route::get('data', [\App\Http\Controllers\backend\RoleController::class, 'index']);
            Route::get('datatable', [\App\Http\Controllers\backend\RoleController::class, 'datatable']);
            Route::get('select-data', [\App\Http\Controllers\backend\RoleController::class, 'selectData']);
            Route::get('create', [\App\Http\Controllers\view\RoleController::class, 'create']);
            Route::post('store', [\App\Http\Controllers\backend\RoleController::class, 'store']);
            Route::get('edit/{id}', [\App\Http\Controllers\view\RoleController::class, 'edit']);
            Route::put('update/{id}', [\App\Http\Controllers\backend\RoleController::class, 'update']);
            Route::delete('delete/{id}', [\App\Http\Controllers\backend\RoleController::class, 'destroy']);
            Route::delete('bulk-delete', [\App\Http\Controllers\backend\RoleController::class, 'bulkDelete']);
            Route::put('bulk-update', [\App\Http\Controllers\backend\RoleController::class, 'bulkUpdate']);
            Route::get('detail/{id}', [\App\Http\Controllers\view\RoleController::class, 'detail']);
            Route::get('remote', [\App\Http\Controllers\backend\RoleController::class, 'remote']);
        });

        Route::group(['prefix' => 'users'], function () {
            Route::get('/', [\App\Http\Controllers\view\UserController::class, 'index'])->name('app.users');
            Route::get('data', [\App\Http\Controllers\backend\UserController::class, 'index']);
            Route::get('datatable', [\App\Http\Controllers\backend\UserController::class, 'datatable']);
            Route::post('store', [\App\Http\Controllers\backend\UserController::class, 'store']);
            Route::put('update/{id}', [\App\Http\Controllers\backend\UserController::class, 'update']);
            Route::delete('delete/{id}', [\App\Http\Controllers\backend\UserController::class, 'destroy']);
            Route::delete('bulk-delete', [\App\Http\Controllers\backend\UserController::class, 'bulkDelete']);
            Route::put('bulk-update', [\App\Http\Controllers\backend\UserController::class, 'bulkUpdate']);
            Route::get('remote', [\App\Http\Controllers\backend\UserController::class, 'remote']);
            Route::get('remote-pic', [\App\Http\Controllers\backend\UserController::class, 'remote_pic']);
        });

        Route::group(['prefix' => 'aktivitas'], function () {
            Route::get('/', [LogController::class, 'index']);
            Route::get('data', [LogController::class, 'data']);
            Route::delete('delete/{id}', [LogController::class, 'destroy']);
            Route::post('bulkDelete', [LogController::class, 'bulkDelete']);
        });



        Route::group(['prefix' => 'misi-pemda'], function () {
            Route::get('/', [\App\Http\Controllers\view\MisiPemdaController::class, 'index'])->name('app.misi-pemda');
            Route::get('datatable', [\App\Http\Controllers\backend\MisiPemdaController::class, 'datatable']);
            Route::get('data', [\App\Http\Controllers\backend\MisiPemdaController::class, 'index']);
            Route::get('show/{id}', [\App\Http\Controllers\backend\MisiPemdaController::class, 'show']);
            Route::post('store', [\App\Http\Controllers\backend\MisiPemdaController::class, 'store']);
            Route::post('store-bulk', [\App\Http\Controllers\backend\MisiPemdaController::class, 'storeBulk']);
            Route::put('update/{id}', [\App\Http\Controllers\backend\MisiPemdaController::class, 'update']);
            Route::delete('delete/{id}', [\App\Http\Controllers\backend\MisiPemdaController::class, 'destroy']);
            Route::delete('bulk-delete', [\App\Http\Controllers\backend\MisiPemdaController::class, 'bulkDelete']);
            Route::put('bulk-update', [\App\Http\Controllers\backend\MisiPemdaController::class, 'bulkUpdate']);
            Route::get('select-data', [\App\Http\Controllers\backend\MisiPemdaController::class, 'selectData']);
            Route::get('remote', [\App\Http\Controllers\backend\MisiPemdaController::class, 'remote']);
        });

        Route::group(['prefix' => 'urusan'], function () {
            Route::get('/', [\App\Http\Controllers\view\UrusanController::class, 'index'])->name('app.urusan');
            Route::get('datatable', [\App\Http\Controllers\backend\UrusanController::class, 'datatable']);
            Route::get('data', [\App\Http\Controllers\backend\UrusanController::class, 'index']);
            Route::get('show/{id}', [\App\Http\Controllers\backend\UrusanController::class, 'show']);
            Route::post('store', [\App\Http\Controllers\backend\UrusanController::class, 'store']);
            Route::post('store-bulk', [\App\Http\Controllers\backend\UrusanController::class, 'storeBulk']);
            Route::put('update/{id}', [\App\Http\Controllers\backend\UrusanController::class, 'update']);
            Route::delete('delete/{id}', [\App\Http\Controllers\backend\UrusanController::class, 'destroy']);
            Route::delete('bulk-delete', [\App\Http\Controllers\backend\UrusanController::class, 'bulkDelete']);
            Route::put('bulk-update', [\App\Http\Controllers\backend\UrusanController::class, 'bulkUpdate']);
            Route::get('select-data', [\App\Http\Controllers\backend\UrusanController::class, 'selectData']);
            Route::get('remote', [\App\Http\Controllers\backend\UrusanController::class, 'remote']);
            Route::get('remoteajax', [\App\Http\Controllers\backend\UrusanController::class, 'remoteajax']);
            Route::get('kode-rekening/{id}', [\App\Http\Controllers\backend\UrusanController::class, 'getKodeRekening']);
        });

        Route::group(['prefix' => 'sub-urusan'], function () {
            Route::get('/', [\App\Http\Controllers\view\SubUrusanController::class, 'index'])->name('app.sub-urusan');
            Route::get('datatable', [\App\Http\Controllers\backend\SubUrusanController::class, 'datatable']);
            Route::get('data', [\App\Http\Controllers\backend\SubUrusanController::class, 'index']);
            Route::get('show/{id}', [\App\Http\Controllers\backend\SubUrusanController::class, 'show']);
            Route::post('store', [\App\Http\Controllers\backend\SubUrusanController::class, 'store']);
            Route::post('store-bulk', [\App\Http\Controllers\backend\SubUrusanController::class, 'storeBulk']);
            Route::put('update/{id}', [\App\Http\Controllers\backend\SubUrusanController::class, 'update']);
            Route::delete('delete/{id}', [\App\Http\Controllers\backend\SubUrusanController::class, 'destroy']);
            Route::delete('bulk-delete', [\App\Http\Controllers\backend\SubUrusanController::class, 'bulkDelete']);
            Route::put('bulk-update', [\App\Http\Controllers\backend\SubUrusanController::class, 'bulkUpdate']);
            Route::get('select-data', [\App\Http\Controllers\backend\SubUrusanController::class, 'selectData']);
            Route::get('remote', [\App\Http\Controllers\backend\SubUrusanController::class, 'remote']);
            Route::get('remoteajax', [\App\Http\Controllers\backend\SubUrusanController::class, 'remoteajax']);
            Route::get('kode-rekening/{id}', [\App\Http\Controllers\backend\SubUrusanController::class, 'getKodeRekening']);
            Route::get('/{id}', [\App\Http\Controllers\view\SubUrusanController::class, 'getSubUrusan']);
        });

        Route::group(['prefix' => 'program'], function () {
            Route::get('/', [\App\Http\Controllers\view\ProgramController::class, 'index'])->name('app.program');
            Route::get('datatable', [\App\Http\Controllers\backend\ProgramController::class, 'datatable']);
            Route::get('data', [\App\Http\Controllers\backend\ProgramController::class, 'index']);
            Route::get('show/{id}', [\App\Http\Controllers\backend\ProgramController::class, 'show']);
            Route::post('store', [\App\Http\Controllers\backend\ProgramController::class, 'store']);
            Route::post('store-bulk', [\App\Http\Controllers\backend\ProgramController::class, 'storeBulk']);
            Route::put('update/{id}', [\App\Http\Controllers\backend\ProgramController::class, 'update']);
            Route::delete('delete/{id}', [\App\Http\Controllers\backend\ProgramController::class, 'destroy']);
            Route::delete('bulk-delete', [\App\Http\Controllers\backend\ProgramController::class, 'bulkDelete']);
            Route::delete('unker-delete', [\App\Http\Controllers\backend\ProgramController::class, 'unkerDelete']);
            Route::put('bulk-update', [\App\Http\Controllers\backend\ProgramController::class, 'bulkUpdate']);
            Route::get('select-data', [\App\Http\Controllers\backend\ProgramController::class, 'selectData']);
            Route::get('remote', [\App\Http\Controllers\backend\ProgramController::class, 'remote']);
            Route::post('input-detail', [\App\Http\Controllers\backend\ProgramController::class, 'inputDetail']);
            Route::delete('hapus-detail/{id}', [\App\Http\Controllers\backend\ProgramController::class, 'hapusDetail']);
        });

        Route::group(['prefix' => 'kegiatan'], function () {
            Route::get('/', [\App\Http\Controllers\view\KegiatanController::class, 'index'])->name('app.Kegiatan');
            Route::get('datatable', [\App\Http\Controllers\backend\KegiatanController::class, 'datatable']);
            Route::get('data', [\App\Http\Controllers\backend\KegiatanController::class, 'index']);
            Route::get('show/{id}', [\App\Http\Controllers\backend\KegiatanController::class, 'show']);
            Route::post('store', [\App\Http\Controllers\backend\KegiatanController::class, 'store']);
            Route::post('store-bulk', [\App\Http\Controllers\backend\KegiatanController::class, 'storeBulk']);
            Route::put('update/{id}', [\App\Http\Controllers\backend\KegiatanController::class, 'update']);
            Route::delete('delete/{id}', [\App\Http\Controllers\backend\KegiatanController::class, 'destroy']);
            Route::delete('bulk-delete', [\App\Http\Controllers\backend\KegiatanController::class, 'bulkDelete']);
            Route::delete('unker-delete', [\App\Http\Controllers\backend\KegiatanController::class, 'unkerDelete']);
            Route::put('bulk-update', [\App\Http\Controllers\backend\KegiatanController::class, 'bulkUpdate']);
            Route::get('select-data', [\App\Http\Controllers\backend\KegiatanController::class, 'selectData']);
            Route::get('remote', [\App\Http\Controllers\backend\KegiatanController::class, 'remote']);
            Route::post('input-detail', [\App\Http\Controllers\backend\KegiatanController::class, 'inputDetail']);
            Route::delete('hapus-detail/{id}', [\App\Http\Controllers\backend\KegiatanController::class, 'hapusDetail']);
        });

        Route::group(['prefix' => 'sub-kegiatan'], function () {
            Route::get('/', [\App\Http\Controllers\view\SubKegiatanController::class, 'index'])->name('app.sub-kegiatan');
            Route::get('datatable', [\App\Http\Controllers\backend\SubKegiatanController::class, 'datatable']);
            Route::get('data', [\App\Http\Controllers\backend\SubKegiatanController::class, 'index']);
            Route::get('show/{id}', [\App\Http\Controllers\backend\SubKegiatanController::class, 'show']);
            Route::post('store', [\App\Http\Controllers\backend\SubKegiatanController::class, 'store']);
            Route::post('store-bulk', [\App\Http\Controllers\backend\SubKegiatanController::class, 'storeBulk']);
            Route::put('update/{id}', [\App\Http\Controllers\backend\SubKegiatanController::class, 'update']);
            Route::delete('delete/{id}', [\App\Http\Controllers\backend\SubKegiatanController::class, 'destroy']);
            Route::delete('bulk-delete', [\App\Http\Controllers\backend\SubKegiatanController::class, 'bulkDelete']);
            Route::delete('unker-delete', [\App\Http\Controllers\backend\SubKegiatanController::class, 'unkerDelete']);
            Route::put('bulk-update', [\App\Http\Controllers\backend\SubKegiatanController::class, 'bulkUpdate']);
            Route::get('select-data', [\App\Http\Controllers\backend\SubKegiatanController::class, 'selectData']);
            Route::get('remote', [\App\Http\Controllers\backend\SubKegiatanController::class, 'remote']);
            Route::get('remoteajax', [\App\Http\Controllers\backend\SubKegiatanController::class, 'remoteajax']);
            Route::get('kode-rekening/{id}', [\App\Http\Controllers\backend\SubKegiatanController::class, 'getKodeRekening']);
            Route::get('/{id}', [\App\Http\Controllers\view\SubKegiatanController::class, 'getSubKegiatan']);
            Route::post('input-detail', [\App\Http\Controllers\backend\SubKegiatanController::class, 'inputDetail']);
            Route::delete('hapus-detail/{id}', [\App\Http\Controllers\backend\SubKegiatanController::class, 'hapusDetail']);
        });

        Route::group(['prefix' => 'unit-kerja'], function () {
            Route::get('/', [\App\Http\Controllers\view\UnitKerjaController::class, 'index'])->name('app.UnitKerja');
            Route::get('datatable', [\App\Http\Controllers\backend\UnitKerjaController::class, 'datatable']);
            Route::get('data', [\App\Http\Controllers\backend\UnitKerjaController::class, 'index']);
            Route::get('show/{id}', [\App\Http\Controllers\backend\UnitKerjaController::class, 'show']);
            Route::post('store', [\App\Http\Controllers\backend\UnitKerjaController::class, 'store']);
            Route::post('store-bulk', [\App\Http\Controllers\backend\UnitKerjaController::class, 'storeBulk']);
            Route::put('update/{id}', [\App\Http\Controllers\backend\UnitKerjaController::class, 'update']);
            Route::delete('delete/{id}', [\App\Http\Controllers\backend\UnitKerjaController::class, 'destroy']);
            Route::delete('bulk-delete', [\App\Http\Controllers\backend\UnitKerjaController::class, 'bulkDelete']);
            Route::put('bulk-update', [\App\Http\Controllers\backend\UnitKerjaController::class, 'bulkUpdate']);
            Route::get('select-data', [\App\Http\Controllers\backend\UnitKerjaController::class, 'selectData']);
            Route::get('remote', [\App\Http\Controllers\backend\UnitKerjaController::class, 'remote']);
            Route::get('remote-detail-master', [\App\Http\Controllers\backend\UnitKerjaController::class, 'remoteDetailMaster']);
            Route::get('remote-detail-program-master', [\App\Http\Controllers\backend\UnitKerjaController::class, 'remoteDetailProgramMaster']);
            Route::get('remote-detail-sub-kegiatan-master', [\App\Http\Controllers\backend\UnitKerjaController::class, 'remoteDetailSubKegiatanMaster']);
        });

        Route::group(['prefix' => 'program-detail'], function () {
            Route::get('/', [\App\Http\Controllers\view\ProgramDetailController::class, 'index'])->name('app.ProgramDetail');
            Route::get('datatable', [\App\Http\Controllers\backend\ProgramDetailController::class, 'datatable']);
            Route::get('data', [\App\Http\Controllers\backend\ProgramDetailController::class, 'index']);
            Route::get('show/{id}', [\App\Http\Controllers\backend\ProgramDetailController::class, 'show']);
            Route::post('store', [\App\Http\Controllers\backend\ProgramDetailController::class, 'store']);
            Route::post('store-bulk', [\App\Http\Controllers\backend\ProgramDetailController::class, 'storeBulk']);
            Route::put('update/{id}', [\App\Http\Controllers\backend\ProgramDetailController::class, 'update']);
            Route::delete('delete/{id}', [\App\Http\Controllers\backend\ProgramDetailController::class, 'destroy']);
            Route::delete('bulk-delete', [\App\Http\Controllers\backend\ProgramDetailController::class, 'bulkDelete']);
            Route::put('bulk-update', [\App\Http\Controllers\backend\ProgramDetailController::class, 'bulkUpdate']);
            Route::get('select-data', [\App\Http\Controllers\backend\ProgramDetailController::class, 'selectData']);
            Route::get('remote', [\App\Http\Controllers\backend\ProgramDetailController::class, 'remote']);
        });

        Route::group(['prefix' => 'sumber-dana'], function () {
            Route::get('/', [\App\Http\Controllers\view\SumberDanaController::class, 'index'])->name('app.SumberDana');
            Route::get('datatable', [\App\Http\Controllers\backend\SumberDanaController::class, 'datatable']);
            Route::get('data', [\App\Http\Controllers\backend\SumberDanaController::class, 'index']);
            Route::get('show/{id}', [\App\Http\Controllers\backend\SumberDanaController::class, 'show']);
            Route::post('store', [\App\Http\Controllers\backend\SumberDanaController::class, 'store']);
            Route::post('store-bulk', [\App\Http\Controllers\backend\SumberDanaController::class, 'storeBulk']);
            Route::put('update/{id}', [\App\Http\Controllers\backend\SumberDanaController::class, 'update']);
            Route::delete('delete/{id}', [\App\Http\Controllers\backend\SumberDanaController::class, 'destroy']);
            Route::delete('bulk-delete', [\App\Http\Controllers\backend\SumberDanaController::class, 'bulkDelete']);
            Route::put('bulk-update', [\App\Http\Controllers\backend\SumberDanaController::class, 'bulkUpdate']);
            Route::get('select-data', [\App\Http\Controllers\backend\SumberDanaController::class, 'selectData']);
            Route::get('remote', [\App\Http\Controllers\backend\SumberDanaController::class, 'remote']);
        });

        Route::group(['prefix' => 'indikator'], function () {
            Route::get('/', [\App\Http\Controllers\view\IndikatorController::class, 'index'])->name('app.indikator');
            Route::get('datatable', [\App\Http\Controllers\backend\IndikatorController::class, 'datatable']);
            Route::get('data', [\App\Http\Controllers\backend\IndikatorController::class, 'index']);
            Route::get('show/{id}', [\App\Http\Controllers\backend\IndikatorController::class, 'show']);
            Route::post('store', [\App\Http\Controllers\backend\IndikatorController::class, 'store']);
            Route::post('store-bulk', [\App\Http\Controllers\backend\IndikatorController::class, 'storeBulk']);
            Route::put('update/{id}', [\App\Http\Controllers\backend\IndikatorController::class, 'update']);
            Route::delete('delete/{id}', [\App\Http\Controllers\backend\IndikatorController::class, 'destroy']);
            Route::delete('bulk-delete', [\App\Http\Controllers\backend\IndikatorController::class, 'bulkDelete']);
            Route::put('bulk-update', [\App\Http\Controllers\backend\IndikatorController::class, 'bulkUpdate']);
            Route::get('select-data', [\App\Http\Controllers\backend\IndikatorController::class, 'selectData']);
            Route::get('remote', [\App\Http\Controllers\backend\IndikatorController::class, 'remote']);
            Route::get('remoteajax', [\App\Http\Controllers\backend\IndikatorController::class, 'remoteajax']);
            Route::get('/{id}', [\App\Http\Controllers\view\IndikatorController::class, 'getSubKegiatan']);
        });

        Route::group(['prefix' => 'iku-opd'], function () {
            Route::get('/', [\App\Http\Controllers\view\IkuOpdController::class, 'index'])->name('app.iku-opd');
            Route::get('datatable', [\App\Http\Controllers\backend\IkuOpdController::class, 'datatable']);
            Route::get('data', [\App\Http\Controllers\backend\IkuOpdController::class, 'index']);
            Route::get('show/{id}', [\App\Http\Controllers\backend\IkuOpdController::class, 'show']);
            Route::post('store', [\App\Http\Controllers\backend\IkuOpdController::class, 'store']);
            Route::post('store-bulk', [\App\Http\Controllers\backend\IkuOpdController::class, 'storeBulk']);
            Route::put('update/{id}', [\App\Http\Controllers\backend\IkuOpdController::class, 'update']);
            Route::delete('delete/{id}', [\App\Http\Controllers\backend\IkuOpdController::class, 'destroy']);
            Route::delete('bulk-delete', [\App\Http\Controllers\backend\IkuOpdController::class, 'bulkDelete']);
            Route::put('bulk-update', [\App\Http\Controllers\backend\IkuOpdController::class, 'bulkUpdate']);
            Route::get('select-data', [\App\Http\Controllers\backend\IkuOpdController::class, 'selectData']);
            Route::get('remote', [\App\Http\Controllers\backend\IkuOpdController::class, 'remote']);
            Route::get('remoteajax', [\App\Http\Controllers\backend\IkuOpdController::class, 'remoteajax']);
            Route::get('remote/satuan', [\App\Http\Controllers\backend\IkuOpdController::class, 'remote_satuan']);
            Route::get('/{id}', [\App\Http\Controllers\view\IkuOpdController::class, 'getSubKegiatan']);
        });

        Route::group(['prefix' => 'iku-rpjmd'], function () {
            Route::get('/', [\App\Http\Controllers\view\IkuRpjmdController::class, 'index'])->name('app.iku-rpjmd');
            Route::get('datatable', [\App\Http\Controllers\backend\IkuRpjmdController::class, 'datatable']);
            Route::get('data', [\App\Http\Controllers\backend\IkuRpjmdController::class, 'index']);
            Route::get('show/{id}', [\App\Http\Controllers\backend\IkuRpjmdController::class, 'show']);
            Route::post('store', [\App\Http\Controllers\backend\IkuRpjmdController::class, 'store']);
            Route::post('store-bulk', [\App\Http\Controllers\backend\IkuRpjmdController::class, 'storeBulk']);
            Route::put('update/{id}', [\App\Http\Controllers\backend\IkuRpjmdController::class, 'update']);
            Route::delete('delete/{id}', [\App\Http\Controllers\backend\IkuRpjmdController::class, 'destroy']);
            Route::delete('bulk-delete', [\App\Http\Controllers\backend\IkuRpjmdController::class, 'bulkDelete']);
            Route::put('bulk-update', [\App\Http\Controllers\backend\IkuRpjmdController::class, 'bulkUpdate']);
            Route::get('select-data', [\App\Http\Controllers\backend\IkuRpjmdController::class, 'selectData']);
            Route::get('remote', [\App\Http\Controllers\backend\IkuRpjmdController::class, 'remote']);
            Route::get('remoteajax', [\App\Http\Controllers\backend\IkuRpjmdController::class, 'remoteajax']);
            Route::get('remote/satuan', [\App\Http\Controllers\backend\IkuRpjmdController::class, 'remote_satuan']);
            Route::get('remote/misi-pemda', [\App\Http\Controllers\backend\IkuRpjmdController::class, 'remote_misi_pemda']);
            Route::get('/{id}', [\App\Http\Controllers\view\IkuRpjmdController::class, 'getSubKegiatan']);
        });

        Route::group(['prefix' => 'tickets'], function () {
            Route::get('/', [\App\Http\Controllers\view\TicketsController::class, 'index'])->name('app.tickets');
            Route::get('datatable', [\App\Http\Controllers\backend\TicketsController::class, 'datatable']);
            Route::post('buat-tiket', [\App\Http\Controllers\backend\TicketsController::class, 'store']);
            Route::get('show/{id}', [\App\Http\Controllers\backend\TicketsController::class, 'show']);
            Route::get('/pesan-tiket/{id}', [\App\Http\Controllers\backend\TicketsController::class, 'dataMessageTiket']);
            Route::get('/detail-tiket/{id}', [\App\Http\Controllers\view\TicketsController::class, 'detail'])->name('app.detail');
            Route::put('/update-status/{id}', [\App\Http\Controllers\backend\TicketsController::class, 'ubahStatus']);
        });
        Route::group(['prefix' => 'pesan'], function () {
            Route::post('/kirim-pesan', [\App\Http\Controllers\backend\MessageController::class, 'store']);
            Route::get('/pesan-tiket/{id}', [\App\Http\Controllers\backend\MessageController::class, 'dataMessageTiket']);
        });
    });
});

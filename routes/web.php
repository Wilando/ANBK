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
        Route::group(['prefix' => 'soal'], function () {
            Route::get('/', [\App\Http\Controllers\view\SoalController::class, 'index'])->name('app.soal');
            Route::get('datatable', [\App\Http\Controllers\backend\SoalController::class, 'datatable']);
            Route::get('data', [\App\Http\Controllers\backend\SoalController::class, 'index']);
            Route::get('show/{id}', [\App\Http\Controllers\backend\SoalController::class, 'show']);
            Route::post('store', [\App\Http\Controllers\backend\SoalController::class, 'store']);
            Route::post('store-bulk', [\App\Http\Controllers\backend\SoalController::class, 'storeBulk']);
            Route::put('update/{id}', [\App\Http\Controllers\backend\SoalController::class, 'update']);
            Route::delete('delete/{id}', [\App\Http\Controllers\backend\SoalController::class, 'destroy']);
            Route::delete('bulk-delete', [\App\Http\Controllers\backend\SoalController::class, 'bulkDelete']);
            Route::put('bulk-update', [\App\Http\Controllers\backend\SoalController::class, 'bulkUpdate']);
            Route::get('select-data', [\App\Http\Controllers\backend\SoalController::class, 'selectData']);
            Route::get('remote', [\App\Http\Controllers\backend\SoalController::class, 'remote']);
        });
        Route::group(['prefix' => 'ujian'], function () {
            Route::get('/', [\App\Http\Controllers\view\UjianController::class, 'index'])->name('app.ujian');
            Route::get('datatable', [\App\Http\Controllers\backend\UjianController::class, 'datatable']);
            Route::get('data', [\App\Http\Controllers\backend\UjianController::class, 'index']);
            Route::get('show/{id}', [\App\Http\Controllers\backend\UjianController::class, 'show']);
            Route::post('store', [\App\Http\Controllers\backend\UjianController::class, 'store']);
            Route::post('store-bulk', [\App\Http\Controllers\backend\UjianController::class, 'storeBulk']);
            Route::put('update/{id}', [\App\Http\Controllers\backend\UjianController::class, 'update']);
            Route::delete('delete/{id}', [\App\Http\Controllers\backend\UjianController::class, 'destroy']);
            Route::delete('bulk-delete', [\App\Http\Controllers\backend\UjianController::class, 'bulkDelete']);
            Route::put('bulk-update', [\App\Http\Controllers\backend\UjianController::class, 'bulkUpdate']);
            Route::get('select-data', [\App\Http\Controllers\backend\UjianController::class, 'selectData']);
            Route::get('remote', [\App\Http\Controllers\backend\UjianController::class, 'remote']);
        });
    });
});

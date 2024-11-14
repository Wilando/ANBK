<?php

use Illuminate\Support\Facades\Route;
use App\Http\Controllers\language\LanguageController;
use App\Http\Controllers\pages\HomePage;
use App\Http\Controllers\pages\Page2;
use App\Http\Controllers\pages\MiscError;
use App\Http\Controllers\authentications\LoginBasic;
use App\Http\Controllers\pages\UserManagement\UserList;
use App\Http\Controllers\pages\UserManagement\RolePermission;

// locale
Route::get('/lang/{locale}', [LanguageController::class, 'swap']);
Route::get('/pages/misc-error', [MiscError::class, 'index'])->name('pages-misc-error');

// authentication
Route::get('/', [LoginBasic::class, 'index'])->name('login');
// Route::get('/auth/register-basic', [RegisterBasic::class, 'index'])->name('auth-register-basic');

// Route With Guard
Route::group(['middleware' => ["web", 'auth:sanctum']], function () {
    Route::prefix('user-management')->group(function () {
        Route::get('/list-user', [UserList::class, 'index'])->name('user-list');
        Route::get('/role-dan-permission', [RolePermission::class, 'index'])->name('role-dan-permission');
    });
    Route::get('/dashboard', [HomePage::class, 'index'])->name('dashboard');
    Route::get('/page-2', [Page2::class, 'index'])->name('pages-page-2');
});

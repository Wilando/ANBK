<?php

use Illuminate\Http\Request;
use Illuminate\Support\Facades\Route;
use App\Http\Controllers\authentications\AuthController;
use App\Http\Controllers\UserController;

Route::get('/user', function (Request $request) {
    return $request->user();
})->middleware('auth:sanctum');

// Open Routes
Route::post('/register', [AuthController::class, 'register']);
Route::post('/login', [AuthController::class, 'login']);

// Protected Routes
Route::group(['middleware' => 'auth:sanctum'], function () {
  Route::prefix('user')->group(function () {
      Route::get('/profile', [AuthController::class, 'profile']);
      Route::get('/list-user', [UserController::class, 'listUser']);
  });
  
  Route::get('/logout', [AuthController::class, 'logout'])->name('logout');
});
<?php

use Illuminate\Support\Facades\Route;

/*
|--------------------------------------------------------------------------
| Web Routes
|--------------------------------------------------------------------------
|
| Here is where you can register web routes for your application. These
| routes are loaded by the RouteServiceProvider within a group which
| contains the "web" middleware group. Now create something great!
|
*/

Route::get('/', function () {
    return view('welcome');
});

//soal point 2 dan javascript ada
Route::get('helper', function () {
    $data = [1, -1, 3, -4, 5, -2, 7, 4, 2];
    return \App\Traits\Helper::checkPairPositive($data);
});

Auth::routes();

//Route::get('/home', [App\Http\Controllers\HomeController::class, 'index'])->name('home');
//soal point 1
Route::get('/products', [App\Http\Controllers\ProductController::class, 'index'])->name('products.index');

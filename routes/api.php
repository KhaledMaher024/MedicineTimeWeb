<?php

/*
|--------------------------------------------------------------------------
| API Routes
|--------------------------------------------------------------------------
|
| Here is where you can register API routes for your application. These
| routes are loaded by the RouteServiceProvider within a group which
| is assigned the "api" middleware group. Enjoy building your API!
|
*/

// Route::middleware('auth:api')->get('/user', function (Request $request) {
//     return $request->user();
// });

// Route::middleware('auth:api')->get('/view', function (Request $request) {
//     return $request->view();
// });

/**
 * Doctor routes
 */
Route::get('/doctor', 'Api\UsersController@getProfile');
Route::get('/doctor/{id}', 'Api\UsersController@getProfile');
Route::post('/doctor/create', 'Api\UsersController@createProfile');
Route::post('/doctor/edit/{id}', 'Api\UsersController@updateProfile');
Route::post('/doctor/{id}/pationts', 'Api\UsersController@syncPationts');

//#2
Route::post('/patient/edit/{id}', 'Api\PatientsController@updatePatientProfile');

//#3
Route::get('/patient/showReview/{id}', 'Api\PatVisitingsController@getReviewTime');

// Route::get('/login', 'Api\UsersController@login');
// Route::post('/register', 'Api\UsersController@register');

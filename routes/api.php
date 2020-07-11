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

/**
 * Patient routes
 */
Route::get('/patient/{id}', 'Api\PatientsController@getPatientInfo');
Route::post('/patient/{id}/edit', 'Api\PatientsController@updatePatientInfo');
Route::post('/patient/{id}/doctor', 'Api\PatientsController@getDoctorInfo');
Route::get('/patient/{id}/clinic', 'Api\PatientsController@getClinicInfo');

/**
 *
 */
Route::get('/patient/{id}/reviews', 'Api\PatientsController@getTimeReviews');
